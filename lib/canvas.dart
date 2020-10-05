import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/edge_data.dart';
import 'package:provider/provider.dart';

import 'edge_line.dart';
import 'item.dart';
import 'model/canvas_model.dart';
import 'model/item_data.dart';
import 'model/menu_item_data.dart';

double mouseScaleSpeed = 0.8;

double maxScale = 8.0;
double minScale = 0.1;

class DiagramEditorCanvas extends StatefulWidget {
  const DiagramEditorCanvas({
    Key key,
  }) : super(key: key);

  @override
  _DiagramEditorCanvasState createState() => _DiagramEditorCanvasState();
}

class _DiagramEditorCanvasState extends State<DiagramEditorCanvas>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  double _baseScaleFactor = 1.0;
  Offset _basePosition = Offset(0, 0);

  Offset _lastFocalPoint = Offset(0, 0);

  Offset _transformPosition = Offset(0, 0);
  double _transformScale = 1.0;

  bool canUpdateCanvasData = false;

  _onScaleStart(ScaleStartDetails details, CanvasModel canvasProvider) {
    _baseScaleFactor = canvasProvider.scale;
    _basePosition = canvasProvider.position;

    _lastFocalPoint = details.focalPoint;
    // _animationController.repeat();
  }

  _onScaleUpdate(ScaleUpdateDetails details, CanvasModel canvasProvider) {
    if (canUpdateCanvasData) {
      _animationController.repeat();
      updateProviderWithLastValues(canvasProvider);

      double previousScale = _transformScale;

      _transformPosition += details.focalPoint - _lastFocalPoint;
      _transformScale = keepScaleInBounds(details.scale, _baseScaleFactor);

      var focalPoint = (details.localFocalPoint - _transformPosition);
      var focalPointScaled = focalPoint * (_transformScale / previousScale);

      _lastFocalPoint = details.focalPoint;

      _transformPosition += focalPoint - focalPointScaled;

      print('update: $_transformPosition, $_transformScale');
      _animationController.reset();
    }
  }

  _onScaleEnd(CanvasModel canvasProvider) {
    if (canUpdateCanvasData) {
      updateProviderWithLastValues(canvasProvider);
    }

    _animationController.reset();

    _transformPosition = Offset(0, 0);
    _transformScale = 1.0;

    canvasProvider.notifyCanvasListeners();
  }

  updateProviderWithLastValues(CanvasModel canvasProvider) {
    canvasProvider.setCanvasData(
        (_basePosition * _transformScale) + _transformPosition,
        _transformScale * _baseScaleFactor);
    canUpdateCanvasData = false;
  }

  void _receivedPointerSignal(
      PointerSignalEvent event, CanvasModel canvasProvider) {
    if (event is PointerScrollEvent) {
      double scaleChange =
          event.scrollDelta.dy < 0 ? (1 / mouseScaleSpeed) : (mouseScaleSpeed);

      scaleChange = keepScaleInBounds(scaleChange, canvasProvider.scale);

      if (scaleChange == 0.0) {
        return;
      }

      double previousScale = canvasProvider.scale;

      canvasProvider.updateCanvasScale(scaleChange);

      var focalPoint = (event.localPosition - canvasProvider.position);
      var focalPointScaled =
          focalPoint * (canvasProvider.scale / previousScale);

      canvasProvider.updateCanvasPosition(focalPoint - focalPointScaled);
      canvasProvider.notifyCanvasListeners();
    }
  }

  void _onAcceptWithDetails(
      DragTargetDetails details, BuildContext context, canvasProvider) {
    setState(() {
      final RenderBox renderBox = context.findRenderObject();
      final Offset localOffset = renderBox.globalToLocal(details.offset);

      canvasProvider.addItemToList(
        ItemData(
          id: canvasProvider.generateNextItemId,
          color: details.data.color,
          size: details.data.size,
          position:
              (localOffset - canvasProvider.position) / canvasProvider.scale,
        ),
      );
    });
  }

  double keepScaleInBounds(double scale, double canvasScale) {
    double scaleResult = scale;
    if (scale * canvasScale <= minScale) {
      scaleResult = minScale / canvasScale;
    }
    if (scale * canvasScale >= maxScale) {
      scaleResult = maxScale / canvasScale;
    }
    return scaleResult;
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('CANVAS build');

    var canvasProvider = Provider.of<CanvasModel>(context, listen: false);
    print('${canvasProvider.position}');
    return Listener(
      onPointerSignal: (event) => _receivedPointerSignal(event, canvasProvider),
      child: GestureDetector(
        child: Container(
          color: Color.fromARGB(255, 148, 41, 111),
          child: ClipRect(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget child) {
                canUpdateCanvasData = true;
                return Transform(
                  transform: Matrix4.identity()
                    ..translate(_transformPosition.dx, _transformPosition.dy)
                    ..scale(_transformScale),
                  child: child,
                );
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    // it's here, because DragTarget outside is lagging (draggable cannot be accepted when user drops it on an item)
                    child: DragTarget<MenuItemData>(
                      builder: (BuildContext context,
                          List<MenuItemData> candidateData,
                          List<dynamic> rejectedData) {
                        return Container(
                          color: Color.fromARGB(150, 0, 0, 0),
                        );
                      },
                      onWillAccept: (MenuItemData data) => true,
                      onAcceptWithDetails: (details) => _onAcceptWithDetails(
                          details, context, canvasProvider),
                    ),
                  ),
                  ...canvasProvider.itemDataList.values
                      .map((ItemData itemData) {
                    return ChangeNotifierProvider<ItemData>.value(
                      value: itemData,
                      child: Item(),
                    );
                  }).toList(),
                  ...canvasProvider.edgeDataList.values
                      .map((EdgeData edgeData) {
                    return ChangeNotifierProvider<EdgeData>.value(
                      value: edgeData,
                      child: EdgeLine(),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
        onTapDown: (details) {
          print(
              'tap position: ${details.localPosition}, canvas: ${canvasProvider.position}, scale: ${canvasProvider.scale}, item count: ${canvasProvider.itemDataList.length}');
          // canvasProvider.itemDataList.values.forEach((element) {
          //   print('item: ${element.position}');
          // });
        },
        onScaleStart: (details) => _onScaleStart(details, canvasProvider),
        onScaleUpdate: (details) => _onScaleUpdate(details, canvasProvider),
        onScaleEnd: (details) => _onScaleEnd(canvasProvider),
      ),
    );
  }
}

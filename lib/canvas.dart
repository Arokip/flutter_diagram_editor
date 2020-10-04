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

class DiagramEditorCanvas extends StatefulWidget {
  const DiagramEditorCanvas({
    Key key,
  }) : super(key: key);

  @override
  _DiagramEditorCanvasState createState() => _DiagramEditorCanvasState();
}

class _DiagramEditorCanvasState extends State<DiagramEditorCanvas>
    with TickerProviderStateMixin {
  AnimationController _controller;
  double _baseScaleFactor = 1.0;

  Offset _lastFocalPoint = Offset(0, 0);

  Offset _transformPosition = Offset(0, 0);
  double _transformScale = 1.0;

  Offset _transformPositionDelta = Offset(0, 0);
  double _transformScaleDelta = 1.0;

  bool canUpdateProviderWithLastValues = false;

  _onScaleStart(ScaleStartDetails details, CanvasModel canvasProvider) {
    _baseScaleFactor = canvasProvider.scale;
    _lastFocalPoint = details.focalPoint;
    _controller.repeat();
  }

  _onScaleUpdate(ScaleUpdateDetails details, CanvasModel canvasProvider) {
    if (canUpdateProviderWithLastValues) {
      updateProviderWithLastValues(canvasProvider);

      double previousScale = canvasProvider.scale;

      // canvasProvider.updateCanvasData(details.focalPoint - _lastFocalPoint,
      //     _baseScaleFactor * details.scale);

      _transformPosition += details.focalPoint - _lastFocalPoint;
      _transformPositionDelta = details.focalPoint - _lastFocalPoint;
      _transformScale = details.scale; // TODO: scale

      var focalPoint = (details.localFocalPoint - canvasProvider.position);
      var focalPointScaled =
          (details.localFocalPoint - canvasProvider.position) *
              (canvasProvider.scale / previousScale);

      // canvasProvider.updateCanvasPosition(focalPoint - focalPointScaled);
      _lastFocalPoint = details.focalPoint;

      _transformPosition += focalPoint - focalPointScaled;
      _transformPositionDelta += focalPoint - focalPointScaled;

      // print('transform: pos $_transformPosition');
      // print('canvas: pos ${canvasProvider.position}');
      print('update: $_transformPosition');
    }
  }

  _onScaleEnd(CanvasModel canvasProvider) {
    if (canUpdateProviderWithLastValues) {
      updateProviderWithLastValues(canvasProvider);
    }

    _controller.reset();

    _transformPosition = Offset(0, 0);
    _transformPositionDelta = Offset(0, 0);
    _transformScale = 1.0;
    _transformScaleDelta = 1.0;

    canvasProvider.updateCanvasEnd();
  }

  updateProviderWithLastValues(CanvasModel canvasProvider) {
    canvasProvider.updateCanvasData(
        _transformPositionDelta, _transformScaleDelta);
    canUpdateProviderWithLastValues = false;
  }

  void _receivedPointerSignal(PointerSignalEvent event, canvasProvider) {
    if (event is PointerScrollEvent) {
      final double scaleChange =
          event.scrollDelta.dy < 0 ? (1 / mouseScaleSpeed) : (mouseScaleSpeed);

      if (scaleChange == 0.0) {
        return;
      }

      double previousScale = canvasProvider.scale;

      canvasProvider.updateCanvasScale(scaleChange);

      var focalPoint = (event.localPosition - canvasProvider.position);
      var focalPointScaled = (event.localPosition - canvasProvider.position) *
          (canvasProvider.scale / previousScale);

      canvasProvider.updateCanvasPosition(focalPoint - focalPointScaled);
    }
  }

  void _onAcceptWithDetails(
      DragTargetDetails details, BuildContext context, canvasProvider) {
    print('ACCEPT: ${details.data.color}');
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
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
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
          color: Colors.red,
          child: ClipRect(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                print('AnimatedBuilder position: $_transformPosition');
                canUpdateProviderWithLastValues = true;
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
                          color: Color.fromARGB(100, 0, 0, 200),
                        );
                      },
                      onWillAccept: (MenuItemData data) => true,
                      onAcceptWithDetails: (details) => _onAcceptWithDetails(
                          details, context, canvasProvider),
                    ),
                  ),
                  // Container(
                  //   color: Colors.transparent,
                  // ),
                  ...canvasProvider.itemDataList.values
                      .map((ItemData itemData) {
                    // return Item(data: itemData);
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
          canvasProvider.itemDataList.values.forEach((element) {
            print('item: ${element.position}');
          });
        },
        onScaleStart: (details) => _onScaleStart(details, canvasProvider),
        onScaleUpdate: (details) => _onScaleUpdate(details, canvasProvider),
        onScaleEnd: (details) => _onScaleEnd(canvasProvider),
      ),
    );
  }
}

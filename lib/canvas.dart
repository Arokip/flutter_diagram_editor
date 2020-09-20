import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'model/canvas_data.dart';
import 'model/item.dart';
import 'model/item_data.dart';
import 'model/menu_item_data.dart';

int count = 20;

double maxScale = 4.0;
double minScale = 0.4;
double mouseScaleSpeed = 0.8;

class Canvas extends StatefulWidget {
  const Canvas({
    Key key,
  }) : super(key: key);

  @override
  _CanvasState createState() => _CanvasState();
}

class _CanvasState extends State<Canvas> {
  // TODO: provider
  final ValueNotifier<CanvasData> canvasData =
      ValueNotifier<CanvasData>(CanvasData(position: Offset(0, 0), scale: 1.0));

  List<ItemData> itemList;

  List<ItemData> generateLargeList(int number) {
    List<ItemData> resultList = [];
    for (int j = 0; j < number / 100; j++) {
      for (int i = 0;
          i < ((number - j * 100) >= 100 ? 100 : (number % 100));
          i++) {
        resultList.add(ItemData(
            position: Offset(i * 3.0, i * 3.0 + 100 * j),
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            size: Size(50, 50)));
      }
    }
    return resultList;
  }

  @override
  void initState() {
    itemList = generateLargeList(count);
    super.initState();
  }

  // TODO: provider ...
  void resetView() {
    updateCanvasData(Offset(0, 0), 1.0);
  }

  double _baseScaleFactor = 1.0;

  Offset _lastFocalPoint = Offset(0, 0);

  _onScaleStart(ScaleStartDetails details) {
    _baseScaleFactor = canvasData.value.scale;
    _lastFocalPoint = details.focalPoint;
  }

  _onScaleUpdate(ScaleUpdateDetails details) {
    double previousScale = canvasData.value.scale;
    updateCanvasData(
        canvasData.value.position + (details.focalPoint - _lastFocalPoint),
        _baseScaleFactor * details.scale);

    var focalPoint = (details.localFocalPoint - canvasData.value.position);
    var focalPointScaled =
        (details.localFocalPoint - canvasData.value.position) *
            (canvasData.value.scale / previousScale);

    setCanvasPosition(
        canvasData.value.position + (focalPoint - focalPointScaled));

    _lastFocalPoint = details.focalPoint;
  }

  // TODO: provider ...
  setCanvasPosition(Offset position) {
    canvasData.value =
        CanvasData(position: position, scale: canvasData.value.scale);
  }

  setCanvasScale(double scale) {
    scale = keepScaleInBounds(scale);
    canvasData.value =
        CanvasData(position: canvasData.value.position, scale: scale);
  }

  updateCanvasData(Offset position, double scale) {
    scale = keepScaleInBounds(scale);
    canvasData.value = CanvasData(position: position, scale: scale);
  }

  double keepScaleInBounds(double scale) {
    double scaleResult = scale;
    if (scale <= minScale) {
      scaleResult = minScale;
    }
    if (scale >= maxScale) {
      scaleResult = maxScale;
    }
    return scaleResult;
  }

  void _receivedPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      final double scaleChange =
          event.scrollDelta.dy < 0 ? (1 / mouseScaleSpeed) : (mouseScaleSpeed);

      if (scaleChange == 0.0) {
        return;
      }

      double previousScale = canvasData.value.scale;
      setCanvasScale(canvasData.value.scale * scaleChange);

      var focalPoint = (event.localPosition - canvasData.value.position);
      var focalPointScaled = (event.localPosition - canvasData.value.position) *
          (canvasData.value.scale / previousScale);

      setCanvasPosition(
          canvasData.value.position + (focalPoint - focalPointScaled));
    }
  }

  void _onAcceptWithDetails(DragTargetDetails details, BuildContext context) {
    final RenderBox renderBox = context.findRenderObject();
    final Offset localOffset = renderBox.globalToLocal(details.offset);
    itemList.add(
      ItemData(
        color: details.data.color,
        size: details.data.size,
        position:
            (localOffset - canvasData.value.position) / canvasData.value.scale,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('CANVAS build');
    return DragTarget<MenuItemData>(
      builder: (BuildContext context, List<MenuItemData> candidateData,
          List<dynamic> rejectedData) {
        return Listener(
          onPointerSignal: _receivedPointerSignal,
          child: GestureDetector(
            child: Container(
              child: Stack(children: [
                ...itemList
                    .map((ItemData itemData) => Item(
                          data: itemData,
                          canvasData: canvasData,
                        ))
                    .toList(),
              ]),
              color: Colors.red,
            ),
            onTapDown: (details) {
              print(
                  'tap position: ${details.localPosition}, canvas: ${canvasData.value.position}, scale: ${canvasData.value.scale}');
            },
            onScaleStart: _onScaleStart,
            onScaleUpdate: _onScaleUpdate,
          ),
        );
      },
      onWillAccept: (MenuItemData data) => true,
      onAcceptWithDetails: (details) => _onAcceptWithDetails(details, context),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item.dart';
import 'model/canvas_data.dart';
import 'model/item_data.dart';
import 'model/menu_item_data.dart';

int count = 20;

double mouseScaleSpeed = 0.8;

class DiagramEditorCanvas extends StatefulWidget {
  const DiagramEditorCanvas({
    Key key,
  }) : super(key: key);

  @override
  _DiagramEditorCanvasState createState() => _DiagramEditorCanvasState();
}

class _DiagramEditorCanvasState extends State<DiagramEditorCanvas> {
  double _baseScaleFactor = 1.0;

  Offset _lastFocalPoint = Offset(0, 0);

  _onScaleStart(ScaleStartDetails details) {
    _baseScaleFactor = Provider.of<CanvasData>(context, listen: false).scale;
    _lastFocalPoint = details.focalPoint;
  }

  _onScaleUpdate(ScaleUpdateDetails details) {
    double previousScale =
        Provider.of<CanvasData>(context, listen: false).scale;

    Provider.of<CanvasData>(context, listen: false).updateCanvasData(
        details.focalPoint - _lastFocalPoint, _baseScaleFactor * details.scale);

    var focalPoint = (details.localFocalPoint -
        Provider.of<CanvasData>(context, listen: false).position);
    var focalPointScaled = (details.localFocalPoint -
            Provider.of<CanvasData>(context, listen: false).position) *
        (Provider.of<CanvasData>(context, listen: false).scale / previousScale);

    Provider.of<CanvasData>(context, listen: false)
        .updateCanvasPosition(focalPoint - focalPointScaled);

    _lastFocalPoint = details.focalPoint;
  }

  void _receivedPointerSignal(PointerSignalEvent event, BuildContext context) {
    if (event is PointerScrollEvent) {
      final double scaleChange =
          event.scrollDelta.dy < 0 ? (1 / mouseScaleSpeed) : (mouseScaleSpeed);

      if (scaleChange == 0.0) {
        return;
      }

      double previousScale =
          Provider.of<CanvasData>(context, listen: false).scale;

      Provider.of<CanvasData>(context, listen: false)
          .updateCanvasScale(scaleChange);

      var focalPoint = (event.localPosition -
          Provider.of<CanvasData>(context, listen: false).position);
      var focalPointScaled = (event.localPosition -
              Provider.of<CanvasData>(context, listen: false).position) *
          (Provider.of<CanvasData>(context, listen: false).scale /
              previousScale);

      Provider.of<CanvasData>(context, listen: false)
          .updateCanvasPosition(focalPoint - focalPointScaled);
    }
  }

  void _onAcceptWithDetails(DragTargetDetails details, BuildContext context) {
    final RenderBox renderBox = context.findRenderObject();
    final Offset localOffset = renderBox.globalToLocal(details.offset);

    Provider.of<CanvasData>(context, listen: false).addItemToList(
      ItemData(
        color: details.data.color,
        size: details.data.size,
        position: (localOffset -
                Provider.of<CanvasData>(context, listen: false).position) /
            Provider.of<CanvasData>(context, listen: false).scale,
      ),
    );
  }

  bool isItemVisibleOnScreen(ItemData item) {
    return true;
    // if (item.position.dx < 100)
    //   return true;
    // else
    //   return false;
  }

  @override
  Widget build(BuildContext context) {
    print('CANVAS build');
    return DragTarget<MenuItemData>(
      builder: (BuildContext context, List<MenuItemData> candidateData,
          List<dynamic> rejectedData) {
        return Listener(
          onPointerSignal: (event) => _receivedPointerSignal(event, context),
          child: GestureDetector(
            child: Container(
              child: Selector<CanvasData, List<ItemData>>(
                  selector: (_, canvasData) => canvasData.itemDataList
                      .where((item) => isItemVisibleOnScreen(item))
                      .toList(),
                  builder: (context, itemList, child) {
                    return Stack(
                      children: itemList
                          .map((ItemData itemData) => Item(
                                data: itemData,
                              ))
                          .toList(),
                    );
                  }),
              color: Colors.red,
            ),
            onTapDown: (details) {
              print(
                  'tap position: ${details.localPosition}, canvas: ${Provider.of<CanvasData>(context, listen: false).position}, scale: ${Provider.of<CanvasData>(context, listen: false).scale}');
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

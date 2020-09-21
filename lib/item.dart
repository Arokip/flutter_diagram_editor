import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/canvas_model.dart';
import 'model/item_data.dart';

class Item extends StatefulWidget {
  final ItemData data;

  const Item({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  Offset _itemPosition;

  Offset _lastFocalPoint = Offset(0, 0);

  @override
  void initState() {
    _itemPosition = widget.data.position;
    super.initState();
  }

  Offset getDelta(Offset currentFocalPoint) {
    return currentFocalPoint - _lastFocalPoint;
  }

  @override
  Widget build(BuildContext context) {
    // print('ITEM build');
    return Consumer<CanvasModel>(builder: (context, canvasData, child) {
      return Positioned(
        left: canvasData.scale * _itemPosition.dx + canvasData.position.dx,
        top: canvasData.scale * _itemPosition.dy + canvasData.position.dy,
        child: GestureDetector(
          onScaleStart: (details) {
            _lastFocalPoint = details.focalPoint;
          },
          onScaleUpdate: (details) {
            _itemPosition += getDelta(details.focalPoint) / canvasData.scale;
            canvasData.updateItemDataPosition(widget.data, _itemPosition);
            _lastFocalPoint = details.focalPoint;
          },
          child: SizedBox(
            width: canvasData.scale * (widget.data.size.width + 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: widget.data.color,
                  height: canvasData.scale * widget.data.size.height,
                  width: canvasData.scale * widget.data.size.width,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Container(
                        width: 20 * canvasData.scale,
                        height: 20 * canvasData.scale,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.0 * canvasData.scale,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: 20 * canvasData.scale,
                        height: 20 * canvasData.scale,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.0 * canvasData.scale,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

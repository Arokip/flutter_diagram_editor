import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'canvas_data.dart';
import 'item_data.dart';

class Item extends StatefulWidget {
  final ValueListenable<CanvasData> canvasData;
  final ItemData data;

  const Item({
    Key key,
    this.data,
    this.canvasData,
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
    return ValueListenableBuilder(
      builder: (context, CanvasData value, child) {
        print('ITEM  build --');

        return Positioned(
          left: value.scale * _itemPosition.dx + value.position.dx,
          top: value.scale * _itemPosition.dy + value.position.dy,
          child: GestureDetector(
            onScaleStart: (details) {
              _lastFocalPoint = details.focalPoint;
            },
            onScaleUpdate: (details) {
              setState(() {
                _itemPosition += getDelta(details.focalPoint) / value.scale;
                _lastFocalPoint = details.focalPoint;
              });
            },
            child: SizedBox(
              // height: value.scale * widget.data.size.height + 200,
              width: value.scale * (widget.data.size.width + 40),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: widget.data.color,
                    height: value.scale * widget.data.size.height,
                    width: value.scale * widget.data.size.width,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      valueListenable: widget.canvasData,
    );
  }
}

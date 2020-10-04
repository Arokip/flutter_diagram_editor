import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/edge_data.dart';
import 'package:provider/provider.dart';

import 'model/canvas_model.dart';
import 'model/item_data.dart';

class Item extends StatefulWidget {
  // final ItemData data;

  const Item({
    Key key,
    // this.data,
  }) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  // Offset _itemPosition;

  Offset _lastFocalPoint = Offset(0, 0);

  // @override
  // void initState() {
  //   _itemPosition = widget.data.position;
  //   super.initState();
  // }

  Offset getDelta(Offset currentFocalPoint) {
    return currentFocalPoint - _lastFocalPoint;
  }

  @override
  Widget build(BuildContext context) {
    // print('ITEM build');

    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var itemProvider = Provider.of<ItemData>(context);
    var edgeMap = context.select<CanvasModel, Map<int, EdgeData>>(
        (CanvasModel model) => model.edgeDataList);

    return Positioned(
      left: canvasScale * itemProvider.position.dx + canvasPosition.dx,
      top: canvasScale * itemProvider.position.dy + canvasPosition.dy,
      child: GestureDetector(
        onScaleStart: (details) {
          _lastFocalPoint = details.focalPoint;
        },
        onScaleUpdate: (details) {
          itemProvider.updateItemDataPosition(
              getDelta(details.focalPoint) / canvasScale);
          itemProvider.edgesFrom.forEach((edgeId) {
            edgeMap[edgeId]
                .updateStart(getDelta(details.focalPoint) / canvasScale);
          });
          itemProvider.edgesTo.forEach((edgeId) {
            edgeMap[edgeId]
                .updateEnd(getDelta(details.focalPoint) / canvasScale);
          });

          // canvasProvider.lineList.where(id).updateFrom/To... (jako mapa ?)
          _lastFocalPoint = details.focalPoint;
        },
        child: SizedBox(
          width: canvasScale * (itemProvider.size.width + 20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: itemProvider.color,
                height: canvasScale * itemProvider.size.height,
                width: canvasScale * itemProvider.size.width,
                child: Center(
                  child: Text('${itemProvider.id}'),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      width: 20 * canvasScale,
                      height: 20 * canvasScale,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.0 * canvasScale,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: 20 * canvasScale,
                      height: 20 * canvasScale,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.0 * canvasScale,
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
  }
}

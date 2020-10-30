import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/link_data.dart';
import 'package:provider/provider.dart';

import 'model/canvas_model.dart';
import 'model/component_data.dart';

class Component extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print('COMPONENT build');
    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var componentData = Provider.of<ComponentData>(context);
    var linkMap = context.select<CanvasModel, Map<int, LinkData>>(
        (CanvasModel model) => model.linkDataMap);

    return Positioned(
      left: canvasScale * componentData.position.dx + canvasPosition.dx,
      top: canvasScale * componentData.position.dy + canvasPosition.dy,
      child: GestureDetector(
        onTap: () {
          print('component tapped: ${componentData.id}');
        },
        onPanUpdate: (details) {
          componentData
              .updateComponentDataPosition(details.delta / canvasScale);
          componentData.linksFrom.forEach((linkId) {
            linkMap[linkId].updateStart(details.delta / canvasScale);
          });
          componentData.linksTo.forEach((linkId) {
            linkMap[linkId].updateEnd(details.delta / canvasScale);
          });
        },
        child: SizedBox(
          width: canvasScale * (componentData.size.width + 20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: componentData.color,
                height: canvasScale * componentData.size.height,
                width: canvasScale * componentData.size.width,
                child: Center(
                  child: Text('${componentData.id}'),
                ),
              ),
              // TODO: ports
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

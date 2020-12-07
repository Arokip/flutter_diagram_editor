import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';
import 'package:provider/provider.dart';

import 'model/canvas_model.dart';

class Port extends StatelessWidget {
  final PortData portData;
  final double size;

  const Port({
    Key key,
    this.portData,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var canvasSelectItem = context
        .select<CanvasModel, Function>((CanvasModel model) => model.selectItem);

    return Container(
      alignment: portData.alignment,
      child: GestureDetector(
        onTap: () {
          print('port tapped: ${portData.id}');
          canvasSelectItem(portData);
        },
        child: Container(
          // child: Text(portData.portType),
          alignment: Alignment.center,
          width: size * canvasScale,
          height: size * canvasScale,
          decoration: BoxDecoration(
            color: portData.color,
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.0 * canvasScale,
              color: portData.borderColor,
            ),
          ),
        ),
      ),
    );
  }
}

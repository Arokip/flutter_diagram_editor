import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/library/model/port_data.dart';
import 'package:provider/provider.dart';

class Port extends StatelessWidget {
  final PortData portData;
  final double size;

  const Port({
    Key key,
    @required this.portData,
    this.size = 20,
  })  : assert(size > 0),
        super(key: key);

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
          child: Text(
            portData.portType,
            style:
                TextStyle(fontSize: 12 * canvasScale, color: Colors.grey[800]),
          ),
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

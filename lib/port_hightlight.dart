import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/canvas_model.dart';
import 'model/component_data.dart';
import 'model/port_data.dart';

class PortHighlight extends StatelessWidget {
  final Color color;
  final double padding;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  const PortHighlight({
    Key key,
    this.color = Colors.red,
    this.padding = 2,
    this.strokeWidth = 2,
    this.dashWidth = 10,
    this.dashSpace = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var componentData = Provider.of<ComponentData>(context);
    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    PortData selectedPort = context.select<CanvasModel, dynamic>(
        (CanvasModel model) => model.selectedItem);

    return Positioned(
      left: canvasPosition.dx +
          canvasScale *
              (componentData.position.dx +
                  componentData.size.width *
                      ((selectedPort.alignment.x + 1) / 2)),
      top: canvasPosition.dy +
          canvasScale *
              (componentData.position.dy +
                  componentData.size.height *
                      ((selectedPort.alignment.y + 1) / 2)),
      child: CustomPaint(
        painter: PortHighlightPainter(
          portSize: componentData.portSize * canvasScale,
          padding: padding,
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class PortHighlightPainter extends CustomPainter {
  final double portSize;
  final double padding;
  final Color color;
  final double strokeWidth;

  PortHighlightPainter({
    @required this.portSize,
    @required this.padding,
    @required this.color,
    @required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawOval(
        Rect.fromCircle(
          center: Offset(portSize / 2, portSize / 2),
          radius: portSize / 2 + padding,
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

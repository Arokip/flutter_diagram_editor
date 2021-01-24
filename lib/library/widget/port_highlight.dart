import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/library/model/component_data.dart';
import 'package:flutter_diagram_editor/library/model/port_data.dart';
import 'package:provider/provider.dart';

class PortHighlight extends StatelessWidget {
  final PortData portData;
  final Color color;
  final double padding;
  final double strokeWidth;

  const PortHighlight({
    Key key,
    @required this.portData,
    this.color = Colors.amber,
    this.padding = 2,
    this.strokeWidth = 2,
  })  : assert(strokeWidth >= 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var componentData = Provider.of<ComponentData>(context);
    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);

    return Positioned(
      left: canvasPosition.dx +
          canvasScale *
              (componentData.position.dx +
                  componentData.size.width * ((portData.alignment.x + 1) / 2)),
      top: canvasPosition.dy +
          canvasScale *
              (componentData.position.dy +
                  componentData.size.height * ((portData.alignment.y + 1) / 2)),
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
  }) : assert(strokeWidth > 0);

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

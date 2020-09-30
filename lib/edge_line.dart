import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:provider/provider.dart';

import 'model/edge_data.dart';

class EdgeLine extends StatefulWidget {
  // final EdgeData edgeData;

  const EdgeLine({
    Key key,
    // this.edgeData,
  }) : super(key: key);

  @override
  _EdgeLineState createState() => _EdgeLineState();
}

class _EdgeLineState extends State<EdgeLine> {
  @override
  Widget build(BuildContext context) {
    // print('LINE build');

    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var edgeProvider = Provider.of<EdgeData>(context);

    return GestureDetector(
      onTap: () {
        print('line tapped');
      },
      child: CustomPaint(
        painter: LinePainter(edgeProvider.start, edgeProvider.end,
            edgeProvider.width, canvasPosition, canvasScale),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final double width;
  final Offset canvasPosition;
  final double canvasScale;

  LinePainter(
    this.start,
    this.end,
    this.width,
    this.canvasPosition,
    this.canvasScale,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = width * canvasScale
      ..style = PaintingStyle.stroke;

    canvas.drawLine(start * canvasScale + canvasPosition,
        end * canvasScale + canvasPosition, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = makeWiderLinePath(width * 1.5);

    return path.contains(position);
  }

  Path makeWiderLinePath(double k) {
    Path path = new Path();
    // perpendicularVector
    Offset pv = Offset((end.dx - start.dx), -(end.dy - start.dy));
    double normValue = sqrt((pv.dx * pv.dx) + (pv.dy * pv.dy));
    // perpendicularNormalizedScaledVector
    Offset pnsv = pv / normValue * k;
    // rect around line
    path.moveTo(start.dx + pnsv.dx, start.dy + pnsv.dy);
    path.lineTo(end.dx + pnsv.dx, end.dy + pnsv.dy);
    path.lineTo(end.dx - pnsv.dx, end.dy - pnsv.dy);
    path.lineTo(start.dx - pnsv.dx, start.dy - pnsv.dy);
    path.close();
    return path;
  }
}

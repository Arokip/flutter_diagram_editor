import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:provider/provider.dart';

class EdgeLine extends StatefulWidget {
  final Offset start;
  final Offset end;
  final double width;

  const EdgeLine({
    Key key,
    this.start,
    this.end,
    this.width = 1.0,
  }) : super(key: key);

  @override
  _EdgeLineState createState() => _EdgeLineState();
}

class _EdgeLineState extends State<EdgeLine> {
  @override
  Widget build(BuildContext context) {
    // print('LINE build');
    return GestureDetector(
      onTap: () {
        print('line tapped');
      },
      child: Consumer<CanvasModel>(
        builder: (context, canvasModel, child) {
          return CustomPaint(
            painter: LinePainter(widget.start, widget.end, widget.width,
                canvasModel.position, canvasModel.scale),
          );
        },
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

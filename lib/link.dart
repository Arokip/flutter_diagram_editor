import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:provider/provider.dart';

import 'model/link_data.dart';

class Link extends StatefulWidget {
  const Link({
    Key key,
  }) : super(key: key);

  @override
  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link> {
  @override
  Widget build(BuildContext context) {
    // print('LINE build');
    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var linkData = Provider.of<LinkData>(context);

    return GestureDetector(
      onTapDown: (d) {
        print('link tapped ${d.localPosition}');
      },
      child: CustomPaint(
        painter: LinkPainter(
          linkData.start * canvasScale + canvasPosition,
          linkData.end * canvasScale + canvasPosition,
          linkData.width * canvasScale,
        ),
      ),
    );
  }
}

class LinkPainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final double width;

  LinkPainter(
    this.start,
    this.end,
    this.width,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    canvas.drawLine(start, getShorterEnd(), paint);

    paint..style = PaintingStyle.fill;
    canvas.drawPath(getTriangleTipPath(3), paint);

    paint
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawPath(makeWiderLinePath(width), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = makeWiderLinePath(width);

    return path.contains(position);
  }

  Path makeWiderLinePath(double k) {
    Path path = new Path();
    // perpendicularNormalizedScaledVector
    Offset pnsv = normalizeVector(getPerpendicularVector()) * k;
    // rect around line
    path.moveTo(start.dx + pnsv.dx, start.dy + pnsv.dy);
    path.lineTo(end.dx + pnsv.dx, end.dy + pnsv.dy);
    path.lineTo(end.dx - pnsv.dx, end.dy - pnsv.dy);
    path.lineTo(start.dx - pnsv.dx, start.dy - pnsv.dy);
    path.close();
    return path;
  }

  Path getTriangleTipPath(double tipSize) {
    Offset left = end +
        normalizeVector(getPerpendicularVector()) * tipSize * width -
        normalizeVector(getDirectionVector()) * 2 * tipSize * width;
    Offset right = end -
        normalizeVector(getPerpendicularVector()) * tipSize * width -
        normalizeVector(getDirectionVector()) * 2 * tipSize * width;

    Path path = new Path();
    path.moveTo(end.dx, end.dy);
    path.lineTo(left.dx, left.dy);
    path.lineTo(right.dx, right.dy);
    path.close();
    return path;
  }

  Offset getDirectionVector() {
    return Offset((end.dx - start.dx), (end.dy - start.dy));
  }

  Offset getPerpendicularVector() {
    return Offset((end.dy - start.dy), -(end.dx - start.dx));
  }

  Offset normalizeVector(Offset vector) {
    return vector.distance == 0.0 ? vector : vector / vector.distance;
  }

  Offset getShorterEnd() {
    return end - normalizeVector(getDirectionVector()) * width;
  }
}

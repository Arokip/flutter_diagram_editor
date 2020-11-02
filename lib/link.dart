import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:provider/provider.dart';

import 'model/link_data.dart';

class Link extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print('LINE build');
    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var canvasSelectItem = context
        .select<CanvasModel, dynamic>((CanvasModel model) => model.selectItem);
    var linkData = Provider.of<LinkData>(context);
    var removeLink = context
        .select<CanvasModel, Function>((CanvasModel model) => model.removeLink);

    return GestureDetector(
      onTapDown: (d) {
        print('link tapped ${d.localPosition}');
        canvasSelectItem(linkData);
      },
      child: CustomPaint(
        child: Visibility(
          visible: linkData.isItemSelected,
          child: GestureDetector(
            onTap: () {
              removeLink(linkData);
            },
            // onTapDown: (details){
            //   details.localPosition;
            //
            // },
            child: CustomPaint(
                painter: DeleteIconPainter(
              location: (linkData.start + linkData.end) / 2 * canvasScale +
                  canvasPosition,
              radius: 20,
              scale: canvasScale,
              color: Colors.red,
            )),
          ),
        ),
        painter: LinkPainter(
          linkData.start * canvasScale + canvasPosition,
          linkData.end * canvasScale + canvasPosition,
          linkData.width * canvasScale,
          linkData.isItemSelected ? Colors.amber : linkData.color,
        ),
      ),
    );
  }
}

class LinkPainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final double width;
  final Color color;

  LinkPainter(
    this.start,
    this.end,
    this.width,
    this.color,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    canvas.drawLine(start, getShorterEnd(width * 3), paint);

    paint..style = PaintingStyle.fill;
    canvas.drawPath(getTriangleTipPath(3), paint);

    paint
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 4;
    canvas.drawPath(makeWiderLinePath(width * 4), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = makeWiderLinePath(width * 4);

    return path.contains(position);
  }

  Path makeWiderLinePath(double k) {
    Path path = new Path();
    // perpendicularNormalizedScaledVector
    Offset pnsv = normalizeVector(getPerpendicularVector()) * k;
    // make shorter clickable area
    Offset shorterStart = getShorterStart(width * 5);
    Offset shorterEnd = getShorterEnd(width * 5);
    // rect around line
    path.moveTo(shorterStart.dx + pnsv.dx, shorterStart.dy + pnsv.dy);
    path.lineTo(shorterEnd.dx + pnsv.dx, shorterEnd.dy + pnsv.dy);
    path.lineTo(shorterEnd.dx - pnsv.dx, shorterEnd.dy - pnsv.dy);
    path.lineTo(shorterStart.dx - pnsv.dx, shorterStart.dy - pnsv.dy);
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

  Offset getShorterStart(double k) {
    return start + normalizeVector(getDirectionVector()) * k;
  }

  Offset getShorterEnd(double k) {
    return end - normalizeVector(getDirectionVector()) * k;
  }
}

class DeleteIconPainter extends CustomPainter {
  final Offset location;
  final double radius;
  final double scale;
  final Color color;

  DeleteIconPainter({
    this.location,
    this.radius,
    this.scale,
    this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(location, scale * radius, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.grey[800]
      ..strokeWidth = scale * 2;

    canvas.drawCircle(location, scale * radius, paint);

    paint..color = color;

    var halfRadius = radius / 2;
    canvas.drawLine(
      location + (Offset(-halfRadius, -halfRadius) * scale),
      location + (Offset(halfRadius, halfRadius) * scale),
      paint,
    );

    canvas.drawLine(
      location + (Offset(halfRadius, -halfRadius) * scale),
      location + (Offset(-halfRadius, halfRadius) * scale),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = new Path();
    path.addOval(Rect.fromCircle(
      center: this.location,
      radius: scale * radius,
    ));

    return path.contains(position);
  }
}

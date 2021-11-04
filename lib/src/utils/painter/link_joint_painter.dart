import 'package:flutter/material.dart';

class LinkJointPainter extends CustomPainter {
  final Offset location;
  final double radius;
  final double scale;
  final Color color;

  LinkJointPainter({
    required this.location,
    required this.radius,
    required this.scale,
    required this.color,
  }) : assert(radius > 0);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(location, scale * radius, paint);
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

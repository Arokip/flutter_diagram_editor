import 'package:flutter/material.dart';

class DeleteIconPainter extends CustomPainter {
  final Offset location;
  final double radius;
  final Color color;

  DeleteIconPainter({
    required this.location,
    required this.radius,
    required this.color,
  }) : assert(radius > 0);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(location, radius, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.grey
      ..strokeWidth = 2;

    canvas.drawCircle(location, radius, paint);

    paint..color = color;

    var halfRadius = radius / 2;
    canvas.drawLine(
      location + Offset(-halfRadius, -halfRadius),
      location + Offset(halfRadius, halfRadius),
      paint,
    );

    canvas.drawLine(
      location + Offset(halfRadius, -halfRadius),
      location + Offset(-halfRadius, halfRadius),
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
      radius: radius,
    ));

    return path.contains(position);
  }
}

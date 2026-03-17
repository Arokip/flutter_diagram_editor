import 'package:flutter/material.dart';

/// Paints a delete icon (X in a circle) at a given location.
class DeleteIconPainter extends CustomPainter {
  DeleteIconPainter({
    required this.location,
    required this.radius,
    required this.color,
  }) : assert(radius > 0, 'radius must be greater than 0');

  /// The center position of the icon.
  final Offset location;

  /// The radius of the circle.
  final double radius;

  /// The color of the X.
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.8)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(location, radius, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.grey
      ..strokeWidth = 2;

    canvas.drawCircle(location, radius, paint);

    paint.color = color;

    final halfRadius = radius / 2;
    canvas
      ..drawLine(
        location + Offset(-halfRadius, -halfRadius),
        location + Offset(halfRadius, halfRadius),
        paint,
      )
      ..drawLine(
        location + Offset(halfRadius, -halfRadius),
        location + Offset(-halfRadius, halfRadius),
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant DeleteIconPainter oldDelegate) {
    return oldDelegate.location != location ||
        oldDelegate.radius != radius ||
        oldDelegate.color != color;
  }

  @override
  bool hitTest(Offset position) {
    final path = Path()
      ..addOval(Rect.fromCircle(center: location, radius: radius));
    return path.contains(position);
  }
}

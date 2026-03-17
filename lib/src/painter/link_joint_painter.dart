import 'package:flutter/material.dart';

/// Paints a link joint (draggable point on a link).
class LinkJointPainter extends CustomPainter {
  LinkJointPainter({
    required this.location,
    required this.radius,
    required this.scale,
    required this.color,
  }) : assert(radius > 0, 'radius must be greater than 0');

  /// The position of the joint.
  final Offset location;

  /// The radius of the joint circle.
  final double radius;

  /// The current canvas scale.
  final double scale;

  /// The color of the joint.
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(location, scale * radius, paint);
  }

  @override
  bool shouldRepaint(covariant LinkJointPainter oldDelegate) {
    return oldDelegate.location != location ||
        oldDelegate.radius != radius ||
        oldDelegate.scale != scale ||
        oldDelegate.color != color;
  }

  @override
  bool hitTest(Offset position) {
    final path = Path()
      ..addOval(
        Rect.fromCircle(center: location, radius: scale * radius),
      );
    return path.contains(position);
  }
}

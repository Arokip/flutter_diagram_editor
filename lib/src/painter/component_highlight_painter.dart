import 'package:flutter/material.dart';

/// Paints a rectangular dashed line highlight around a component.
///
/// Useful for showing selection state.
class ComponentHighlightPainter extends CustomPainter {
  ComponentHighlightPainter({
    required this.width,
    required this.height,
    this.color = Colors.red,
    this.strokeWidth = 2,
    this.dashWidth = 10,
    this.dashSpace = 5,
  });

  /// Width of the highlight rectangle.
  final double width;

  /// Height of the highlight rectangle.
  final double height;

  /// Color of the highlight. Defaults to [Colors.red].
  final Color color;

  /// Stroke width of the highlight line.
  final double strokeWidth;

  /// Width of each dash.
  final double dashWidth;

  /// Space between dashes.
  final double dashSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    if (dashWidth <= 0 || dashSpace <= 0) {
      canvas.drawRect(Rect.fromLTWH(0, 0, width, height), paint);
      return;
    }

    final dashedPath = Path();
    final w = width + strokeWidth;
    final h = height + strokeWidth;

    var position = Offset(-strokeWidth / 2, 0);
    var pathLength = 0.0;

    if (dashWidth + 2 * dashSpace >= w) {
      dashedPath
        ..moveTo(position.dx, position.dy)
        ..lineTo(position.dx + w, position.dy)
        ..moveTo(position.dx, height + position.dy)
        ..lineTo(position.dx + w, height + position.dy);
    } else {
      while (pathLength < w) {
        final nextX = (pathLength + dashWidth < w)
            ? position.dx + pathLength + dashWidth
            : position.dx + w;
        dashedPath
          ..moveTo(position.dx + pathLength, position.dy)
          ..lineTo(nextX, position.dy)
          ..moveTo(position.dx + pathLength, height + position.dy)
          ..lineTo(nextX, height + position.dy);
        pathLength = pathLength + dashWidth + dashSpace;
      }
    }

    position = Offset(0, -strokeWidth / 2);
    pathLength = 0;

    if (dashWidth + 2 * dashSpace >= h) {
      dashedPath
        ..moveTo(position.dx, position.dy)
        ..lineTo(position.dx, h + position.dy)
        ..moveTo(width + position.dx, position.dy)
        ..lineTo(width + position.dx, h + position.dy);
    } else {
      while (pathLength < h) {
        final nextY = (pathLength + dashWidth < h)
            ? position.dy + pathLength + dashWidth
            : position.dy + h;
        dashedPath
          ..moveTo(position.dx, position.dy + pathLength)
          ..lineTo(position.dx, nextY)
          ..moveTo(width + position.dx, position.dy + pathLength)
          ..lineTo(width + position.dx, nextY);
        pathLength = pathLength + dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant ComponentHighlightPainter oldDelegate) {
    return oldDelegate.width != width ||
        oldDelegate.height != height ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
  }
}

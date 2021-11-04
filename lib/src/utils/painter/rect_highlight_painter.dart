import 'package:flutter/material.dart';

class ComponentHighlightPainter extends CustomPainter {
  final double width;
  final double height;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  /// Rectangular dashed line painter.
  ///
  /// Useful if added as component widget to highlight it.
  ComponentHighlightPainter({
    required this.width,
    required this.height,
    this.color = Colors.red,
    this.strokeWidth = 2,
    this.dashWidth = 10,
    this.dashSpace = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    if (dashWidth <= 0 || dashSpace <= 0) {
      canvas.drawRect(
          Rect.fromLTWH(
            0,
            0,
            this.width,
            this.height,
          ),
          paint);
      return;
    }

    Path dashedPath = Path();

    var width = this.width + strokeWidth;
    var height = this.height + strokeWidth;

    var position = Offset(-strokeWidth / 2, 0);
    double pathLength = 0;

    if (dashWidth + 2 * dashSpace >= width) {
      dashedPath.moveTo(position.dx, position.dy);
      dashedPath.lineTo(position.dx + width, position.dy);

      dashedPath.moveTo(position.dx, this.height + position.dy);
      dashedPath.lineTo(position.dx + width, this.height + position.dy);
    } else {
      while (pathLength < width) {
        double nextX = (pathLength + dashWidth < width)
            ? position.dx + pathLength + dashWidth
            : position.dx + width;
        dashedPath.moveTo(position.dx + pathLength, position.dy);
        dashedPath.lineTo(nextX, position.dy);

        dashedPath.moveTo(position.dx + pathLength, this.height + position.dy);
        dashedPath.lineTo(nextX, this.height + position.dy);

        pathLength = pathLength + dashWidth + dashSpace;
      }
    }

    position = Offset(0, -strokeWidth / 2);
    pathLength = 0;

    if (dashWidth + 2 * dashSpace >= height) {
      dashedPath.moveTo(position.dx, position.dy);
      dashedPath.lineTo(position.dx, height + position.dy);

      dashedPath.moveTo(this.width + position.dx, position.dy);
      dashedPath.lineTo(this.width + position.dx, height + position.dy);
    } else {
      while (pathLength < height) {
        double nextY = (pathLength + dashWidth < height)
            ? position.dy + pathLength + dashWidth
            : position.dy + height;

        dashedPath.moveTo(position.dx, position.dy + pathLength);
        dashedPath.lineTo(position.dx, nextY);

        dashedPath.moveTo(this.width + position.dx, position.dy + pathLength);
        dashedPath.lineTo(this.width + position.dx, nextY);

        pathLength = pathLength + dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

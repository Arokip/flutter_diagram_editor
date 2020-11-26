import 'package:flutter/material.dart';

class HighlightPainter extends CustomPainter {
  final Offset position;
  final double width;
  final double height;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  HighlightPainter({
    this.position,
    this.width,
    this.height,
    this.strokeWidth = 2,
    this.dashWidth = 10,
    this.dashSpace = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Path dashedPath = Path();

    double pathLength = 0;

    if (dashWidth >= width) {
      dashedPath.moveTo(position.dx, position.dy);
      dashedPath.lineTo(position.dx + width, position.dy);

      dashedPath.moveTo(position.dx, height + position.dy);
      dashedPath.lineTo(position.dx + width, height + position.dy);
    }

    if (dashWidth >= height) {
      dashedPath.moveTo(position.dx, position.dy);
      dashedPath.lineTo(position.dx, height + position.dy);

      dashedPath.moveTo(width + position.dx, position.dy);
      dashedPath.lineTo(width + position.dx, height + position.dy);
    }

    while (pathLength < width) {
      double nextX = (pathLength + dashWidth < width)
          ? position.dx + pathLength + dashWidth
          : position.dx + width;
      dashedPath.moveTo(position.dx + pathLength, position.dy);
      dashedPath.lineTo(nextX, position.dy);

      dashedPath.moveTo(position.dx + pathLength, height + position.dy);
      dashedPath.lineTo(nextX, height + position.dy);

      pathLength = pathLength + dashWidth + dashSpace;
    }

    pathLength = 0;
    while (pathLength < height) {
      double nextY = (pathLength + dashWidth < height)
          ? position.dy + pathLength + dashWidth
          : position.dy + height;

      dashedPath.moveTo(position.dx, position.dy + pathLength);
      dashedPath.lineTo(position.dx, nextY);

      dashedPath.moveTo(width + position.dx, position.dy + pathLength);
      dashedPath.lineTo(width + position.dx, nextY);

      pathLength = pathLength + dashWidth + dashSpace;
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

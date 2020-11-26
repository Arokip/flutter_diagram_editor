import 'package:flutter/material.dart';

class Highlight extends StatelessWidget {
  final Offset position;
  final double width;
  final double height;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  const Highlight({
    Key key,
    @required this.position,
    @required this.width,
    @required this.height,
    this.color = Colors.red,
    this.strokeWidth = 2,
    this.dashWidth = 10,
    this.dashSpace = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HighlightPainter(
        position: position,
        width: width,
        height: height,
        color: color,
        strokeWidth: strokeWidth,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
      ),
    );
  }
}

class HighlightPainter extends CustomPainter {
  final Offset position;
  final double width;
  final double height;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  HighlightPainter({
    @required this.position,
    @required this.width,
    @required this.height,
    @required this.color,
    @required this.strokeWidth,
    @required this.dashWidth,
    @required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Path dashedPath = Path();

    var width = this.width + strokeWidth;
    var height = this.height + strokeWidth;

    var position = this.position - Offset(strokeWidth / 2, 0);
    double pathLength = 0;

    if (dashWidth >= width) {
      dashedPath.moveTo(position.dx, position.dy);
      dashedPath.lineTo(position.dx + width, position.dy);

      dashedPath.moveTo(position.dx, this.height + position.dy);
      dashedPath.lineTo(position.dx + width, this.height + position.dy);
    }

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

    position = this.position - Offset(0, strokeWidth / 2);
    pathLength = 0;

    if (dashWidth >= height) {
      dashedPath.moveTo(position.dx, position.dy);
      dashedPath.lineTo(position.dx, height + position.dy);

      dashedPath.moveTo(this.width + position.dx, position.dy);
      dashedPath.lineTo(this.width + position.dx, height + position.dy);
    }

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

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

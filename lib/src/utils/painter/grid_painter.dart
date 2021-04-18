import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final double lineWidth;
  final Color lineColor;

  final double horizontalGap;
  final double verticalGap;

  final Offset offset;
  final double scale;

  final bool showHorizontal;
  final bool showVertical;

  final double lineLength;

  final bool isAntiAlias;
  final bool matchParentSize;

  /// Paints a grid.
  ///
  /// Useful if added as canvas background widget.
  GridPainter({
    this.lineWidth = 1.0,
    this.lineColor = Colors.black,
    this.horizontalGap = 32.0,
    this.verticalGap = 32.0,
    this.offset = Offset.zero,
    this.scale = 1.0,
    this.showHorizontal = true,
    this.showVertical = true,
    this.lineLength = 1e4,
    this.isAntiAlias = true,
    this.matchParentSize = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var lineHorizontalLength;
    var lineVerticalLength;
    if (matchParentSize) {
      lineHorizontalLength = size.width / scale;
      lineVerticalLength = size.height / scale;
    } else {
      lineHorizontalLength = lineLength / scale;
      lineVerticalLength = lineLength / scale;
    }

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..isAntiAlias = isAntiAlias
      ..color = lineColor
      ..strokeWidth = lineWidth;

    if (showHorizontal) {
      var count = (lineVerticalLength / horizontalGap).round();
      for (int i = -count + 1; i < count; i++) {
        canvas.drawLine(
          (Offset(-lineHorizontalLength, i * horizontalGap) +
                  offset % horizontalGap) *
              scale,
          (Offset(lineHorizontalLength, i * horizontalGap) +
                  offset % horizontalGap) *
              scale,
          paint,
        );
      }
    }

    if (showVertical) {
      var count = (lineHorizontalLength / verticalGap).round();
      for (int i = -count + 1; i < count; i++) {
        canvas.drawLine(
          (Offset(i * verticalGap, -lineVerticalLength) +
                  offset % verticalGap) *
              scale,
          (Offset(i * verticalGap, lineVerticalLength) + offset % verticalGap) *
              scale,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

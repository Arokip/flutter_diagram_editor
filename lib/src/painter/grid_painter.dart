import 'package:flutter/material.dart';

/// Paints a grid on the canvas.
///
/// Useful as a canvas background widget.
class GridPainter extends CustomPainter {
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

  /// Width of the grid lines.
  final double lineWidth;

  /// Color of the grid lines.
  final Color lineColor;

  /// Horizontal gap between lines.
  final double horizontalGap;

  /// Vertical gap between lines.
  final double verticalGap;

  /// Offset of the grid.
  final Offset offset;

  /// Scale of the grid.
  final double scale;

  /// Whether to show horizontal lines.
  final bool showHorizontal;

  /// Whether to show vertical lines.
  final bool showVertical;

  /// Length of each line (used when [matchParentSize] is false).
  final double lineLength;

  /// Whether lines are anti-aliased.
  final bool isAntiAlias;

  /// Whether to match the parent widget size.
  final bool matchParentSize;

  @override
  void paint(Canvas canvas, Size size) {
    late double lineHorizontalLength;
    late double lineVerticalLength;
    if (matchParentSize) {
      lineHorizontalLength = size.width / scale;
      lineVerticalLength = size.height / scale;
    } else {
      lineHorizontalLength = lineLength / scale;
      lineVerticalLength = lineLength / scale;
    }

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..isAntiAlias = isAntiAlias
      ..color = lineColor
      ..strokeWidth = lineWidth;

    if (showHorizontal) {
      final count = (lineVerticalLength / horizontalGap).round();
      for (var i = -count + 1; i < count; i++) {
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
      final count = (lineHorizontalLength / verticalGap).round();
      for (var i = -count + 1; i < count; i++) {
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
  bool shouldRepaint(covariant GridPainter oldDelegate) {
    return oldDelegate.lineWidth != lineWidth ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.horizontalGap != horizontalGap ||
        oldDelegate.verticalGap != verticalGap ||
        oldDelegate.offset != offset ||
        oldDelegate.scale != scale ||
        oldDelegate.showHorizontal != showHorizontal ||
        oldDelegate.showVertical != showVertical ||
        oldDelegate.lineLength != lineLength ||
        oldDelegate.isAntiAlias != isAntiAlias ||
        oldDelegate.matchParentSize != matchParentSize;
  }
}

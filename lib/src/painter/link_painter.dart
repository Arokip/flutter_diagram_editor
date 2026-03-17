import 'package:diagram_editor/src/model/link_style.dart';
import 'package:diagram_editor/src/util/vector_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Paints a link (line with arrowheads) on the canvas.
class LinkPainter extends CustomPainter {
  LinkPainter({
    required this.linkPoints,
    required this.scale,
    required this.linkStyle,
  });

  /// The points that define the link's path.
  final List<Offset> linkPoints;

  /// The current canvas scale.
  final double scale;

  /// The visual style of the link.
  final LinkStyle linkStyle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = linkStyle.color
      ..strokeWidth = linkStyle.lineWidth * scale
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < linkPoints.length - 1; i++) {
      if (linkPoints.length == 2) {
        canvas.drawPath(
          linkStyle.getLinePath(
            VectorUtils.getShorterLineStart(
              linkPoints[i],
              linkPoints[i + 1],
              scale * linkStyle.getEndShortening(linkStyle.backArrowType),
            ),
            VectorUtils.getShorterLineEnd(
              linkPoints[i],
              linkPoints[i + 1],
              scale * linkStyle.getEndShortening(linkStyle.arrowType),
            ),
            scale,
          ),
          paint,
        );
      } else if (i == 0) {
        canvas.drawPath(
          linkStyle.getLinePath(
            VectorUtils.getShorterLineStart(
              linkPoints[i],
              linkPoints[i + 1],
              scale * linkStyle.getEndShortening(linkStyle.backArrowType),
            ),
            linkPoints[i + 1],
            scale,
          ),
          paint,
        );
      } else if (i == linkPoints.length - 2) {
        canvas.drawPath(
          linkStyle.getLinePath(
            linkPoints[i],
            VectorUtils.getShorterLineEnd(
              linkPoints[i],
              linkPoints[i + 1],
              scale * linkStyle.getEndShortening(linkStyle.arrowType),
            ),
            scale,
          ),
          paint,
        );
      } else {
        canvas.drawPath(
          linkStyle.getLinePath(linkPoints[i], linkPoints[i + 1], scale),
          paint,
        );
      }
    }

    paint.style = PaintingStyle.fill;
    canvas
      ..drawPath(
        linkStyle.getArrowTipPath(
          linkStyle.arrowType,
          linkStyle.arrowSize,
          linkPoints[linkPoints.length - 2],
          linkPoints[linkPoints.length - 1],
          scale,
        ),
        paint,
      )
      ..drawPath(
        linkStyle.getArrowTipPath(
          linkStyle.backArrowType,
          linkStyle.backArrowSize,
          linkPoints[1],
          linkPoints[0],
          scale,
        ),
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant LinkPainter oldDelegate) {
    return oldDelegate.scale != scale ||
        oldDelegate.linkStyle != linkStyle ||
        !listEquals(oldDelegate.linkPoints, linkPoints);
  }

  @override
  bool hitTest(Offset position) {
    return _makeWiderLinePath(scale * (5 + linkStyle.lineWidth))
        .contains(position);
  }

  Path _makeWiderLinePath(double hitAreaWidth) {
    final path = Path();
    for (var i = 0; i < linkPoints.length - 1; i++) {
      path.addPath(
        VectorUtils.getRectAroundLine(
          linkPoints[i],
          linkPoints[i + 1],
          hitAreaWidth,
        ),
        Offset.zero,
      );
    }
    return path;
  }
}

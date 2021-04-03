import 'package:diagram_editor/src/utils/link_style.dart';
import 'package:diagram_editor/src/utils/painter_utils.dart';
import 'package:flutter/material.dart';

class LinkPainter extends CustomPainter {
  final List<Offset> linkPoints;
  final double scale;
  final LinkStyle linkStyle;

  LinkPainter({
    @required this.linkPoints,
    @required this.scale,
    this.linkStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = linkStyle.color
      ..strokeWidth = linkStyle.width * scale
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < linkPoints.length - 1; i++) {
      if (i == linkPoints.length - 2) {
        canvas.drawPath(
          linkStyle.getLinePath(
            linkPoints[i],
            PainterUtils.getShorterLineEnd(
              linkPoints[i],
              linkPoints[i + 1],
              scale * linkStyle.getEndShortening(),
            ),
            scale,
          ),
          paint,
        );
      } else {
        canvas.drawPath(
            linkStyle.getLinePath(linkPoints[i], linkPoints[i + 1], scale),
            paint);
      }
    }

    paint..style = PaintingStyle.fill;
    canvas.drawPath(
        linkStyle.getArrowTipPath(
          linkPoints[linkPoints.length - 2],
          linkPoints[linkPoints.length - 1],
          scale,
        ),
        paint);

    // DEBUG:
    paint
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = scale * linkStyle.width / 5;
    canvas.drawPath(makeWiderLinePath(scale * (5 + linkStyle.width)), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = makeWiderLinePath(scale * (5 + linkStyle.width));
    return path.contains(position);
  }

  Path makeWiderLinePath(double hitAreaWidth) {
    Path path = new Path();
    for (int i = 0; i < linkPoints.length - 1; i++) {
      var point1 = linkPoints[i];
      var point2 = linkPoints[i + 1];

      // if (i == 0)
      //   point1 = PainterUtils.getShorterLineStart(point1, point2, scale * 10);
      // if (i == linkPoints.length - 2)
      //   point2 = PainterUtils.getShorterLineEnd(point1, point2, scale * 10);

      path.addPath(PainterUtils.getRectAroundLine(point1, point2, hitAreaWidth),
          Offset(0, 0));
    }
    return path;
  }
}

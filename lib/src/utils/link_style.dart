import 'dart:math' as math;

import 'package:diagram_editor/src/utils/painter_utils.dart';
import 'package:flutter/material.dart';

enum ArrowType {
  none,
  arrow,
  pointedArrow,
  circle,
  centerCircle,
  semiCircle,
}
enum LineType {
  solid,
  dashed,
  dotted,
}

class LinkStyle {
  final ArrowType arrowType;
  final LineType linkType;
  final double arrowSize;
  final double width;
  final Color color;

  const LinkStyle({
    this.arrowType = ArrowType.none,
    this.linkType = LineType.solid,
    this.arrowSize = 5,
    this.width = 1,
    this.color = Colors.black,
  })  : assert(width > 0),
        assert(arrowSize > 0),
        assert(color != null);

  Path getArrowTipPath(Offset point1, Offset point2, double scale) {
    switch (arrowType) {
      case ArrowType.none:
        return Path();
        break;
      case ArrowType.arrow:
        return getArrowPath(point1, point2, scale, 1);
        break;
      case ArrowType.pointedArrow:
        return getArrowPath(point1, point2, scale, 2);
        break;
      case ArrowType.circle:
        return getCirclePath(point1, point2, scale, false);
        break;
      case ArrowType.centerCircle:
        return getCirclePath(point1, point2, scale, true);
        break;
      case ArrowType.semiCircle:
        return getSemiCirclePath(point1, point2, scale);
        break;
    }
    return Path();
  }

  Path getLinePath(Offset point1, Offset point2, double scale) {
    switch (linkType) {
      case LineType.solid:
        return getSolidLinePath(point1, point2);
        break;
      case LineType.dashed:
        return getDashedLinePath(point1, point2, scale, 32, 32);
        break;
      case LineType.dotted:
        return getDashedLinePath(point1, point2, scale, width, width * 5);
        break;
    }
    return Path();
  }

  Path getArrowPath(
      Offset point1, Offset point2, double scale, double pointed) {
    Offset left = point2 +
        PainterUtils.normalizeVector(
                PainterUtils.getPerpendicularVector(point1, point2)) *
            arrowSize *
            scale -
        PainterUtils.normalizeVector(
                PainterUtils.getDirectionVector(point1, point2)) *
            pointed *
            arrowSize *
            scale;
    Offset right = point2 -
        PainterUtils.normalizeVector(
                PainterUtils.getPerpendicularVector(point1, point2)) *
            arrowSize *
            scale -
        PainterUtils.normalizeVector(
                PainterUtils.getDirectionVector(point1, point2)) *
            pointed *
            arrowSize *
            scale;

    Path path = new Path();

    path.moveTo(point2.dx, point2.dy);
    path.lineTo(left.dx, left.dy);
    path.lineTo(right.dx, right.dy);
    path.close();

    return path;
  }

  Path getCirclePath(
      Offset point1, Offset point2, double scale, bool isCenter) {
    Path path = new Path();
    if (isCenter) {
      path.addOval(Rect.fromCircle(center: point2, radius: scale * arrowSize));
    } else {
      Offset circleCenter = point2 -
          PainterUtils.normalizeVector(
                  PainterUtils.getDirectionVector(point1, point2)) *
              arrowSize *
              scale;
      path.addOval(
          Rect.fromCircle(center: circleCenter, radius: scale * arrowSize));
    }
    return path;
  }

  Path getSemiCirclePath(Offset point1, Offset point2, double scale) {
    Path path = new Path();
    Offset circleCenter = point2 -
        PainterUtils.normalizeVector(
                PainterUtils.getDirectionVector(point1, point2)) *
            arrowSize *
            scale;
    path.addArc(
      Rect.fromCircle(center: circleCenter, radius: scale * arrowSize),
      math.pi - math.atan2(point2.dx - point1.dx, point2.dy - point1.dy),
      -math.pi,
    );
    return path;
  }

  double getEndShortening() {
    double eps = 0.05;
    switch (arrowType) {
      case ArrowType.none:
        return 0;
        break;
      case ArrowType.arrow:
        return arrowSize - eps;
        break;
      case ArrowType.pointedArrow:
        return (arrowSize * 2) - eps;
        break;
      case ArrowType.circle:
        return arrowSize - eps;
        break;
      case ArrowType.centerCircle:
        return 0;
        break;
      case ArrowType.semiCircle:
        return arrowSize - eps;
        break;
    }
    return 0;
  }

  Path getSolidLinePath(Offset point1, Offset point2) {
    Path path = new Path();
    path.moveTo(point1.dx, point1.dy);
    path.lineTo(point2.dx, point2.dy);
    return path;
  }

  Path getDashedLinePath(
    Offset point1,
    Offset point2,
    double scale,
    double dashLength,
    double dashSpace,
  ) {
    Path path = new Path();

    Offset normalized = PainterUtils.normalizeVector(
        PainterUtils.getDirectionVector(point1, point2));
    double lineDistance = (point2 - point1).distance;
    Offset currentPoint = Offset(point1.dx, point1.dy);

    double dash = dashLength * scale;
    double space = dashSpace * scale;
    double currentDistance = 0;
    while (currentDistance < lineDistance) {
      path.moveTo(currentPoint.dx, currentPoint.dy);
      currentPoint = currentPoint + normalized * dash;

      if (currentDistance + dash > lineDistance) {
        path.lineTo(point2.dx, point2.dy);
      } else {
        path.lineTo(currentPoint.dx, currentPoint.dy);
      }
      currentPoint = currentPoint + normalized * space;

      currentDistance += dash + space;
    }

    path.moveTo(
      point2.dx - normalized.dx * width * scale,
      point2.dy - normalized.dy * width * scale,
    );
    path.lineTo(point2.dx, point2.dy);
    return path;
  }
}

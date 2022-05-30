import 'dart:math' as math;

import 'package:diagram_editor/src/utils/vector_utils.dart';
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
  /// Defines the design of the link's line.
  ///
  /// It can be [LineType.solid], [LineType.dashed] or [LineType.dotted].
  LineType lineType;

  /// Defines the design of the link's front arrowhead.
  ///
  /// There are several designs, choose from [ArrowType] enum.
  ArrowType arrowType;

  /// Defines the design of the link's back arrowhead.
  ///
  /// There are several designs, choose from [ArrowType] enum.
  ArrowType backArrowType;

  /// Defines the size of the link's front arrowhead.
  double arrowSize;

  /// Defines the size of the link's back arrowhead.
  double backArrowSize;

  /// Defines the width of the link's line.
  double lineWidth;

  /// Defines the color of the link's line and both arrowheads.
  Color color;

  /// Defines a visual design of a link on the canvas.
  LinkStyle({
    this.lineType = LineType.solid,
    this.arrowType = ArrowType.none,
    this.backArrowType = ArrowType.none,
    this.arrowSize = 5,
    this.backArrowSize = 5,
    this.lineWidth = 1,
    this.color = Colors.black,
  })  : assert(lineWidth > 0),
        assert(arrowSize > 0);

  Path getArrowTipPath(
    ArrowType arrowType,
    double arrowSize,
    Offset point1,
    Offset point2,
    double scale,
  ) {
    switch (arrowType) {
      case ArrowType.none:
        return Path();
      case ArrowType.arrow:
        return getArrowPath(arrowSize, point1, point2, scale, 1);
      case ArrowType.pointedArrow:
        return getArrowPath(arrowSize, point1, point2, scale, 2);
      case ArrowType.circle:
        return getCirclePath(arrowSize, point1, point2, scale, false);
      case ArrowType.centerCircle:
        return getCirclePath(arrowSize, point1, point2, scale, true);
      case ArrowType.semiCircle:
        return getSemiCirclePath(arrowSize, point1, point2, scale);
    }
  }

  Path getLinePath(Offset point1, Offset point2, double scale) {
    switch (lineType) {
      case LineType.solid:
        return getSolidLinePath(point1, point2);
      case LineType.dashed:
        return getDashedLinePath(point1, point2, scale, 16, 16);
      case LineType.dotted:
        return getDashedLinePath(
            point1, point2, scale, lineWidth, lineWidth * 5);
    }
  }

  Path getArrowPath(double arrowSize, Offset point1, Offset point2,
      double scale, double pointed) {
    Offset left = point2 +
        VectorUtils.normalizeVector(
                VectorUtils.getPerpendicularVector(point1, point2)) *
            arrowSize *
            scale -
        VectorUtils.normalizeVector(
                VectorUtils.getDirectionVector(point1, point2)) *
            pointed *
            arrowSize *
            scale;
    Offset right = point2 -
        VectorUtils.normalizeVector(
                VectorUtils.getPerpendicularVector(point1, point2)) *
            arrowSize *
            scale -
        VectorUtils.normalizeVector(
                VectorUtils.getDirectionVector(point1, point2)) *
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

  Path getCirclePath(double arrowSize, Offset point1, Offset point2,
      double scale, bool isCenter) {
    Path path = new Path();
    if (isCenter) {
      path.addOval(Rect.fromCircle(center: point2, radius: scale * arrowSize));
    } else {
      Offset circleCenter = point2 -
          VectorUtils.normalizeVector(
                  VectorUtils.getDirectionVector(point1, point2)) *
              arrowSize *
              scale;
      path.addOval(
          Rect.fromCircle(center: circleCenter, radius: scale * arrowSize));
    }
    return path;
  }

  Path getSemiCirclePath(
      double arrowSize, Offset point1, Offset point2, double scale) {
    Path path = new Path();
    Offset circleCenter = point2 -
        VectorUtils.normalizeVector(
                VectorUtils.getDirectionVector(point1, point2)) *
            arrowSize *
            scale;
    path.addArc(
      Rect.fromCircle(center: circleCenter, radius: scale * arrowSize),
      math.pi - math.atan2(point2.dx - point1.dx, point2.dy - point1.dy),
      -math.pi,
    );
    return path;
  }

  double getEndShortening(ArrowType arrowType) {
    double eps = 0.05;
    switch (arrowType) {
      case ArrowType.none:
        return 0;
      case ArrowType.arrow:
        return arrowSize - eps;
      case ArrowType.pointedArrow:
        return (arrowSize * 2) - eps;
      case ArrowType.circle:
        return arrowSize - eps;
      case ArrowType.centerCircle:
        return 0;
      case ArrowType.semiCircle:
        return arrowSize - eps;
    }
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

    Offset normalized = VectorUtils.normalizeVector(
        VectorUtils.getDirectionVector(point1, point2));
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
      point2.dx - normalized.dx * lineWidth * scale,
      point2.dy - normalized.dy * lineWidth * scale,
    );
    path.lineTo(point2.dx, point2.dy);
    return path;
  }

  LinkStyle.fromJson(Map<String, dynamic> json)
      : lineType = LineType.values[json['line_type']],
        arrowType = ArrowType.values[json['arrow_type']],
        backArrowType = ArrowType.values[json['back_arrow_type']],
        arrowSize = json['arrow_size'],
        backArrowSize = json['back_arrow_size'],
        lineWidth = json['line_width'],
        color = Color(int.parse(json['color'], radix: 16));

  Map<String, dynamic> toJson() => {
        'line_type': lineType.index,
        'arrow_type': arrowType.index,
        'back_arrow_type': backArrowType.index,
        'arrow_size': arrowSize,
        'back_arrow_size': backArrowSize,
        'line_width': lineWidth,
        'color': color.toString().split('(0x')[1].split(')')[0],
      };
}

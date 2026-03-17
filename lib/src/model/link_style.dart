import 'dart:math' as math;

import 'package:diagram_editor/src/util/vector_utils.dart';
import 'package:flutter/material.dart';

/// The shape of a link's arrowhead.
enum ArrowType {
  none,
  arrow,
  pointedArrow,
  circle,
  centerCircle,
  semiCircle,
}

/// The style of a link's line.
enum LineType {
  solid,
  dashed,
  dotted,
}

/// Defines the visual design of a link on the canvas.
@immutable
class LinkStyle {
  const LinkStyle({
    this.lineType = LineType.solid,
    this.arrowType = ArrowType.none,
    this.backArrowType = ArrowType.none,
    this.arrowSize = 5,
    this.backArrowSize = 5,
    this.lineWidth = 1,
    this.color = Colors.black,
  })  : assert(
          lineWidth > 0,
          'lineWidth must be positive',
        ),
        assert(
          arrowSize > 0,
          'arrowSize must be positive',
        );

  /// Deserializes a [LinkStyle] from JSON.
  ///
  /// Uses enum name strings for forward compatibility.
  LinkStyle.fromJson(Map<String, dynamic> json)
      : lineType = LineType.values.byName(
          json['line_type'] as String,
        ),
        arrowType = ArrowType.values.byName(
          json['arrow_type'] as String,
        ),
        backArrowType = ArrowType.values.byName(
          json['back_arrow_type'] as String,
        ),
        arrowSize = (json['arrow_size'] as num).toDouble(),
        backArrowSize = (json['back_arrow_size'] as num).toDouble(),
        lineWidth = (json['line_width'] as num).toDouble(),
        color = Color(
          int.parse(json['color'] as String, radix: 16),
        );

  /// The line style. Defaults to [LineType.solid].
  final LineType lineType;

  /// The front arrowhead type. Defaults to [ArrowType.none].
  final ArrowType arrowType;

  /// The back arrowhead type. Defaults to [ArrowType.none].
  final ArrowType backArrowType;

  /// The front arrowhead size. Defaults to 5.
  final double arrowSize;

  /// The back arrowhead size. Defaults to 5.
  final double backArrowSize;

  /// The line width. Defaults to 1.
  final double lineWidth;

  /// The color of the line and arrowheads. Defaults to [Colors.black].
  final Color color;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinkStyle &&
          lineType == other.lineType &&
          arrowType == other.arrowType &&
          backArrowType == other.backArrowType &&
          arrowSize == other.arrowSize &&
          backArrowSize == other.backArrowSize &&
          lineWidth == other.lineWidth &&
          color == other.color;

  @override
  int get hashCode => Object.hash(
        lineType,
        arrowType,
        backArrowType,
        arrowSize,
        backArrowSize,
        lineWidth,
        color,
      );

  /// Returns the path for an arrowhead at the tip of a link segment.
  Path getArrowTipPath(
    ArrowType arrowType,
    double arrowSize,
    Offset point1,
    Offset point2,
    double scale,
  ) {
    return switch (arrowType) {
      ArrowType.none => Path(),
      ArrowType.arrow => _getArrowPath(arrowSize, point1, point2, scale, 1),
      ArrowType.pointedArrow =>
        _getArrowPath(arrowSize, point1, point2, scale, 2),
      ArrowType.circle =>
        _getCirclePath(arrowSize, point1, point2, scale, isCenter: false),
      ArrowType.centerCircle =>
        _getCirclePath(arrowSize, point1, point2, scale, isCenter: true),
      ArrowType.semiCircle =>
        _getSemiCirclePath(arrowSize, point1, point2, scale),
    };
  }

  /// Returns the path for a link line segment between two points.
  Path getLinePath(Offset point1, Offset point2, double scale) {
    return switch (lineType) {
      LineType.solid => _getSolidLinePath(point1, point2),
      LineType.dashed => _getDashedLinePath(point1, point2, scale, 16, 16),
      LineType.dotted => _getDashedLinePath(
          point1,
          point2,
          scale,
          lineWidth,
          lineWidth * 5,
        ),
    };
  }

  /// Returns the shortening distance for an arrowhead type, so the line
  /// doesn't overlap the arrowhead.
  double getEndShortening(ArrowType arrowType) {
    const eps = 0.05;
    return switch (arrowType) {
      ArrowType.none => 0,
      ArrowType.arrow => arrowSize - eps,
      ArrowType.pointedArrow => (arrowSize * 2) - eps,
      ArrowType.circle => arrowSize - eps,
      ArrowType.centerCircle => 0,
      ArrowType.semiCircle => arrowSize - eps,
    };
  }

  Path _getArrowPath(
    double arrowSize,
    Offset point1,
    Offset point2,
    double scale,
    double pointed,
  ) {
    final perpendicular = VectorUtils.normalizeVector(
      VectorUtils.getPerpendicularVector(point1, point2),
    );
    final direction = VectorUtils.normalizeVector(
      VectorUtils.getDirectionVector(point1, point2),
    );

    final left = point2 +
        perpendicular * arrowSize * scale -
        direction * pointed * arrowSize * scale;
    final right = point2 -
        perpendicular * arrowSize * scale -
        direction * pointed * arrowSize * scale;

    return Path()
      ..moveTo(point2.dx, point2.dy)
      ..lineTo(left.dx, left.dy)
      ..lineTo(right.dx, right.dy)
      ..close();
  }

  Path _getCirclePath(
    double arrowSize,
    Offset point1,
    Offset point2,
    double scale, {
    required bool isCenter,
  }) {
    final center = isCenter
        ? point2
        : point2 -
            VectorUtils.normalizeVector(
                  VectorUtils.getDirectionVector(point1, point2),
                ) *
                arrowSize *
                scale;
    return Path()
      ..addOval(Rect.fromCircle(center: center, radius: scale * arrowSize));
  }

  Path _getSemiCirclePath(
    double arrowSize,
    Offset point1,
    Offset point2,
    double scale,
  ) {
    final circleCenter = point2 -
        VectorUtils.normalizeVector(
              VectorUtils.getDirectionVector(point1, point2),
            ) *
            arrowSize *
            scale;
    return Path()
      ..addArc(
        Rect.fromCircle(center: circleCenter, radius: scale * arrowSize),
        math.pi - math.atan2(point2.dx - point1.dx, point2.dy - point1.dy),
        -math.pi,
      );
  }

  Path _getSolidLinePath(Offset point1, Offset point2) {
    return Path()
      ..moveTo(point1.dx, point1.dy)
      ..lineTo(point2.dx, point2.dy);
  }

  Path _getDashedLinePath(
    Offset point1,
    Offset point2,
    double scale,
    double dashLength,
    double dashSpace,
  ) {
    final path = Path();
    final normalized = VectorUtils.normalizeVector(
      VectorUtils.getDirectionVector(point1, point2),
    );
    final lineDistance = (point2 - point1).distance;
    var currentPoint = Offset(point1.dx, point1.dy);

    final dash = dashLength * scale;
    final space = dashSpace * scale;
    var currentDistance = 0.0;

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

    path
      ..moveTo(
        point2.dx - normalized.dx * lineWidth * scale,
        point2.dy - normalized.dy * lineWidth * scale,
      )
      ..lineTo(point2.dx, point2.dy);
    return path;
  }

  /// Serializes this [LinkStyle] to JSON.
  Map<String, dynamic> toJson() => {
        'line_type': lineType.name,
        'arrow_type': arrowType.name,
        'back_arrow_type': backArrowType.name,
        'arrow_size': arrowSize,
        'back_arrow_size': backArrowSize,
        'line_width': lineWidth,
        'color': color.toARGB32().toRadixString(16),
      };
}

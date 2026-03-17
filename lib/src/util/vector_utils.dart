import 'package:flutter/material.dart';

/// Static utility methods for 2D vector operations using [Offset].
class VectorUtils {
  /// Returns the direction vector from [point1] to [point2].
  static Offset getDirectionVector(Offset point1, Offset point2) {
    return point2 - point1;
  }

  /// Returns the perpendicular vector to the line from [point1] to [point2].
  static Offset getPerpendicularVector(Offset point1, Offset point2) {
    return Offset(point2.dy - point1.dy, -(point2.dx - point1.dx));
  }

  /// Returns the perpendicular vector to the given [vector].
  static Offset getPerpendicularVectorToVector(
    Offset vector, {
    bool clockwise = true,
  }) {
    return clockwise
        ? Offset(-vector.dy, vector.dx)
        : Offset(vector.dy, -vector.dx);
  }

  /// Returns the unit (normalized) vector of [vector].
  static Offset normalizeVector(Offset vector) {
    return vector.distance == 0 ? vector : vector / vector.distance;
  }

  /// Returns the start of a shortened line from [point1] to [point2].
  static Offset getShorterLineStart(
    Offset point1,
    Offset point2,
    double shortening,
  ) {
    return point1 +
        normalizeVector(getDirectionVector(point1, point2)) * shortening;
  }

  /// Returns the end of a shortened line from [point1] to [point2].
  static Offset getShorterLineEnd(
    Offset point1,
    Offset point2,
    double shortening,
  ) {
    return point2 -
        normalizeVector(getDirectionVector(point1, point2)) * shortening;
  }

  /// Returns a [Path] forming a rectangle around the line segment.
  static Path getRectAroundLine(
    Offset point1,
    Offset point2,
    double rectWidth,
  ) {
    final pnsv =
        normalizeVector(getPerpendicularVector(point1, point2)) * rectWidth;

    return Path()
      ..moveTo(point1.dx + pnsv.dx, point1.dy + pnsv.dy)
      ..lineTo(point2.dx + pnsv.dx, point2.dy + pnsv.dy)
      ..lineTo(point2.dx - pnsv.dx, point2.dy - pnsv.dy)
      ..lineTo(point1.dx - pnsv.dx, point1.dy - pnsv.dy)
      ..close();
  }
}

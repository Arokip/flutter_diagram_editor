import 'package:flutter/material.dart';

/// Simple class with static methods for computing basic vector operation.
/// It uses Offset as 2D vector.
class VectorUtils {
  static Offset getDirectionVector(Offset point1, Offset point2) {
    return point2 - point1;
  }

  static Offset getPerpendicularVector(Offset point11, Offset point2) {
    return Offset((point2.dy - point11.dy), -(point2.dx - point11.dx));
  }

  static Offset getPerpendicularVectorToVector(
    Offset vector, [
    bool clockwise = true,
  ]) {
    return clockwise
        ? Offset(-vector.dy, vector.dx)
        : Offset(vector.dy, -vector.dx);
  }

  static Offset normalizeVector(Offset vector) {
    return vector.distance == 0.0 ? vector : vector / vector.distance;
  }

  static Offset getShorterLineStart(
      Offset point1, Offset point2, double shortening) {
    return point1 +
        normalizeVector(getDirectionVector(point1, point2)) * shortening;
  }

  static Offset getShorterLineEnd(
      Offset point1, Offset point2, double shortening) {
    return point2 -
        normalizeVector(getDirectionVector(point1, point2)) * shortening;
  }

  static Path getRectAroundLine(Offset point1, Offset point2, rectWidth) {
    Path path = Path();
    Offset pnsv = VectorUtils.normalizeVector(
            VectorUtils.getPerpendicularVector(point1, point2)) *
        rectWidth;

    // rect around line
    path.moveTo(point1.dx + pnsv.dx, point1.dy + pnsv.dy);
    path.lineTo(point2.dx + pnsv.dx, point2.dy + pnsv.dy);
    path.lineTo(point2.dx - pnsv.dx, point2.dy - pnsv.dy);
    path.lineTo(point1.dx - pnsv.dx, point1.dy - pnsv.dy);
    path.close();

    return path;
  }
}

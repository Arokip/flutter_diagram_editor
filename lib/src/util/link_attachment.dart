import 'package:diagram_editor/src/model/component_data.dart';
import 'package:flutter/material.dart';

/// Function that computes the alignment point on a component where a link
/// endpoint should attach, given the component and the target point.
typedef LinkEndpointAligner = Alignment Function(
  ComponentData<dynamic> componentData,
  Offset targetPoint,
);

/// Provides static methods that return [LinkEndpointAligner] functions
/// for different component shapes.
class LinkAttachment {
  /// Attaches a link endpoint to the border of a rectangle.
  static LinkEndpointAligner rectangular() {
    return (componentData, targetPoint) {
      var pointPosition = targetPoint -
          (componentData.position + componentData.size.center(Offset.zero));
      pointPosition = Offset(
        pointPosition.dx / componentData.size.width,
        pointPosition.dy / componentData.size.height,
      );

      final Offset pointAlignment;
      if (pointPosition.dx.abs() >= pointPosition.dy.abs()) {
        pointAlignment = Offset(
          pointPosition.dx / pointPosition.dx.abs(),
          pointPosition.dy / pointPosition.dx.abs(),
        );
      } else {
        pointAlignment = Offset(
          pointPosition.dx / pointPosition.dy.abs(),
          pointPosition.dy / pointPosition.dy.abs(),
        );
      }
      return Alignment(pointAlignment.dx, pointAlignment.dy);
    };
  }

  /// Attaches a link endpoint to the border of an oval.
  static LinkEndpointAligner oval() {
    return (componentData, targetPoint) {
      var pointPosition = targetPoint -
          (componentData.position + componentData.size.center(Offset.zero));
      pointPosition = Offset(
        pointPosition.dx / componentData.size.width,
        pointPosition.dy / componentData.size.height,
      );

      final pointAlignment = pointPosition / pointPosition.distance;
      return Alignment(pointAlignment.dx, pointAlignment.dy);
    };
  }

  /// Attaches a link endpoint to the border of a crystal (diamond) shape.
  static LinkEndpointAligner crystal() {
    return (componentData, targetPoint) {
      var pointPosition = targetPoint -
          (componentData.position + componentData.size.center(Offset.zero));
      pointPosition = Offset(
        pointPosition.dx / componentData.size.width,
        pointPosition.dy / componentData.size.height,
      );

      final pointAlignment =
          pointPosition / (pointPosition.dx.abs() + pointPosition.dy.abs());
      return Alignment(pointAlignment.dx, pointAlignment.dy);
    };
  }

  /// Attaches a link endpoint to the center of the component.
  static LinkEndpointAligner center() {
    return (_, __) => Alignment.center;
  }
}

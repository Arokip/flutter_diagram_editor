import 'package:diagram_editor/src/abstraction_layer/policy/base/link_attachment_policy.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:flutter/material.dart';

/// Attaches a link endpoint to border of a rectangle.
mixin LinkAttachmentRectPolicy implements LinkAttachmentPolicy {
  @override
  Alignment getLinkEndpointAlignment(
    BuildContext context,
    ComponentData componentData,
    Offset targetPoint,
  ) {
    Offset pointPosition = targetPoint -
        (componentData.position + componentData.size.center(Offset.zero));
    pointPosition = Offset(
      pointPosition.dx / componentData.size.width,
      pointPosition.dy / componentData.size.height,
    );

    Offset pointAlignment;
    if (pointPosition.dx.abs() >= pointPosition.dy.abs()) {
      pointAlignment = Offset(pointPosition.dx / pointPosition.dx.abs(),
          pointPosition.dy / pointPosition.dx.abs());
    } else {
      pointAlignment = Offset(pointPosition.dx / pointPosition.dy.abs(),
          pointPosition.dy / pointPosition.dy.abs());
    }
    return Alignment(pointAlignment.dx, pointAlignment.dy);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/basics/basic_custom_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_component_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/utils/link_style.dart';

mixin BasicComponentPolicy
    implements DefaultComponentPolicy, CustomStatePolicy {
  onComponentTap(String componentId) {
    print(
        'comp from policy: ${canvasReader.model.getComponent(componentId).position}');
    print('custom comp: ${custom++}');

    selectedComponentId = componentId;

    canvasWriter.model.moveComponentToTheFront(componentId);

    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showComponentHighlight(componentId);
  }

  Offset lastFocalPoint;

  onComponentScaleStart(componentId, details) {
    lastFocalPoint = details.localFocalPoint;
  }

  onComponentScaleUpdate(componentId, details) {
    canvasWriter.model
        .moveComponent(componentId, details.localFocalPoint - lastFocalPoint);
    lastFocalPoint = details.localFocalPoint;
  }

  @override
  onComponentLongPress(String componentId) {
    if (selectedComponentId != null) {
      canvasWriter.model.connectTwoComponents(
        sourceComponentId: selectedComponentId,
        targetComponentId: componentId,
        linkStyle: LinkStyle(
          arrowType: ArrowType.pointedArrow,
          width: 1.5,
        ),
      );
    }
  }
}

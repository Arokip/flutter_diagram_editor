import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/defaults/default_component_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/policy_set.dart';

mixin BasicComponentPolicy implements DefaultComponentPolicy {
  onComponentTap(String componentId) {
    print(
        'comp from policy: ${canvasReader.model.getComponent(componentId).position}');
  }

  onComponentTapDown(String componentId, TapDownDetails details) {
    print('cid: $componentId');

    print(
        'comp from policy: ${canvasReader.model.getComponent(componentId).position}');
  }

  onComponentPanUpdate(String componentId, DragUpdateDetails details) {
    canvasWriter.model.moveComponent(componentId, details.delta);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/defaults/default_link_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/policy_set.dart';

mixin BasicLinkPolicy implements DefaultLinkPolicy {
  onLinkTap(String componentId) {
    print(
        'comp from policy: ${canvasReader.model.getComponent(componentId).position}');
  }

  onLinkTapDown(String componentId, TapDownDetails details) {
    print('cid: $componentId');

    print(
        'comp from policy: ${canvasReader.model.getComponent(componentId).position}');
  }

  onLinkPanUpdate(String componentId, DragUpdateDetails details) {
    // canvasWriter.model.moveComponent(componentId, details.delta);
  }
}

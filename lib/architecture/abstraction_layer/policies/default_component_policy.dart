import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default_policy.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_context.dart';

class DefaultComponentPolicy extends DefaultPolicy {
  DefaultComponentPolicy(CanvasContext canvasContext) : super(canvasContext);

  onTap(String componentId) {
    print(
        'comp from policy: ${canvasReader.model.getComponent(componentId).position}');
  }

  onTapDown(String componentId, TapDownDetails details) {
    print('cid: $componentId');

    print(
        'comp from policy: ${canvasReader.model.getComponent(componentId).position}');
  }

  onPanUpdate(String componentId, DragUpdateDetails details) {
    canvasWriter.model.moveComponent(componentId, details.delta);
  }
}

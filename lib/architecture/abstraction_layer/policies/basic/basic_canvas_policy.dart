import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default/default_canvas_policy.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/component_data.dart';
import 'package:uuid/uuid.dart';

mixin BasicCanvasPolicy implements DefaultCanvasPolicy {
  onCanvasTap() {
    print('canvas tapped');
  }

  onCanvasTapDown(TapDownDetails details) {
    print('canvas tapped at: ${details.localPosition}');
    canvasWriter.model.addComponent(ComponentData(
      id: Uuid().v4(),
      position: details.localPosition - canvasReader.state.getCanvasPosition(),
    ));
  }

  onCanvasPanUpdate(DragUpdateDetails details) {
    print('moving canvas, position: ${canvasReader.state.getCanvasPosition()}');
    canvasWriter.state.moveCanvas(details.delta);
  }
}

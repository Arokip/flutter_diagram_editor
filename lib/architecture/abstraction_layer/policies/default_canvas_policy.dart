import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default_policy.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_context.dart';

class DefaultCanvasPolicy extends DefaultPolicy {
  DefaultCanvasPolicy(CanvasContext canvasContext) : super(canvasContext);

  onTap() {
    print('canvas tapped');
  }

  onTapDown(TapDownDetails details) {
    print('canvas tapped at: ${details.localPosition}');
  }

  onPanUpdate(DragUpdateDetails details) {
    print('moving canvas, position: ${canvasReader.state.getCanvasPosition()}');
    canvasWriter.state.moveCanvas(details.delta);
  }
}

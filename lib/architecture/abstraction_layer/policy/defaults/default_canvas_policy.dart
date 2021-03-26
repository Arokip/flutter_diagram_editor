import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/policy_set.dart';

mixin DefaultCanvasPolicy on PolicySet {
  onCanvasTap() {}

  onCanvasTapDown(TapDownDetails details) {}

  onCanvasPanUpdate(DragUpdateDetails details) {}
}

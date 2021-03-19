import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/policy_set.dart';

mixin DefaultComponentPolicy on PolicySet {
  onComponentTap(String componentId) {}

  onComponentTapDown(String componentId, TapDownDetails details) {}

  onComponentPanUpdate(String componentId, DragUpdateDetails details) {}
}

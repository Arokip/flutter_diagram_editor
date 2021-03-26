import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/policy_set.dart';

mixin DefaultLinkPolicy on PolicySet {
  onLinkTap(String componentId) {}

  onLinkTapDown(String componentId, TapDownDetails details) {}

  onLinkPanUpdate(String componentId, DragUpdateDetails details) {}
}

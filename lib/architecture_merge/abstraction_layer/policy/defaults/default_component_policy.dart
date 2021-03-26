import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/policy_set.dart';

mixin DefaultComponentPolicy on PolicySet {
  onComponentTap(String componentId) {}

  onComponentTapDown(String componentId, TapDownDetails details) {}

  onComponentTapUp(String componentId, TapUpDetails details) {}

  onComponentTapCancel(String componentId) {}

  onComponentScaleStart(String componentId, ScaleStartDetails details) {}

  onComponentScaleUpdate(String componentId, ScaleUpdateDetails details) {}

  onComponentScaleEnd(String componentId, ScaleEndDetails details) {}

  onComponentLongPress(String componentId) {}

  onComponentLongPressStart(
      String componentId, LongPressStartDetails details) {}

  onComponentLongPressMoveUpdate(
      String componentId, LongPressMoveUpdateDetails details) {}

  onComponentLongPressEnd(String componentId, LongPressEndDetails details) {}

  onComponentLongPressUp(String componentId) {}
}

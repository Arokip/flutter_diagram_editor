import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

mixin ComponentPolicy on BasePolicySet {
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

  onComponentPointerSignal(String componentId, PointerSignalEvent event) {}
}

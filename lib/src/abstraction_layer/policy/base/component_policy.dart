import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/gestures.dart';

/// Allows you to define the component behaviour on any gesture registered by the [Component].
mixin ComponentPolicy on BasePolicySet {
  void onComponentTap(String componentId) {}

  void onComponentTapDown(String componentId, TapDownDetails details) {}

  void onComponentTapUp(String componentId, TapUpDetails details) {}

  void onComponentTapCancel(String componentId) {}

  void onComponentScaleStart(String componentId, ScaleStartDetails details) {}

  void onComponentScaleUpdate(String componentId, ScaleUpdateDetails details) {}

  void onComponentScaleEnd(String componentId, ScaleEndDetails details) {}

  void onComponentLongPress(String componentId) {}

  void onComponentLongPressStart(String componentId, LongPressStartDetails details) {}

  void onComponentLongPressMoveUpdate(String componentId, LongPressMoveUpdateDetails details) {}

  void onComponentLongPressEnd(String componentId, LongPressEndDetails details) {}

  void onComponentLongPressUp(String componentId) {}

  void onComponentPointerSignal(String componentId, PointerSignalEvent event) {}
}

import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Allows you to define the canvas behaviour on any gesture registered by the [Canvas].
mixin CanvasPolicy on BasePolicySet {
  void onCanvasTap() {}

  void onCanvasTapDown(TapDownDetails details) {}

  void onCanvasTapUp(TapUpDetails details) {}

  void onCanvasTapCancel() {}

  void onCanvasLongPress() {}

  void onCanvasScaleStart(ScaleStartDetails details) {}

  void onCanvasScaleUpdate(ScaleUpdateDetails details) {}

  void onCanvasScaleEnd(ScaleEndDetails details) {}

  void onCanvasLongPressStart(LongPressStartDetails details) {}

  void onCanvasLongPressMoveUpdate(LongPressMoveUpdateDetails details) {}

  void onCanvasLongPressEnd(LongPressEndDetails details) {}

  void onCanvasLongPressUp() {}

  void onCanvasPointerSignal(PointerSignalEvent event) {}

  bool get showLinksOnTopOfComponents => true;
}

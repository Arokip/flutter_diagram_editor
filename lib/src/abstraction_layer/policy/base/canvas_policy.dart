import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Allows you to define the canvas behaviour on any gesture registered by the [Canvas].
mixin CanvasPolicy on BasePolicySet {
  onCanvasTap(BuildContext context) {}

  onCanvasTapDown(BuildContext context, TapDownDetails details) {}

  onCanvasTapUp(BuildContext context, TapUpDetails details) {}

  onCanvasTapCancel(BuildContext context) {}

  onCanvasLongPress(BuildContext context) {}

  onCanvasScaleStart(BuildContext context, ScaleStartDetails details) {}

  onCanvasScaleUpdate(BuildContext context, ScaleUpdateDetails details) {}

  onCanvasScaleEnd(BuildContext context, ScaleEndDetails details) {}

  onCanvasLongPressStart(BuildContext context, LongPressStartDetails details) {}

  onCanvasLongPressMoveUpdate(
      BuildContext context, LongPressMoveUpdateDetails details) {}

  onCanvasLongPressEnd(BuildContext context, LongPressEndDetails details) {}

  onCanvasLongPressUp(BuildContext context) {}

  onCanvasPointerSignal(BuildContext context, PointerSignalEvent event) {}
}

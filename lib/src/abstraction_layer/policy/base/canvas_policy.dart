import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

mixin CanvasPolicy on BasePolicySet {
  onCanvasTap() {}

  onCanvasTapDown(TapDownDetails details) {}

  onCanvasTapUp(TapUpDetails details) {}

  onCanvasTapCancel() {}

  onCanvasLongPress() {}

  onCanvasScaleStart(ScaleStartDetails details) {}

  onCanvasScaleUpdate(ScaleUpdateDetails details) {}

  onCanvasScaleEnd(ScaleEndDetails details) {}

  onCanvasLongPressStart(LongPressStartDetails details) {}

  onCanvasLongPressMoveUpdate(LongPressMoveUpdateDetails details) {}

  onCanvasLongPressEnd(LongPressEndDetails details) {}

  onCanvasLongPressUp() {}

  onCanvasPointerSignal(PointerSignalEvent event) {}
}

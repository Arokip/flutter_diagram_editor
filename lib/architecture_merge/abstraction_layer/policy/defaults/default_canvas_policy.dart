import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/policy_set.dart';

mixin DefaultCanvasPolicy on PolicySet {
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

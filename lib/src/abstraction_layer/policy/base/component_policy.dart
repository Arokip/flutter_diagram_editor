import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Allows you to define the component behaviour on any gesture registered by the [Component].
mixin ComponentPolicy on BasePolicySet {
  onComponentTap(BuildContext context, String componentId) {}

  onComponentTapDown(
    BuildContext context,
    String componentId,
    TapDownDetails details,
  ) {}

  onComponentTapUp(
    BuildContext context,
    String componentId,
    TapUpDetails details,
  ) {}

  onComponentTapCancel(BuildContext context, String componentId) {}

  onComponentScaleStart(
      BuildContext context, String componentId, ScaleStartDetails details) {}

  onComponentScaleUpdate(
      BuildContext context, String componentId, ScaleUpdateDetails details) {}

  onComponentScaleEnd(
      BuildContext context, String componentId, ScaleEndDetails details) {}

  onComponentLongPress(BuildContext context, String componentId) {}

  onComponentLongPressStart(BuildContext context, String componentId,
      LongPressStartDetails details) {}

  onComponentLongPressMoveUpdate(BuildContext context, String componentId,
      LongPressMoveUpdateDetails details) {}

  onComponentLongPressEnd(
      BuildContext context, String componentId, LongPressEndDetails details) {}

  onComponentLongPressUp(BuildContext context, String componentId) {}

  onComponentPointerSignal(
      BuildContext context, String componentId, PointerSignalEvent event) {}
}

import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Allows you to define the link behaviour on any gesture registered by the [Link].
mixin LinkPolicy on BasePolicySet {
  onLinkTap(BuildContext context, String linkId) {}

  onLinkTapDown(BuildContext context, String linkId, TapDownDetails details) {}

  onLinkTapUp(BuildContext context, String linkId, TapUpDetails details) {}

  onLinkTapCancel(BuildContext context, String linkId) {}

  onLinkScaleStart(
      BuildContext context, String linkId, ScaleStartDetails details) {}

  onLinkScaleUpdate(
      BuildContext context, String linkId, ScaleUpdateDetails details) {}

  onLinkScaleEnd(
      BuildContext context, String linkId, ScaleEndDetails details) {}

  onLinkLongPress(BuildContext context, String linkId) {}

  onLinkLongPressStart(
      BuildContext context, String linkId, LongPressStartDetails details) {}

  onLinkLongPressMoveUpdate(BuildContext context, String linkId,
      LongPressMoveUpdateDetails details) {}

  onLinkLongPressEnd(
      BuildContext context, String linkId, LongPressEndDetails details) {}

  onLinkLongPressUp(BuildContext context, String linkId) {}

  onLinkPointerSignal(
      BuildContext context, String linkId, PointerSignalEvent event) {}
}

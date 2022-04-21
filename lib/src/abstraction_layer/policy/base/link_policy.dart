// ignore_for_file: no-empty-block
import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/gestures.dart';

/// Allows you to define the link behaviour on any gesture registered by the [Link].
mixin LinkPolicy on BasePolicySet {
  onLinkTap(String linkId) {}

  onLinkTapDown(String linkId, TapDownDetails details) {}

  onLinkTapUp(String linkId, TapUpDetails details) {}

  onLinkTapCancel(String linkId) {}

  onLinkScaleStart(String linkId, ScaleStartDetails details) {}

  onLinkScaleUpdate(String linkId, ScaleUpdateDetails details) {}

  onLinkScaleEnd(String linkId, ScaleEndDetails details) {}

  onLinkLongPress(String linkId) {}

  onLinkLongPressStart(String linkId, LongPressStartDetails details) {}

  onLinkLongPressMoveUpdate(
    String linkId,
    LongPressMoveUpdateDetails details,
  ) {}

  onLinkLongPressEnd(String linkId, LongPressEndDetails details) {}

  onLinkLongPressUp(String linkId) {}

  onLinkPointerSignal(String linkId, PointerSignalEvent event) {}
}

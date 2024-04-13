import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/gestures.dart';

/// Allows you to define the link behaviour on any gesture registered by the [Link].
mixin LinkPolicy on BasePolicySet {
  void onLinkTap(String linkId) {}

  void onLinkTapDown(String linkId, TapDownDetails details) {}

  void onLinkTapUp(String linkId, TapUpDetails details) {}

  void onLinkTapCancel(String linkId) {}

  void onLinkScaleStart(String linkId, ScaleStartDetails details) {}

  void onLinkScaleUpdate(String linkId, ScaleUpdateDetails details) {}

  void onLinkScaleEnd(String linkId, ScaleEndDetails details) {}

  void onLinkLongPress(String linkId) {}

  void onLinkLongPressStart(String linkId, LongPressStartDetails details) {}

  void onLinkLongPressMoveUpdate(
      String linkId, LongPressMoveUpdateDetails details) {}

  void onLinkLongPressEnd(String linkId, LongPressEndDetails details) {}

  void onLinkLongPressUp(String linkId) {}

  void onLinkPointerSignal(String linkId, PointerSignalEvent event) {}
}

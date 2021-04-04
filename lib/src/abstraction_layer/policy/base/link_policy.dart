import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
      String linkId, LongPressMoveUpdateDetails details) {}

  onLinkLongPressEnd(String linkId, LongPressEndDetails details) {}

  onLinkLongPressUp(String linkId) {}

  onLinkPointerSignal(String linkId, PointerSignalEvent event) {}

  //

  onDeleteLinkIconTap(String linkId) {}

  CustomPainter deleteIconPainter(Offset location) {
    return null;
  }
}

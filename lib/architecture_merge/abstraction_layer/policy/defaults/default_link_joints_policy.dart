import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/policy_set.dart';

mixin DefaultLinkJointPolicy on PolicySet {
  onLinkJointTap(int jointIndex, String linkId) {}

  onLinkJointTapDown(int jointIndex, String linkId, TapDownDetails details) {}

  onLinkJointTapUp(int jointIndex, String linkId, TapUpDetails details) {}

  onLinkJointTapCancel(int jointIndex, String linkId) {}

  onLinkJointScaleStart(
      int jointIndex, String linkId, ScaleStartDetails details) {}

  onLinkJointScaleUpdate(
      int jointIndex, String linkId, ScaleUpdateDetails details) {}

  onLinkJointScaleEnd(int jointIndex, String linkId, ScaleEndDetails details) {}

  onLinkJointLongPress(int jointIndex, String linkId) {}

  onLinkJointLongPressStart(
      int jointIndex, String linkId, LongPressStartDetails details) {}

  onLinkJointLongPressMoveUpdate(
      int jointIndex, String linkId, LongPressMoveUpdateDetails details) {}

  onLinkJointLongPressEnd(
      int jointIndex, String linkId, LongPressEndDetails details) {}

  onLinkJointLongPressUp(int jointIndex, String linkId) {}
}

import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/material.dart';

/// Allows you to define the link's joint behaviour on any gesture registered by the link's joint.
mixin LinkJointPolicy on BasePolicySet {
  onLinkJointTap(int jointIndex, String linkId) {}

  onLinkJointTapDown(int jointIndex, String linkId, TapDownDetails details) {}

  onLinkJointTapUp(int jointIndex, String linkId, TapUpDetails details) {}

  onLinkJointTapCancel(int jointIndex, String linkId) {}

  onLinkJointScaleStart(int jointIndex, String linkId, ScaleStartDetails details) {}

  onLinkJointScaleUpdate(int jointIndex, String linkId, ScaleUpdateDetails details) {}

  onLinkJointScaleEnd(int jointIndex, String linkId, ScaleEndDetails details) {}

  onLinkJointLongPress(int jointIndex, String linkId) {}

  onLinkJointLongPressStart(int jointIndex, String linkId, LongPressStartDetails details) {}

  onLinkJointLongPressMoveUpdate(int jointIndex, String linkId, LongPressMoveUpdateDetails details) {}

  onLinkJointLongPressEnd(int jointIndex, String linkId, LongPressEndDetails details) {}

  onLinkJointLongPressUp(int jointIndex, String linkId) {}
}

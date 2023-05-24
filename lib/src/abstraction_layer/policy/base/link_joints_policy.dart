import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/material.dart';

/// Allows you to define the link's joint behaviour on any gesture registered by the link's joint.
mixin LinkJointPolicy on BasePolicySet {
  onLinkJointTap(BuildContext context, int jointIndex, String linkId) {}

  onLinkJointTapDown(BuildContext context, int jointIndex, String linkId,
      TapDownDetails details) {}

  onLinkJointTapUp(BuildContext context, int jointIndex, String linkId,
      TapUpDetails details) {}

  onLinkJointTapCancel(BuildContext context, int jointIndex, String linkId) {}

  onLinkJointScaleStart(BuildContext context, int jointIndex, String linkId,
      ScaleStartDetails details) {}

  onLinkJointScaleUpdate(BuildContext context, int jointIndex, String linkId,
      ScaleUpdateDetails details) {}

  onLinkJointScaleEnd(BuildContext context, int jointIndex, String linkId,
      ScaleEndDetails details) {}

  onLinkJointLongPress(BuildContext context, int jointIndex, String linkId) {}

  onLinkJointLongPressStart(BuildContext context, int jointIndex, String linkId,
      LongPressStartDetails details) {}

  onLinkJointLongPressMoveUpdate(BuildContext context, int jointIndex,
      String linkId, LongPressMoveUpdateDetails details) {}

  onLinkJointLongPressEnd(BuildContext context, int jointIndex, String linkId,
      LongPressEndDetails details) {}

  onLinkJointLongPressUp(int jointIndex, String linkId) {}
}

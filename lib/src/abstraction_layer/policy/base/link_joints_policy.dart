import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/material.dart';

/// Allows you to define the link's joint behaviour on any gesture registered by the link's joint.
mixin LinkJointPolicy on BasePolicySet {
  void onLinkJointTap(int jointIndex, String linkId) {}

  void onLinkJointTapDown(
      int jointIndex, String linkId, TapDownDetails details) {}

  void onLinkJointTapUp(int jointIndex, String linkId, TapUpDetails details) {}

  void onLinkJointTapCancel(int jointIndex, String linkId) {}

  void onLinkJointScaleStart(
      int jointIndex, String linkId, ScaleStartDetails details) {}

  void onLinkJointScaleUpdate(
      int jointIndex, String linkId, ScaleUpdateDetails details) {}

  void onLinkJointScaleEnd(
      int jointIndex, String linkId, ScaleEndDetails details) {}

  void onLinkJointLongPress(int jointIndex, String linkId) {}

  void onLinkJointLongPressStart(
      int jointIndex, String linkId, LongPressStartDetails details) {}

  void onLinkJointLongPressMoveUpdate(
      int jointIndex, String linkId, LongPressMoveUpdateDetails details) {}

  void onLinkJointLongPressEnd(
      int jointIndex, String linkId, LongPressEndDetails details) {}

  void onLinkJointLongPressUp(int jointIndex, String linkId) {}
}

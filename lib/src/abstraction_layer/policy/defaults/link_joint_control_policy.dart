import 'package:diagram_editor/src/abstraction_layer/policy/base/link_joints_policy.dart';
import 'package:flutter/material.dart';

mixin LinkJointControlPolicy implements LinkJointPolicy {
  @override
  onLinkJointLongPress(int jointIndex, String linkId) {
    canvasWriter.model.removeLinkMiddlePoint(linkId, jointIndex);
    canvasWriter.model.updateLink(linkId);
  }

  @override
  onLinkJointScaleUpdate(
      int jointIndex, String linkId, ScaleUpdateDetails details) {
    canvasWriter.model.setLinkMiddlePointPosition(
        linkId, details.localFocalPoint, jointIndex);
    canvasWriter.model.updateLink(linkId);
  }
}

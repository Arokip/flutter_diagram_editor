import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_link_joints_policy.dart';

mixin BasicLinkJointPolicy implements DefaultLinkJointPolicy {
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

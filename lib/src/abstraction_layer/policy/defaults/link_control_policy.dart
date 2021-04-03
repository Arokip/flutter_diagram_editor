import 'package:diagram_editor/src/abstraction_layer/policy/base/link_joints_policy.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base/link_policy.dart';
import 'package:flutter/material.dart';

mixin LinkControlPolicy implements LinkPolicy, LinkJointPolicy {
  @override
  onLinkTapUp(String linkId, TapUpDetails details) {
    canvasWriter.model.showLinkJoints(linkId);

    canvasWriter.model.showDeleteIconOnPosition(linkId,
        canvasReader.state.fromCanvasCoordinates(details.localPosition));
  }

  var segmentIndex;

  @override
  onLinkLongPressStart(String linkId, LongPressStartDetails details) {
    canvasWriter.model.hideLinkDeleteIcon(linkId);
    canvasWriter.model.showLinkJoints(linkId);
    segmentIndex = canvasReader.model
        .determineLinkSegmentIndex(linkId, details.localPosition);
    if (segmentIndex != null) {
      canvasWriter.model
          .insertLinkMiddlePoint(linkId, details.localPosition, segmentIndex);
      canvasWriter.model.updateLink(linkId);
    }
  }

  @override
  onLinkLongPressMoveUpdate(String linkId, LongPressMoveUpdateDetails details) {
    canvasWriter.model.setLinkMiddlePointPosition(
        linkId, details.localPosition, segmentIndex);
    canvasWriter.model.updateLink(linkId);
  }

  @override
  onDeleteLinkIconTap(String linkId) {
    canvasWriter.model.removeLink(linkId);
  }
}

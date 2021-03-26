import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/basics/basic_custom_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_link_joints_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_link_policy.dart';

mixin BasicLinkPolicy
    implements DefaultLinkPolicy, DefaultLinkJointPolicy, CustomStatePolicy {
  @override
  onLinkTapUp(String linkId, TapUpDetails details) {
    canvasWriter.model.showLinkJoints(linkId);

    selectedLinkId = linkId;

    print('link tap up');
    canvasWriter.model.showDeleteIconOnPosition(linkId,
        canvasReader.state.fromCanvasCoordinates(details.localPosition));
  }

  var segmentIndex;

  @override
  onLinkLongPressStart(String linkId, LongPressStartDetails details) {
    canvasWriter.model.showLinkJoints(linkId);
    segmentIndex = canvasReader.model
        .determineLinkSegmentIndex(linkId, details.localPosition);
    if (segmentIndex != null) {
      canvasWriter.model
          .insertLinkMiddlePoint(linkId, details.localPosition, segmentIndex);
    }
  }

  @override
  onLinkLongPressMoveUpdate(String linkId, LongPressMoveUpdateDetails details) {
    if (segmentIndex != null) {
      canvasWriter.model.setLinkMiddlePointPosition(
          linkId, details.localPosition, segmentIndex);
      canvasWriter.model.updateLink(linkId);
    }
  }

  @override
  onDeleteLinkIconTap(String linkId) {
    canvasWriter.model.removeLink(linkId);
  }
}

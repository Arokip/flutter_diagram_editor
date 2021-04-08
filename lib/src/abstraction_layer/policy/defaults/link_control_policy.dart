import 'package:diagram_editor/src/abstraction_layer/policy/base/link_joints_policy.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base/link_policy.dart';
import 'package:flutter/material.dart';

mixin LinkControlPolicy implements LinkPolicy, LinkJointPolicy {
  @override
  onLinkTapUp(String linkId, TapUpDetails details) {
    canvasWriter.model.hideAllTapLinkWidgets();
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);

    canvasWriter.model.showTapLinkWidgetOnPosition(linkId,
        canvasReader.state.fromCanvasCoordinates(details.localPosition));
  }

  var segmentIndex;

  @override
  onLinkScaleStart(String linkId, ScaleStartDetails details) {
    canvasWriter.model.hideAllTapLinkWidgets();
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);
    segmentIndex = canvasReader.model
        .determineLinkSegmentIndex(linkId, details.localFocalPoint);
    if (segmentIndex != null) {
      canvasWriter.model
          .insertLinkMiddlePoint(linkId, details.localFocalPoint, segmentIndex);
      canvasWriter.model.updateLink(linkId);
    }
  }

  @override
  onLinkScaleUpdate(String linkId, ScaleUpdateDetails details) {
    if (segmentIndex != null) {
      canvasWriter.model.setLinkMiddlePointPosition(
          linkId, details.localFocalPoint, segmentIndex);
      canvasWriter.model.updateLink(linkId);
    }
  }
}

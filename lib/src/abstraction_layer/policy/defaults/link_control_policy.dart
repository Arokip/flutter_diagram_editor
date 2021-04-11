import 'package:diagram_editor/src/abstraction_layer/policy/base/link_policy.dart';
import 'package:flutter/material.dart';

mixin LinkControlPolicy implements LinkPolicy {
  @override
  onLinkTapUp(String linkId, TapUpDetails details) {
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);
  }

  var segmentIndex;

  @override
  onLinkScaleStart(String linkId, ScaleStartDetails details) {
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

  @override
  onLinkLongPressStart(String linkId, LongPressStartDetails details) {
    canvasWriter.model.hideAllLinkJoints();
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
    if (segmentIndex != null) {
      canvasWriter.model.setLinkMiddlePointPosition(
          linkId, details.localPosition, segmentIndex);
      canvasWriter.model.updateLink(linkId);
    }
  }
}

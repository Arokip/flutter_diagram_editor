import 'package:diagram_editor/src/abstraction_layer/policy/base/link_policy.dart';
import 'package:flutter/material.dart';

/// Optimized implementation of [LinkPolicy].
///
/// Adding new joints and showing joints on link tap.
///
/// It uses [onLinkTapUp], [onLinkScaleStart], [onLinkScaleUpdate], [onLinkLongPressStart], [onLinkLongPressMoveUpdate].
/// Feel free to override other functions from [LinkPolicy] and add them to [PolicySet].
mixin LinkControlPolicy implements LinkPolicy {
  @override
  void onLinkTapUp(String linkId, TapUpDetails details) {
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);
  }

  int? _segmentIndex;

  @override
  void onLinkScaleStart(String linkId, ScaleStartDetails details) {
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);
    _segmentIndex = canvasReader.model
        .determineLinkSegmentIndex(linkId, details.localFocalPoint);
    if (_segmentIndex != null) {
      canvasWriter.model.insertLinkMiddlePoint(
          linkId, details.localFocalPoint, _segmentIndex!);
      canvasWriter.model.updateLink(linkId);
    }
  }

  @override
  void onLinkScaleUpdate(String linkId, ScaleUpdateDetails details) {
    if (_segmentIndex != null) {
      canvasWriter.model.setLinkMiddlePointPosition(
          linkId, details.localFocalPoint, _segmentIndex!);
      canvasWriter.model.updateLink(linkId);
    }
  }

  @override
  void onLinkLongPressStart(String linkId, LongPressStartDetails details) {
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);
    _segmentIndex = canvasReader.model
        .determineLinkSegmentIndex(linkId, details.localPosition);
    if (_segmentIndex != null) {
      canvasWriter.model
          .insertLinkMiddlePoint(linkId, details.localPosition, _segmentIndex!);
      canvasWriter.model.updateLink(linkId);
    }
  }

  @override
  void onLinkLongPressMoveUpdate(
      String linkId, LongPressMoveUpdateDetails details) {
    if (_segmentIndex != null) {
      canvasWriter.model.setLinkMiddlePointPosition(
          linkId, details.localPosition, _segmentIndex!);
      canvasWriter.model.updateLink(linkId);
    }
  }
}

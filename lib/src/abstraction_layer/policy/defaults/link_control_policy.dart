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
  onLinkTapUp(String linkId, TapUpDetails details) {
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);
  }

  int? _segmentIndex;

  @override
  onLinkScaleStart(String linkId, ScaleStartDetails details) {
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);
    _segmentIndex = canvasReader.model
        .determineLinkSegmentIndex(linkId, details.localFocalPoint);
    final _segIdx = _segmentIndex;
    if (_segIdx != null) {
      canvasWriter.model.insertLinkMiddlePoint(
        linkId,
        details.localFocalPoint,
        _segIdx,
      );
      canvasWriter.model.updateLink(linkId);
    }
  }

  @override
  onLinkScaleUpdate(String linkId, ScaleUpdateDetails details) {
    final _segIdx = _segmentIndex;
    if (_segIdx != null) {
      canvasWriter.model.setLinkMiddlePointPosition(
        linkId,
        details.localFocalPoint,
        _segIdx,
      );
      canvasWriter.model.updateLink(linkId);
    }
  }

  @override
  onLinkLongPressStart(String linkId, LongPressStartDetails details) {
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);
    _segmentIndex = canvasReader.model
        .determineLinkSegmentIndex(linkId, details.localPosition);
    final _segIdx = _segmentIndex;
    if (_segIdx != null) {
      canvasWriter.model
          .insertLinkMiddlePoint(linkId, details.localPosition, _segIdx);
      canvasWriter.model.updateLink(linkId);
    }
  }

  @override
  onLinkLongPressMoveUpdate(String linkId, LongPressMoveUpdateDetails details) {
    final _segIdx = _segmentIndex;
    if (_segIdx != null) {
      canvasWriter.model
          .setLinkMiddlePointPosition(linkId, details.localPosition, _segIdx);
      canvasWriter.model.updateLink(linkId);
    }
  }
}

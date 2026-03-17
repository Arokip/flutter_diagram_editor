import 'package:diagram_editor/src/controller/diagram_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Default pan and zoom behavior for the canvas.
///
/// Ported from the old `CanvasControlPolicy` and `CanvasMovePolicy` mixins.
extension DefaultCanvasBehaviors<C, L> on DiagramController<C, L> {
  /// Call on [GestureDetector.onScaleStart] for the canvas.
  void handleCanvasScaleStart(ScaleStartDetails details) {
    baseScale = canvasScale;
    basePosition = canvasPosition;
    lastFocalPoint = details.focalPoint;
  }

  /// Call on [GestureDetector.onScaleUpdate] for the canvas.
  void handleCanvasScaleUpdate(ScaleUpdateDetails details) {
    if (canUpdateCanvasModel) {
      animationController?.repeat();
      _updateCanvasModelWithLastValues();

      final previousScale = transformScale;

      transformPosition += details.focalPoint - lastFocalPoint;

      if (canvasConfig.enableZoom) {
        transformScale = keepScaleInBounds(details.scale, baseScale);
      }

      final focalPoint = details.localFocalPoint - transformPosition;
      final focalPointScaled = focalPoint * (transformScale / previousScale);

      lastFocalPoint = details.focalPoint;

      transformPosition += focalPoint - focalPointScaled;

      animationController?.reset();
    }
  }

  /// Call on [GestureDetector.onScaleEnd] for the canvas.
  void handleCanvasScaleEnd(ScaleEndDetails details) {
    if (canUpdateCanvasModel) {
      _updateCanvasModelWithLastValues();
    }

    animationController?.reset();

    transformPosition = Offset.zero;
    transformScale = 1;

    updateCanvas();
  }

  /// Call on [Listener.onPointerSignal] for the canvas (mouse wheel zoom).
  void handleCanvasPointerSignal(PointerSignalEvent event) {
    if (!canvasConfig.enableZoom) return;
    if (event is! PointerScrollEvent) return;

    final scaleChange =
        event.scrollDelta.dy < 0 ? (1 / mouseScrollSpeed) : mouseScrollSpeed;

    final boundedScale = keepScaleInBounds(scaleChange, canvasScale);
    if (boundedScale == 0) return;

    final previousScale = canvasScale;
    zoomCanvas(boundedScale);

    final focalPoint = event.localPosition - canvasPosition;
    final focalPointScaled = focalPoint * (canvasScale / previousScale);

    panCanvas(focalPoint - focalPointScaled);
    updateCanvas();
  }

  /// Clamps [scale] so that the result stays within min/max bounds.
  double keepScaleInBounds(double scale, double currentCanvasScale) {
    var result = scale;
    if (scale * currentCanvasScale <= minScale) {
      result = minScale / currentCanvasScale;
    }
    if (scale * currentCanvasScale >= maxScale) {
      result = maxScale / currentCanvasScale;
    }
    return result;
  }

  void _updateCanvasModelWithLastValues() {
    setCanvasPosition(basePosition * transformScale + transformPosition);
    canvasScale = transformScale * baseScale;
    canUpdateCanvasModel = false;
  }
}

/// Default link gesture behavior.
///
/// Ported from the old `LinkControlPolicy` mixin.
/// Provides joint creation on tap/drag and joint visibility toggling.
extension DefaultLinkBehaviors<C, L> on DiagramController<C, L> {
  /// Call on link tap up — shows joints.
  void handleLinkTapUp(String linkId, TapUpDetails details) {
    hideAllLinkJoints();
    showLinkJoints(linkId);
  }

  /// Call on link scale start — inserts a new joint at the tapped segment.
  int? handleLinkScaleStart(String linkId, ScaleStartDetails details) {
    hideAllLinkJoints();
    showLinkJoints(linkId);
    final segmentIndex =
        determineLinkSegmentIndex(linkId, details.localFocalPoint);
    if (segmentIndex != null) {
      insertLinkJoint(linkId, details.localFocalPoint, segmentIndex);
      updateLinkEndpoints(linkId);
    }
    return segmentIndex;
  }

  /// Call on link scale update — moves the joint being dragged.
  void handleLinkScaleUpdate(
    String linkId,
    ScaleUpdateDetails details,
    int? segmentIndex,
  ) {
    if (segmentIndex != null) {
      setLinkJointPosition(linkId, details.localFocalPoint, segmentIndex);
      updateLinkEndpoints(linkId);
    }
  }

  /// Call on link long press start — inserts a new joint.
  int? handleLinkLongPressStart(String linkId, LongPressStartDetails details) {
    hideAllLinkJoints();
    showLinkJoints(linkId);
    final segmentIndex =
        determineLinkSegmentIndex(linkId, details.localPosition);
    if (segmentIndex != null) {
      insertLinkJoint(linkId, details.localPosition, segmentIndex);
      updateLinkEndpoints(linkId);
    }
    return segmentIndex;
  }

  /// Call on link long press move update — moves the joint being dragged.
  void handleLinkLongPressMoveUpdate(
    String linkId,
    LongPressMoveUpdateDetails details,
    int? segmentIndex,
  ) {
    if (segmentIndex != null) {
      setLinkJointPosition(linkId, details.localPosition, segmentIndex);
      updateLinkEndpoints(linkId);
    }
  }
}

/// Default joint gesture behavior.
///
/// Ported from the old `LinkJointControlPolicy` mixin.
extension DefaultJointBehaviors<C, L> on DiagramController<C, L> {
  /// Call on joint long press — removes the joint.
  void handleJointLongPress(int jointIndex, String linkId) {
    removeLinkJoint(linkId, jointIndex);
    updateLinkEndpoints(linkId);
  }

  /// Call on joint scale update — moves the joint.
  void handleJointScaleUpdate(
    int jointIndex,
    String linkId,
    ScaleUpdateDetails details,
  ) {
    setLinkJointPosition(linkId, details.localFocalPoint, jointIndex);
    updateLinkEndpoints(linkId);
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/policy_set.dart';

mixin CanvasControlPolicy on PolicySet {
  AnimationController _animationController;
  double _baseScale = 1.0;
  Offset _basePosition = Offset(0, 0);

  Offset _lastFocalPoint = Offset(0, 0);

  Offset transformPosition = Offset(0, 0);
  double transformScale = 1.0;

  bool canUpdateCanvasModel = false;

  getAnimationController() {
    return _animationController;
  }

  setAnimationController(AnimationController animationController) {
    _animationController = animationController;
  }

  disposeAnimationController() {
    _animationController.dispose();
  }

  onCanvasScaleStart(ScaleStartDetails details) {
    _baseScale = canvasReader.state.scale;
    _basePosition = canvasReader.state.position;

    _lastFocalPoint = details.focalPoint;
  }

  onCanvasScaleUpdate(ScaleUpdateDetails details) {
    if (canUpdateCanvasModel) {
      _animationController.repeat();
      _updateCanvasModelWithLastValues();

      double previousScale = transformScale;

      transformPosition += details.focalPoint - _lastFocalPoint;
      transformScale = keepScaleInBounds(details.scale, _baseScale);

      var focalPoint = (details.localFocalPoint - transformPosition);
      var focalPointScaled = focalPoint * (transformScale / previousScale);

      _lastFocalPoint = details.focalPoint;

      transformPosition += focalPoint - focalPointScaled;

      _animationController.reset();
    }
  }

  onCanvasScaleEnd(ScaleEndDetails details) {
    if (canUpdateCanvasModel) {
      _updateCanvasModelWithLastValues();
    }

    _animationController.reset();

    transformPosition = Offset(0, 0);
    transformScale = 1.0;

    canvasWriter.state.updateCanvas();
  }

  _updateCanvasModelWithLastValues() {
    canvasWriter.state
        .setPosition((_basePosition * transformScale) + transformPosition);
    canvasWriter.state.setScale(transformScale * _baseScale);
    canUpdateCanvasModel = false;
  }

  onCanvasPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      print('wheeeeeeel');
      double scaleChange = event.scrollDelta.dy < 0
          ? (1 / canvasReader.state.mouseScaleSpeed)
          : (canvasReader.state.mouseScaleSpeed);

      scaleChange = keepScaleInBounds(scaleChange, canvasReader.state.scale);

      if (scaleChange == 0.0) {
        return;
      }

      double previousScale = canvasReader.state.scale;

      canvasWriter.state.updateScale(scaleChange);

      var focalPoint = (event.localPosition - canvasReader.state.position);
      var focalPointScaled =
          focalPoint * (canvasReader.state.scale / previousScale);

      canvasWriter.state.updatePosition(focalPoint - focalPointScaled);
      canvasWriter.state.updateCanvas();
    }
  }

  double keepScaleInBounds(double scale, double canvasScale) {
    double scaleResult = scale;
    if (scale * canvasScale <= canvasReader.state.minScale) {
      scaleResult = canvasReader.state.minScale / canvasScale;
    }
    if (scale * canvasScale >= canvasReader.state.maxScale) {
      scaleResult = canvasReader.state.maxScale / canvasScale;
    }
    return scaleResult;
  }
}

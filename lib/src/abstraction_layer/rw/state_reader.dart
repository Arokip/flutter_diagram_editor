import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:flutter/material.dart';

class CanvasStateReader {
  final CanvasState canvasState;

  /// Allows you to read state (position and scale) of the canvas.
  CanvasStateReader(this.canvasState);

  /// Position of the canvas. Coordinates where the (0, 0) of the canvas is currently located.
  ///
  /// Initial value equals to [Offset(0, 0)].
  Offset get position => canvasState.position;

  /// Scale od the canvas. It must be always positive.
  ///
  /// Initial value equals to 1.
  double get scale => canvasState.scale;

  /// Determine how fast the canvas is scale when user uses mouse's wheel.
  double get mouseScaleSpeed => canvasState.mouseScaleSpeed;

  /// Maximal scale of the canvas. User cannot zoom the canvas more than this value.
  double get maxScale => canvasState.maxScale;

  /// Minimal scale of the canvas. User cannot zoom the canvas less than this value.
  double get minScale => canvasState.minScale;

  /// A base color of the canvas.
  Color get color => canvasState.color;

  /// Calculates position from Canvas to use it in the model.
  ///
  /// Use when you have localPosition or localOffset from widget on canvas to get real (translated and scaled) coordinates on canvas.
  Offset fromCanvasCoordinates(Offset position) {
    return canvasState.fromCanvasCoordinates(position);
  }

  /// Calculates position from the model to use it on Canvas.
  ///
  /// Use when you want to set widget's position on scaled or translated canvas, eg. in Positioned widget (top, left).
  /// Usually in [ComponentWidgetsPolicy] or [LinkWidgetsPolicy].
  Offset toCanvasCoordinates(Offset position) {
    return canvasState.toCanvasCoordinates(position);
  }
}

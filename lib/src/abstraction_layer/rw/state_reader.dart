import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:flutter/material.dart';

class CanvasStateReader {
  final CanvasState canvasState;

  CanvasStateReader(this.canvasState);

  Offset get position => canvasState.position;

  double get scale => canvasState.scale;

  double get mouseScaleSpeed => canvasState.mouseScaleSpeed;

  double get maxScale => canvasState.maxScale;

  double get minScale => canvasState.minScale;

  Color get color => canvasState.color;

  /// Use when you have localPosition or localOffset from widget to get coordinates on canvas.
  Offset fromCanvasCoordinates(Offset position) {
    return canvasState.fromCanvasCoordinates(position);
  }

  /// Use when you want to set widget's position on zoomed or translated canvas, eg. in Positioned widget (top, left).
  Offset toCanvasCoordinates(Offset position) {
    return canvasState.toCanvasCoordinates(position);
  }
}

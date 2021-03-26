import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_state.dart';

class CanvasStateWriter {
  final CanvasState _canvasState;

  CanvasStateWriter(this._canvasState);

  updateCanvas() {
    _canvasState.updateCanvas();
  }

  setPosition(Offset position) {
    _canvasState.setPosition(position);
  }

  setScale(double scale) {
    _canvasState.setScale(scale);
  }

  updatePosition(Offset offset) {
    _canvasState.updatePosition(offset);
  }

  updateScale(double scale) {
    _canvasState.updateScale(scale);
  }

  resetCanvasView() {
    _canvasState.resetCanvasView();
  }
}

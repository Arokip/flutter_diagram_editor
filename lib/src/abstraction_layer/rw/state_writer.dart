import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:flutter/material.dart';

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

  setCanvasColor(Color color) {
    _canvasState.color = color;
  }

  setMaxScale(double scale) {
    _canvasState.maxScale = scale;
  }

  setMinScale(double scale) {
    _canvasState.minScale = scale;
  }
}

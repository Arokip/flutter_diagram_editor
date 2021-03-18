import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_misc.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_state.dart';

class CanvasWriter {
  final CanvasModelWriter model;
  final CanvasStateWriter state;
  final CanvasMiscWriter misc;

  CanvasWriter(this.model, this.state, this.misc);
}

class CanvasModelWriter {
  final CanvasModel canvasModel;

  CanvasModelWriter(this.canvasModel);

  moveComponent(String id, Offset offset) {
    canvasModel.components[id].move(offset);
  }
}

class CanvasStateWriter {
  final CanvasState canvasState;

  CanvasStateWriter(this.canvasState);

  moveCanvas(Offset offset) {
    canvasState.move(offset);
  }
}

class CanvasMiscWriter {
  final CanvasMisc canvasMisc;

  CanvasMiscWriter(this.canvasMisc);
}

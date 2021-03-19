import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/component_definition.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/component_data.dart';
import 'package:uuid/uuid.dart';

class CanvasWriter {
  final CanvasModelWriter model;
  final CanvasStateWriter state;
  final CanvasMiscWriter misc;

  CanvasWriter(this.model, this.state, this.misc);
}

class CanvasModelWriter {
  final CanvasModel _canvasModel;

  CanvasModelWriter(this._canvasModel);

  moveComponent(String id, Offset offset) {
    _canvasModel.moveComponent(id, offset);
  }

  addComponent(ComponentData componentData) {
    _canvasModel.addComponent(componentData);
  }
}

class CanvasStateWriter {
  final CanvasState _canvasState;

  CanvasStateWriter(this._canvasState);

  moveCanvas(Offset offset) {
    _canvasState.move(offset);
  }
}

class CanvasMiscWriter {
  final ComponentDefinition _canvasMisc;

  CanvasMiscWriter(this._canvasMisc);
}

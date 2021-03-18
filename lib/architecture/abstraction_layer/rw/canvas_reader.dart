import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_context.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_misc.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/component_data.dart';

class CanvasReader {
  final CanvasModelReader model;
  final CanvasStateReader state;
  final CanvasMiscReader misc;

  CanvasReader(this.model, this.state, this.misc);
}

class CanvasModelReader {
  final CanvasModel canvasModel;

  CanvasModelReader(this.canvasModel);

  ComponentData getComponent(String id) {
    return canvasModel.components[id];
  }
}

class CanvasStateReader {
  final CanvasState canvasState;

  CanvasStateReader(this.canvasState);

  getCanvasPosition() {
    return canvasState.position;
  }
}

class CanvasMiscReader {
  final CanvasMisc canvasMisc;

  CanvasMiscReader(this.canvasMisc);
}

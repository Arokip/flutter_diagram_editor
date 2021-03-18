import 'package:flutter_diagram_editor/architecture/abstraction_layer/rw/canvas_reader.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/rw/canvas_writer.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_misc.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_state.dart';

class CanvasContext {
  final CanvasReader canvasReader;
  final CanvasWriter canvasWriter;

  final CanvasModel canvasModel;
  final CanvasState canvasState;
  final CanvasMisc canvasMisc;

  CanvasContext({
    this.canvasModel,
    this.canvasState,
    this.canvasMisc,
  })  : canvasReader = CanvasReader(
          CanvasModelReader(canvasModel),
          CanvasStateReader(canvasState),
          CanvasMiscReader(canvasMisc),
        ),
        canvasWriter = CanvasWriter(
          CanvasModelWriter(canvasModel),
          CanvasStateWriter(canvasState),
          CanvasMiscWriter(canvasMisc),
        );
}

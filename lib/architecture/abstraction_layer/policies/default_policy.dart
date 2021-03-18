import 'package:flutter_diagram_editor/architecture/abstraction_layer/rw/canvas_reader.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/rw/canvas_writer.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_context.dart';

class DefaultPolicy {
  final CanvasReader canvasReader;
  final CanvasWriter canvasWriter;

  DefaultPolicy(CanvasContext canvasContext)
      : canvasReader = canvasContext.canvasReader,
        canvasWriter = canvasContext.canvasWriter;
}

import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/rw/reader/canvas_reader.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/rw/writer/canvas_writer.dart';

class PolicySet {
  CanvasReader canvasReader;
  CanvasWriter canvasWriter;

  initializePolicy(CanvasReader canvasReader, CanvasWriter canvasWriter) {
    this.canvasReader = canvasReader;
    this.canvasWriter = canvasWriter;
  }
}

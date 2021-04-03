import 'package:diagram_editor/src/abstraction_layer/rw/canvas_reader.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/canvas_writer.dart';

class BasePolicySet {
  CanvasReader canvasReader;
  CanvasWriter canvasWriter;

  initializePolicy(CanvasReader canvasReader, CanvasWriter canvasWriter) {
    this.canvasReader = canvasReader;
    this.canvasWriter = canvasWriter;
  }
}

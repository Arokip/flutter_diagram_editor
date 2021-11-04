import 'package:diagram_editor/src/abstraction_layer/rw/canvas_reader.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/canvas_writer.dart';

class BasePolicySet {
  /// Allows you to read all data from diagram/canvas model.
  late CanvasReader canvasReader;

  /// Allows you to change diagram/canvas model data.
  late CanvasWriter canvasWriter;

  /// Initialize policy in [DiagramEditorContext].
  initializePolicy(CanvasReader canvasReader, CanvasWriter canvasWriter) {
    this.canvasReader = canvasReader;
    this.canvasWriter = canvasWriter;
  }
}

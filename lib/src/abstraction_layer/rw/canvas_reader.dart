import 'package:diagram_editor/src/abstraction_layer/rw/model_reader.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/state_reader.dart';

/// Takes care of reading from model and state of the canvas.
class CanvasReader {
  /// Access to canvas model (components, links..).
  final CanvasModelReader model;

  /// Access to canvas state data (canvas scale, position..).
  final CanvasStateReader state;

  CanvasReader(this.model, this.state);
}

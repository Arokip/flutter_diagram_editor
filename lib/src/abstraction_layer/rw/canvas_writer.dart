import 'package:diagram_editor/src/abstraction_layer/rw/model_writer.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/state_writer.dart';

class CanvasWriter {
  final CanvasModelWriter model;
  final CanvasStateWriter state;

  CanvasWriter(this.model, this.state);
}

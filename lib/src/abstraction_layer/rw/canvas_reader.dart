import 'package:diagram_editor/src/abstraction_layer/rw/model_reader.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/state_reader.dart';

class CanvasReader {
  final CanvasModelReader model;
  final CanvasStateReader state;

  CanvasReader(this.model, this.state);
}

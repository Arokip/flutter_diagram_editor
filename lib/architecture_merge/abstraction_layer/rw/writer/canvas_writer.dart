import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/rw/writer/widgets_definition_writer.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/rw/writer/model_writer.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/rw/writer/state_writer.dart';

class CanvasWriter {
  final CanvasModelWriter model;
  final CanvasStateWriter state;
  final WidgetsDefinitionWriter widgetsDefinition;

  CanvasWriter(this.model, this.state, this.widgetsDefinition);
}

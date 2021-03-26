import 'package:flutter_diagram_editor/architecture/abstraction_layer/rw/canvas_reader.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/rw/canvas_writer.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/diagram_editor_context.dart';

class PolicySet {
  CanvasReader canvasReader;
  CanvasWriter canvasWriter;

  // DiagramEditorContext canvasContext;

  // PolicySet(this.canvasContext);
  PolicySet();

  initPolicy(DiagramEditorContext canvasContext) {
    canvasReader = canvasContext.getReader();
    canvasWriter = canvasContext.getWriter();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/diagram_editor_context.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/component_definition.dart';
import 'package:flutter_diagram_editor/architecture/widget/canvas.dart';
import 'package:provider/provider.dart';

class DiagramEditor extends StatelessWidget {
  final DiagramEditorContext canvasContext;
  final double width;
  final double height;
  final Color color;

  DiagramEditor({
    Key key,
    @required this.canvasContext,
    this.width = 0,
    this.height = 0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CanvasModel>.value(
          value: canvasContext.canvasModel,
        ),
        ChangeNotifierProvider<CanvasState>.value(
          value: canvasContext.canvasState,
        ),
        ChangeNotifierProvider<ComponentDefinition>.value(
          value: canvasContext.componentDefinition,
        ),
      ],
      builder: (context, child) {
        return DiagramEditorCanvas(
          width: width,
          height: height,
          color: color,
          policy: canvasContext.policySet,
        );
      },
    );
  }
}

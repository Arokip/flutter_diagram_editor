import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/diagram_editor_context.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/widgets_definition.dart';
import 'package:flutter_diagram_editor/architecture_merge/widget/canvas.dart';
import 'package:provider/provider.dart';

class DiagramEditor extends StatefulWidget {
  final DiagramEditorContext diagramEditorContext;

  DiagramEditor({
    Key key,
    @required this.diagramEditorContext,
  }) : super(key: key);

  @override
  _DiagramEditorState createState() => _DiagramEditorState();
}

class _DiagramEditorState extends State<DiagramEditor> {
  @override
  void initState() {
    print('init state');
    this.widget.diagramEditorContext.policySet.initializeDiagram();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CanvasModel>.value(
          value: widget.diagramEditorContext.canvasModel,
        ),
        ChangeNotifierProvider<CanvasState>.value(
          value: widget.diagramEditorContext.canvasState,
        ),
        ChangeNotifierProvider<WidgetsDefinition>.value(
          value: widget.diagramEditorContext.componentDefinition,
        ),
      ],
      builder: (context, child) {
        return DiagramEditorCanvas(
          policy: widget.diagramEditorContext.policySet,
        );
      },
    );
  }
}

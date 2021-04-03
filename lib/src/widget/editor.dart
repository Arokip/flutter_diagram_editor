import 'package:diagram_editor/src/canvas_context/canvas_model.dart';
import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:diagram_editor/src/canvas_context/diagram_editor_context.dart';
import 'package:diagram_editor/src/widget/canvas.dart';
import 'package:flutter/material.dart';
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
      ],
      builder: (context, child) {
        return DiagramEditorCanvas(
          policy: widget.diagramEditorContext.policySet,
        );
      },
    );
  }
}

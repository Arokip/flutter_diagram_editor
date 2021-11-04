import 'package:diagram_editor/src/canvas_context/canvas_model.dart';
import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:diagram_editor/src/canvas_context/diagram_editor_context.dart';
import 'package:diagram_editor/src/widget/canvas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiagramEditor extends StatefulWidget {
  final DiagramEditorContext diagramEditorContext;

  /// The main widget of [diagram_editor] library.
  ///
  /// In this widget all the editing of a diagram happens.
  ///
  /// How to use it: [diagram_editor](https://pub.dev/packages/diagram_editor).
  ///
  /// Source code: [github](https://github.com/Arokip/fdl).
  ///
  /// It takes [DiagramEditorContext] as required parameter.
  /// You should define its size in its parent widget, eg. Container.
  DiagramEditor({
    Key? key,
    required this.diagramEditorContext,
  }) : super(key: key);

  @override
  _DiagramEditorState createState() => _DiagramEditorState();
}

class _DiagramEditorState extends State<DiagramEditor> {
  @override
  void initState() {
    if (!widget.diagramEditorContext.canvasState.isInitialized) {
      this.widget.diagramEditorContext.policySet.initializeDiagramEditor();
      widget.diagramEditorContext.canvasState.isInitialized = true;
    }
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

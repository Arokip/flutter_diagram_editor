import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default_canvas_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default_component_policy.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_context.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_misc.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture/widget/canvas.dart';
import 'package:provider/provider.dart';

class DiagramEditor extends StatelessWidget {
  final CanvasContext canvasContext;
  final double width;
  final double height;
  final Color color;

  final DefaultCanvasPolicy _canvasPolicy;
  final DefaultComponentPolicy _componentPolicy;

  DiagramEditor({
    Key key,
    @required this.canvasContext,
    this.width = 0,
    this.height = 0,
    this.color,
    DefaultCanvasPolicy canvasPolicy,
    DefaultComponentPolicy componentPolicy,
  })  : this._canvasPolicy = (canvasPolicy == null)
            ? DefaultCanvasPolicy(canvasContext)
            : canvasPolicy,
        this._componentPolicy = (componentPolicy == null)
            ? DefaultComponentPolicy(canvasContext)
            : componentPolicy,
        super(key: key);

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
        ChangeNotifierProvider<CanvasMisc>.value(
          value: canvasContext.canvasMisc,
        ),
      ],
      builder: (context, child) {
        return DiagramEditorCanvas(
          width: width,
          height: height,
          color: color,
          canvasContext: canvasContext,
          canvasPolicy: _canvasPolicy,
          componentPolicy: _componentPolicy,
        );
      },
    );
  }
}

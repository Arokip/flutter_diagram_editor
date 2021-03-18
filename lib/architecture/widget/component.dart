import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default_component_policy.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/component_data.dart';
import 'package:provider/provider.dart';

class Component extends StatelessWidget {
  final DefaultComponentPolicy componentPolicy;

  const Component({
    Key key,
    this.componentPolicy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var componentData = Provider.of<ComponentData>(context);
    var canvasState = Provider.of<CanvasState>(context);

    return Positioned(
      left: componentData.position.dx + canvasState.position.dx,
      top: componentData.position.dy + canvasState.position.dy,
      child: GestureDetector(
        onTap: () {
          componentPolicy.onTap(componentData.id);
        },
        onTapDown: (TapDownDetails details) {
          componentPolicy.onTapDown(componentData.id, details);
        },
        onPanUpdate: (DragUpdateDetails details) {
          componentPolicy.onPanUpdate(componentData.id, details);
        },
        child: Container(
          color: Colors.red,
          child: Text('component', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

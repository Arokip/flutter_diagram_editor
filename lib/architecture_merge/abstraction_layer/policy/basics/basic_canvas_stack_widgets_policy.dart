import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_canvas_stack_widgets_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/component_data.dart';

mixin BasicCanvasStackWidgetsPolicy implements DefaultCanvasStackWidgetsPolicy {
  List<Widget> showCustomWidgetsOnCanvas() {
    return [
      Positioned(
        width: 40,
        height: 40,
        left: 80,
        top: 160,
        child: Container(
          color: Colors.red,
        ),
      ),
      ...canvasReader.model.getAllComponents().values.map((component) {
        return Positioned(
          width: 20,
          height: 20,
          left: canvasReader.state
              .toCanvasCoordinates(component.position)
              .dx,
          top: canvasReader.state
              .toCanvasCoordinates(component.position)
              .dy,
          child: Container(
            color: Colors.red,
          ),
        );
      }).toList(),
    ];
  }

  Widget showCustomWidgetOnCanvasWithComponentData(
      ComponentData componentData) {
    return Positioned(
      width: 20,
      height: 20,
      left: canvasReader.state
              .toCanvasCoordinates(componentData.position)
              .dx -
          50,
      top: canvasReader.state
              .toCanvasCoordinates(componentData.position)
              .dy -
          50,
      child: GestureDetector(
        onTap: () => canvasWriter.model.removeComponent(componentData.id),
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}

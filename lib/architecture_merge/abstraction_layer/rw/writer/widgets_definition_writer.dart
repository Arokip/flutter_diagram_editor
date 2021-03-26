import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/widgets_definition.dart';

class WidgetsDefinitionWriter {
  final WidgetsDefinition _widgetsDefinition;

  WidgetsDefinitionWriter(this._widgetsDefinition);

  addComponentBody(String bodyName, Widget body) {
    _widgetsDefinition.addComponentBody(bodyName, body);
  }
}

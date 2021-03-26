import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/component_data.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/link_data.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/widgets_definition.dart';

class CanvasReader {
  final CanvasModelReader model;
  final CanvasStateReader state;
  final WidgetsDefinitionReader widgetsDefinition;

  CanvasReader(this.model, this.state, this.widgetsDefinition);
}

class CanvasModelReader {
  final CanvasModel canvasModel;
  final CanvasState canvasState;

  CanvasModelReader(this.canvasModel, this.canvasState);

  ComponentData getComponent(String id) {
    return canvasModel.getComponent(id);
  }

  HashMap<String, ComponentData> getAllComponents() {
    return canvasModel.getAllComponents();
  }

  LinkData getLink(String id) {
    return canvasModel.getLink(id);
  }

  HashMap<String, LinkData> getAllLinks() {
    return canvasModel.getAllLinks();
  }

  int determineLinkSegmentIndex(
    String linkId,
    Offset tapPosition,
  ) {
    return canvasModel.links[linkId].determineLinkSegmentIndex(
        tapPosition, canvasState.position, canvasState.scale);
  }
}

class CanvasStateReader {
  final CanvasState canvasState;

  CanvasStateReader(this.canvasState);

  Offset get position => canvasState.position;

  double get scale => canvasState.scale;

  double get mouseScaleSpeed => canvasState.mouseScaleSpeed;

  double get maxScale => canvasState.maxScale;

  double get minScale => canvasState.minScale;

  Color get color => canvasState.color;

  Offset fromCanvasCoordinates(Offset position) {
    return canvasState.fromCanvasCoordinates(position);
  }

  Offset toCanvasCoordinates(Offset position) {
    return canvasState.toCanvasCoordinates(position);
  }
}

class WidgetsDefinitionReader {
  final WidgetsDefinition widgetsDefinition;

  WidgetsDefinitionReader(this.widgetsDefinition);

  Widget getComponentBody(String bodyName) {
    return widgetsDefinition.getComponentBody(bodyName);
  }
}

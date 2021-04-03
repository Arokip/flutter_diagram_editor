import 'dart:collection';

import 'package:diagram_editor/src/canvas_context/canvas_model.dart';
import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:diagram_editor/src/canvas_context/model/link_data.dart';
import 'package:flutter/material.dart';

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

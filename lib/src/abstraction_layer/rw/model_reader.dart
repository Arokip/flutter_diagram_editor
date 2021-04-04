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

  /// If a link is compound from more than one segments this returns an index of the link segment, which was tapped on. If there is no link segment on the tap location it returns null. It should take a localPosition from a link tap.
  int determineLinkSegmentIndex(
    String linkId,
    Offset tapPosition,
  ) {
    return canvasModel.links[linkId].determineLinkSegmentIndex(
        tapPosition, canvasState.position, canvasState.scale);
  }
}

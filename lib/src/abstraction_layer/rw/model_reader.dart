import 'dart:collection';
import 'dart:convert';

import 'package:diagram_editor/src/canvas_context/canvas_model.dart';
import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:diagram_editor/src/canvas_context/model/link_data.dart';
import 'package:flutter/material.dart';

class CanvasModelReader {
  final CanvasModel canvasModel;
  final CanvasState canvasState;

  /// Allows you to read data from the model (component and link data).
  CanvasModelReader(this.canvasModel, this.canvasState);

  /// Returns [true] if a component with provided [id] exists. Returns [false] otherwise.
  bool componentExist(String id) {
    return canvasModel.componentExists(id);
  }

  /// Returns a component with [id].
  ///
  /// If there is no component with [id] in the model, it returns null.
  ComponentData getComponent(String id) {
    assert(componentExist(id), 'model does not contain this component id: $id');
    return canvasModel.getComponent(id);
  }

  /// Returns all existing components in the model as a [HashMap].
  ///
  /// Key of the HashMap element is component's id.
  HashMap<String, ComponentData> getAllComponents() {
    return canvasModel.getAllComponents();
  }

  /// Returns [true] if a link with provided [id] exists. Returns [false] otherwise.
  bool linkExist(String id) {
    return canvasModel.linkExists(id);
  }

  /// Returns a link with [id].
  ///
  /// If there is no link with [id] in the model, it returns null.
  LinkData getLink(String id) {
    assert(linkExist(id), 'model does not contain this link id: $id');
    return canvasModel.getLink(id);
  }

  /// Returns all existing links in the model as a [HashMap].
  ///
  /// Key of the HashMap element is link's id.
  HashMap<String, LinkData> getAllLinks() {
    return canvasModel.getAllLinks();
  }

  /// If a link is compound from more than one segments this returns an index of the link segment, which was tapped on.
  ///
  /// Segments are indexed from 1.
  /// If there is no link segment on the tap location it returns null.
  /// It should take a localPosition from a onLinkTap or similar.
  int? determineLinkSegmentIndex(
    String linkId,
    Offset tapPosition,
  ) {
    return canvasModel.getLink(linkId).determineLinkSegmentIndex(
        tapPosition, canvasState.position, canvasState.scale);
  }

  /// Returns [String] that contains serialized diagram in JSON format.
  ///
  /// To serialize dynamic data of components/links [toJson] function must be defined.
  String serializeDiagram() {
    return jsonEncode(canvasModel.getDiagram());
  }
}

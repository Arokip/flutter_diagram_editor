import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/component_data.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/link_data.dart';
import 'package:flutter_diagram_editor/architecture_merge/utils/link_style.dart';

class ModelWriter {
  final CanvasModel _canvasModel;
  final CanvasState _canvasState;

  ModelWriter(this._canvasModel, this._canvasState);
}

class CanvasModelWriter extends ModelWriter
    with ComponentWriter, LinkWriter, ConnectionWriter {
  CanvasModelWriter(CanvasModel canvasModel, CanvasState canvasState)
      : super(canvasModel, canvasState);

  addComponent(ComponentData componentData) {
    _canvasModel.addComponent(componentData);
  }

  removeComponent(String componentId) {
    _canvasModel.removeComponent(componentId);
  }

  removeAllComponents() {
    _canvasModel.removeAllComponents();
  }

  addLink(LinkData linkData) {
    _canvasModel.addLink(linkData);
  }

  removeLink(String linkId) {
    _canvasModel.removeLink(linkId);
  }

  removeAllLinks() {
    _canvasModel.removeAllLinks();
  }
}

mixin ComponentWriter on ModelWriter {
  changeComponentPosition(String id, Offset offset) {
    _canvasModel.getComponent(id).move(offset);
    _canvasModel.updateLinks(id);
  }

  moveComponent(String id, Offset offset) {
    _canvasModel.getComponent(id).move(offset / _canvasState.scale);
    _canvasModel.updateLinks(id);
  }

  updateComponentLinks(String componentId) {
    _canvasModel.updateLinks(componentId);
  }

  showComponentHighlight(String componentId) {
    _canvasModel.components[componentId].showHighlight();
  }

  hideComponentHighlight(String componentId) {
    _canvasModel.components[componentId].hideHighlight();
  }

  hideAllComponentHighlights() {
    _canvasModel.components.values.forEach((component) {
      component.hideHighlight();
    });
  }

  moveComponentToTheFront(String componentId) {
    _canvasModel.moveComponentToTheFront(componentId);
  }

  moveComponentToTheBack(String componentId) {
    _canvasModel.moveComponentToTheBack(componentId);
  }
}

mixin LinkWriter on ModelWriter {
  showLinkJoints(String linkId) {
    _canvasModel.links[linkId].showJoints();
  }

  hideLinkJoints(String linkId) {
    _canvasModel.links[linkId].hideJoints();
  }

  hideAllLinkJoints() {
    _canvasModel.links.values.forEach((link) {
      link.hideJoints();
    });
  }

  showDeleteIconOnPosition(String linkId, Offset position) {
    _canvasModel.links[linkId].showDeleteIcon();
    _canvasModel.links[linkId].setDeleteIconPosition(position);
  }

  hideDeleteIcon(String linkId) {
    _canvasModel.links[linkId].hideDeleteIcon();
  }

  hideAllDeleteIcons() {
    _canvasModel.links.values.forEach((link) {
      link.hideDeleteIcon();
    });
  }

  updateLink(String linkId) {
    _canvasModel.updateLinks(_canvasModel.links[linkId].sourceComponentId);
    _canvasModel.updateLinks(_canvasModel.links[linkId].targetComponentId);
  }

  insertLinkMiddlePoint(String linkId, Offset point, int index) {
    _canvasModel.links[linkId].insertMiddlePoint(
        (point - _canvasState.position) / _canvasState.scale, index);
  }

  setLinkMiddlePointPosition(String linkId, Offset point, int index) {
    _canvasModel.links[linkId].setMiddlePointPosition(
        (point - _canvasState.position) / _canvasState.scale, index);
  }

  moveLinkMiddlePoint(String linkId, Offset offset, int index) {
    _canvasModel.links[linkId].moveMiddlePoint(offset, index);
  }

  removeLinkMiddlePoint(String linkId, int index) {
    _canvasModel.links[linkId].removeMiddlePoint(index);
  }

  moveAllLinkMiddlePoints(String linkId, Offset position) {
    _canvasModel.links[linkId].moveAllMiddlePoints(position);
  }
}

mixin ConnectionWriter on ModelWriter {
  connectTwoComponents({
    String sourceComponentId,
    String targetComponentId,
    LinkStyle linkStyle = const LinkStyle(),
  }) {
    _canvasModel.connectTwoComponents(
      sourceComponentId,
      targetComponentId,
      linkStyle,
    );
  }
}

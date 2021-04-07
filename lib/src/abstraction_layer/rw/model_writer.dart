import 'package:diagram_editor/src/canvas_context/canvas_model.dart';
import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:diagram_editor/src/utils/link_style.dart';
import 'package:flutter/material.dart';

class ModelWriter {
  final CanvasModel _canvasModel;
  final CanvasState _canvasState;

  ModelWriter(this._canvasModel, this._canvasState);
}

class CanvasModelWriter extends ModelWriter
    with ComponentWriter, LinkWriter, ConnectionWriter {
  CanvasModelWriter(CanvasModel canvasModel, CanvasState canvasState)
      : super(canvasModel, canvasState);

  String addComponent(ComponentData componentData) {
    return _canvasModel.addComponent(componentData);
  }

  removeComponent(String componentId) {
    removeComponentParent(componentId);
    _canvasModel.removeComponent(componentId);
  }

  removeComponentWithChildren(String componentId) {
    List<String> componentsToRemove = [];
    _removeComponentWithChildren(componentId, componentsToRemove);
    componentsToRemove.reversed.forEach(removeComponent);
  }

  _removeComponentWithChildren(String componentId, List<String> toRemove) {
    toRemove.add(componentId);
    _canvasModel.getComponent(componentId).childrenIds.forEach((childId) {
      _removeComponentWithChildren(childId, toRemove);
    });
  }

  removeAllComponents() {
    _canvasModel.removeAllComponents();
  }

  removeLink(String linkId) {
    _canvasModel.removeLink(linkId);
  }

  removeAllLinks() {
    _canvasModel.removeAllLinks();
  }
}

mixin ComponentWriter on ModelWriter {
  updateComponent(String id) {
    _canvasModel.getComponent(id).updateComponent();
  }

  setComponentPosition(String id, Offset offset) {
    _canvasModel.getComponent(id).setPosition(offset);
    _canvasModel.updateLinks(id);
  }

  moveComponent(String id, Offset offset) {
    _canvasModel.getComponent(id).move(offset / _canvasState.scale);
    _canvasModel.updateLinks(id);
  }

  moveComponentWithChildren(String componentId, Offset offset) {
    moveComponent(componentId, offset);
    _canvasModel.getComponent(componentId).childrenIds.forEach((childId) {
      moveComponentWithChildren(childId, offset);
    });
  }

  removeComponentConnections(String componentId) {
    _canvasModel.removeComponentConnections(componentId);
  }

  updateComponentLinks(String componentId) {
    _canvasModel.updateLinks(componentId);
  }

  setComponentZOrder(String componentId, int zOrder) {
    _canvasModel.setComponentZOrder(componentId, zOrder);
  }

  int moveComponentToTheFront(String componentId) {
    return _canvasModel.moveComponentToTheFront(componentId);
  }

  moveComponentToTheFrontWithChildren(String componentId) {
    int zOrder = moveComponentToTheFront(componentId);
    _setZOrderToChildren(componentId, zOrder);
  }

  _setZOrderToChildren(String componentId, int zOrder) {
    setComponentZOrder(componentId, zOrder);
    _canvasModel.getComponent(componentId).childrenIds.forEach((childId) {
      _setZOrderToChildren(childId, zOrder + 1);
    });
  }

  int moveComponentToTheBack(String componentId) {
    return _canvasModel.moveComponentToTheBack(componentId);
  }

  resizeComponent(String componentId, Offset deltaSize) {
    _canvasModel.getComponent(componentId).resizeDelta(deltaSize);
  }

  setComponentSize(String componentId, Size size) {
    _canvasModel.getComponent(componentId).setSize(size);
  }

  setComponentParent(String componentId, String parentId) {
    _canvasModel.getComponent(componentId).setParent(parentId);
    _canvasModel.getComponent(parentId).addChild(componentId);
  }

  removeComponentParent(String componentId) {
    String parentId = _canvasModel.getComponent(componentId).parentId;
    if (parentId != null) {
      _canvasModel.getComponent(componentId).removeParent();
      _canvasModel.getComponent(parentId).removeChild(componentId);
    }
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

  hideLinkDeleteIcon(String linkId) {
    _canvasModel.links[linkId].hideLinkDeleteIcon();
  }

  hideAllLinkDeleteIcons() {
    _canvasModel.links.values.forEach((link) {
      link.hideLinkDeleteIcon();
    });
  }

  updateLink(String linkId) {
    _canvasModel.updateLinks(_canvasModel.links[linkId].sourceComponentId);
    _canvasModel.updateLinks(_canvasModel.links[linkId].targetComponentId);
  }

  insertLinkMiddlePoint(String linkId, Offset point, int index) {
    _canvasModel.links[linkId]
        .insertMiddlePoint(_canvasState.fromCanvasCoordinates(point), index);
  }

  setLinkMiddlePointPosition(String linkId, Offset point, int index) {
    _canvasModel.links[linkId].setMiddlePointPosition(
        _canvasState.fromCanvasCoordinates(point), index);
  }

  moveLinkMiddlePoint(String linkId, Offset offset, int index) {
    _canvasModel.links[linkId]
        .moveMiddlePoint(offset / _canvasState.scale, index);
  }

  removeLinkMiddlePoint(String linkId, int index) {
    _canvasModel.links[linkId].removeMiddlePoint(index);
  }

  moveAllLinkMiddlePoints(String linkId, Offset position) {
    _canvasModel.links[linkId]
        .moveAllMiddlePoints(position / _canvasState.scale);
  }
}

mixin ConnectionWriter on ModelWriter {
  String connectTwoComponents({
    String sourceComponentId,
    String targetComponentId,
    LinkStyle linkStyle,
    dynamic data,
  }) {
    return _canvasModel.connectTwoComponents(
      sourceComponentId,
      targetComponentId,
      linkStyle,
      data,
    );
  }
}

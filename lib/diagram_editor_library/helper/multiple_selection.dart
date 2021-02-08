import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';

class MultipleSelection {
  final CanvasModel model;

  MultipleSelection(this.model);

  bool isOn = false;
  List<String> selectedComponents = [];

  switchOnOff() {
    isOn = !isOn;
    model.selectDeselectItem();
    selectedComponents = [];
    model.notifyCanvasModelListeners();
  }

  addComponent(String componentId) {
    if (!selectedComponents.contains(componentId)) {
      selectedComponents.add(componentId);
      model.notifyCanvasModelListeners();
    }
  }

  addOrRemoveComponent(String componentId) {
    bool shouldAdd = !selectedComponents.remove(componentId);
    if (shouldAdd) {
      selectedComponents.add(componentId);
    }
    model.notifyCanvasModelListeners();
  }

  turnOff() {
    isOn = false;
    selectedComponents = [];
  }

  clearSelected() {
    turnOff();
    model.notifyCanvasModelListeners();
  }

  moveComponents(Offset position) {
    model.linkDataMap.values.forEach((link) {
      if (selectedComponents.contains(link.componentOutId) &&
          selectedComponents.contains(link.componentInId)) {
        link.updateAllMiddlePoints(position);
      }
    });
    selectedComponents.forEach((componentId) {
      model.componentDataMap[componentId].updatePosition(position);
      model.updateLinkMap(componentId);
    });
  }

  removeComponents() {
    assert(isOn);
    selectedComponents.forEach((componentId) {
      model.removeComponent(componentId);
    });
    clearSelected();
  }

  removeConnections() {
    assert(isOn);
    selectedComponents.forEach((componentId) {
      model.removeComponentConnections(componentId);
    });
  }

  duplicateComponents() {
    assert(isOn);
    double mostTop = double.infinity;
    double mostBottom = double.negativeInfinity;
    selectedComponents.forEach((componentId) {
      if (mostTop > model.componentDataMap[componentId].position.dy) {
        mostTop = model.componentDataMap[componentId].position.dy;
      }
      if (mostBottom <
          model.componentDataMap[componentId].position.dy +
              model.componentDataMap[componentId].size.height) {
        mostBottom = model.componentDataMap[componentId].position.dy +
            model.componentDataMap[componentId].size.height;
      }
    });
    selectedComponents.forEach((componentId) {
      model.duplicateComponent(
          componentId, Offset(0, mostBottom - mostTop + 24));
    });
  }

  selectAllComponents() {
    assert(isOn);
    model.componentDataMap.keys.forEach((componentId) {
      addComponent(componentId);
    });
  }
}

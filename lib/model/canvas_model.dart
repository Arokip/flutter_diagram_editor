import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/component_body.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/deselect_item.dart';
import 'package:flutter_provider_canvas/model/link_data.dart';
import 'package:flutter_provider_canvas/model/menu_data.dart';
import 'package:flutter_provider_canvas/model/port_connection.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';
import 'package:flutter_provider_canvas/model/port_rules.dart';
import 'package:uuid/uuid.dart';

class CanvasModel extends ChangeNotifier {
  var _uuid = Uuid();

  Offset _position = Offset(0, 0);
  double _scale = 1.0;

  HashMap<String, ComponentBody> _componentBodyMap =
      HashMap<String, ComponentBody>();

  HashMap<String, ComponentData> _componentDataMap =
      HashMap<String, ComponentData>();
  HashMap<String, LinkData> _linkDataMap = HashMap<String, LinkData>();
  MenuData menuData = MenuData();

  dynamic selectedItem;
  final DeselectItem deselectItem = DeselectItem();

  Color selectedPortColor = Colors.cyanAccent;
  Color otherPortsColor = Colors.teal;
  Color componentHighLightColor = Colors.red;

  final PortRules portRules = PortRules();

  bool isMultipleSelectionOn = false;
  List<String> selectedComponents = [];

  // ==== getters ====

  Offset get position => _position;

  double get scale => _scale;

  HashMap<String, ComponentBody> get componentBodyMap => _componentBodyMap;

  HashMap<String, ComponentData> get componentDataMap => _componentDataMap;

  HashMap<String, LinkData> get linkDataMap => _linkDataMap;

  // ==== initializer ====

  addNewComponentBody(String name, ComponentBody body) {
    assert(body != null);
    _componentBodyMap[name] = body;
  }

  // ==== NOTIFIERS ====

  addComponentToMap(ComponentData componentData) {
    print('add component to map: ${componentData.toString()}');
    _componentDataMap[componentData.id] = componentData;
    notifyListeners();
  }

  removeComponentFromList(String id) {
    removeComponentConnections(id);

    _componentDataMap.remove(id);
    selectDeselectItem();
    notifyListeners();
  }

  duplicateComponent(String id, Offset offset) {
    addComponentToMap(_componentDataMap[id].duplicate(offset));
  }

  duplicateComponentBelow(String id, Offset offset) {
    addComponentToMap(_componentDataMap[id]
        .duplicate(offset + Offset(0, _componentDataMap[id].size.height)));
  }

  removeComponentConnections(String id) {
    List<LinkData> linksToRemove = [];

    _componentDataMap[id].ports.values.forEach((port) {
      port.connections.forEach((connection) {
        linksToRemove.add(_linkDataMap[connection.connectionId]);
      });
    });

    linksToRemove.forEach(removeLink);
    notifyListeners();
  }

  resetCanvasView() {
    _position = Offset(0, 0);
    _scale = 1.0;
    notifyListeners();
  }

  updateCanvasPosition(Offset position) {
    _position += position;
  }

  updateCanvasScale(double scale) {
    _scale *= scale;
  }

  setCanvasData(Offset position, double scale) {
    _scale = scale;
    _position = position;
  }

  notifyCanvasModelListeners() {
    notifyListeners();
  }

  resizeComponent(String id) {
    _componentDataMap[id].switchEnableResize();
    selectDeselectItem();
    notifyListeners();
  }

  selectItem(dynamic item) {
    print('select item: $item');
    if (selectedItem == item) return;

    if (item == null) return;

    if (item is ComponentData) {
    } else if (item is PortData) {
      if (selectedItem is PortData) {
        bool connected = tryToConnectTwoPorts(selectedItem, item);
        if (connected) {
          return;
        }
      }
    } else if (item is LinkData) {
    } else if (item is DeselectItem) {
    } else {
      throw ArgumentError("selected item is unknown type: $item");
    }

    selectedItem = item;

    turnOffMultipleSelection();
    notifyListeners();
  }

  selectDeselectItem() {
    selectedItem = deselectItem;
  }

  deselectIfLinkSelected() {
    if (selectedItem is LinkData) {
      selectedItem.linkNotifyListeners();
      selectDeselectItem();
    }
  }

  bool tryToConnectTwoPorts(PortData firstPort, PortData secondPort) {
    if (canConnectTwoPorts(firstPort, secondPort)) {
      connectTwoPorts(firstPort, secondPort);
      selectDeselectItem();
      notifyListeners();
      return true;
    }
    return false;
  }

  bool canConnectTwoPorts(PortData firstPort, PortData secondPort) {
    if (!portRules.canConnect(firstPort.portType, secondPort.portType)) {
      return false;
    }
    if (arePortsConnected(firstPort, secondPort)) {
      return false;
    }
    if (!(hasLessThanMaxConnections(firstPort) &&
        hasLessThanMaxConnections(secondPort))) {
      return false;
    }
    if (!canConnectIfSameComponent(
        firstPort, secondPort, portRules.canConnectSameComponent)) {
      return false;
    }

    return true;
  }

  bool arePortsConnected(PortData firstPort, PortData secondPort) {
    int index = firstPort.connections.indexWhere((connection) =>
        connection.componentId == secondPort.componentId &&
        connection.portId == secondPort.id);
    return index >= 0;
  }

  bool hasLessThanMaxConnections(PortData port) {
    int max = portRules.getMaxConnectionCount(port.portType);
    if (max == null) {
      return true;
    } else {
      return port.connections.length < max;
    }
  }

  bool canConnectIfSameComponent(
      PortData firstPort, PortData secondPort, bool canConnectSame) {
    if (canConnectSame) {
      return true;
    } else {
      if (firstPort.componentId != secondPort.componentId) {
        return true;
      } else {
        return false;
      }
    }
  }

  connectTwoPorts(PortData portOut, PortData portIn) {
    print('connect two ports');
    var linkId = _uuid.v4();
    portOut.addConnection(
      PortConnectionOut(
        linkId: linkId,
        componentId: portIn.componentId,
        portId: portIn.id,
      ),
    );
    portIn.addConnection(
      PortConnectionIn(
        linkId: linkId,
        componentId: portOut.componentId,
        portId: portOut.id,
      ),
    );

    _linkDataMap[linkId] = LinkData(
      id: linkId,
      componentOutId: portOut.componentId,
      componentInId: portIn.componentId,
      color: Colors.black,
      width: 1.5,
      linkPoints: [
        componentDataMap[portOut.componentId].getPortCenterPoint(portOut.id),
        componentDataMap[portIn.componentId].getPortCenterPoint(portIn.id),
      ],
    );
  }

  removeLink(LinkData linkData) {
    linkDataMap.remove(linkData.id);
    componentDataMap[linkData.componentOutId].removeConnection(linkData.id);
    componentDataMap[linkData.componentInId].removeConnection(linkData.id);
    selectDeselectItem();
    notifyListeners();
  }

  void updateLinkMap(String componentId) {
    componentDataMap[componentId].ports.values.forEach((port) {
      port.connections.forEach((connection) {
        if (connection is PortConnectionOut) {
          linkDataMap[connection.connectionId].setStart(
              componentDataMap[componentId].getPortCenterPoint(port.id));
        } else if (connection is PortConnectionIn) {
          linkDataMap[connection.connectionId].setEnd(
              componentDataMap[componentId].getPortCenterPoint(port.id));
        } else {
          throw ArgumentError('Invalid port connection.');
        }
      });
    });
  }

  // ==== multiple selection ====

  switchMultipleSelection() {
    isMultipleSelectionOn = !isMultipleSelectionOn;
    selectDeselectItem();
    notifyListeners();
  }

  addToMultipleSelection(String componentId) {
    if (!selectedComponents.contains(componentId)) {
      selectedComponents.add(componentId);
      notifyListeners();
    }
  }

  addOrRemoveToMultipleSelection(String componentId) {
    if (!selectedComponents.remove(componentId)) {
      selectedComponents.add(componentId);
    }
    notifyListeners();
  }

  turnOffMultipleSelection() {
    isMultipleSelectionOn = false;
    selectedComponents = [];
  }

  clearMultipleSelectedComponents() {
    turnOffMultipleSelection();
    notifyListeners();
  }

  moveSelectedComponents(Offset position) {
    linkDataMap.values.forEach((value) {
      if (selectedComponents.contains(value.componentOutId) &&
          selectedComponents.contains(value.componentInId)) {
        value.updateAllMiddlePoints(position);
      }
    });
    selectedComponents.forEach((componentId) {
      componentDataMap[componentId].updateComponentDataPosition(position);
      updateLinkMap(componentId);
    });
  }

  removeSelectedComponents() {
    assert(isMultipleSelectionOn);
    selectedComponents.forEach((componentId) {
      removeComponentFromList(componentId);
    });
    clearMultipleSelectedComponents();
  }

  removeSelectedConnections() {
    assert(isMultipleSelectionOn);
    selectedComponents.forEach((componentId) {
      removeComponentConnections(componentId);
    });
  }

  duplicateSelectedComponents() {
    assert(isMultipleSelectionOn);
    double mostTop = double.infinity;
    double mostBottom = double.negativeInfinity;
    selectedComponents.forEach((componentId) {
      if (mostTop > _componentDataMap[componentId].position.dy) {
        mostTop = _componentDataMap[componentId].position.dy;
      }
      if (mostBottom <
          _componentDataMap[componentId].position.dy +
              _componentDataMap[componentId].size.height) {
        mostBottom = _componentDataMap[componentId].position.dy +
            _componentDataMap[componentId].size.height;
      }
    });
    selectedComponents.forEach((componentId) {
      duplicateComponent(componentId, Offset(0, mostBottom - mostTop + 24));
    });
  }

  selectAllComponents() {
    assert(isMultipleSelectionOn);
    _componentDataMap.keys.forEach((componentId) {
      addToMultipleSelection(componentId);
    });
  }

  // ==== functions all ====

  removeAllComponents() {
    clearMultipleSelectedComponents();
    var componentsToRemove = componentDataMap.keys.toList();
    componentsToRemove.forEach(removeComponentFromList);
  }

  removeAllConnections() {
    componentDataMap.values.forEach((component) {
      removeComponentConnections(component.id);
    });
  }
}

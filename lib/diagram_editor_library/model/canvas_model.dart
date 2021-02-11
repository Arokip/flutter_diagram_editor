import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/helper/canvas_screenshot.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/helper/multiple_selection.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_body.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_option_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/deselect_item.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/link_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/menu_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_connection.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_rules.dart';
import 'package:uuid/uuid.dart';

class CanvasModel extends ChangeNotifier {
  var _uuid = Uuid();
  GlobalKey canvasGlobalKey = GlobalKey();
  bool isTakingImage = false;

  MultipleSelection multipleSelection;

  CanvasModel() {
    multipleSelection = MultipleSelection(this);
  }

  Offset _position = Offset(0, 0);
  double _scale = 1.0;

  double mouseScaleSpeed = 0.8;

  double maxScale = 8.0;
  double minScale = 0.1;

  HashMap<String, ComponentBody> _componentBodyMap =
      HashMap<String, ComponentBody>();

  HashMap<String, ComponentOptionData> _componentOptionMap =
      HashMap<String, ComponentOptionData>();

  MenuData menuData = MenuData();

  final PortRules portRules = PortRules();

  HashMap<String, ComponentData> _componentDataMap =
      HashMap<String, ComponentData>();
  HashMap<String, LinkData> _linkDataMap = HashMap<String, LinkData>();

  dynamic selectedItem;
  final DeselectItem deselectItem = DeselectItem();

  Color canvasColor = Colors.white;

  Color selectedPortColor = Colors.cyanAccent;
  Color otherPortsColor = Colors.teal;
  Color componentHighLightColor = Colors.red;

  // ==== getters ====

  Offset get position => _position;

  double get scale => _scale;

  HashMap<String, ComponentBody> get componentBodyMap => _componentBodyMap;

  HashMap<String, ComponentOptionData> get componentOptionMap =>
      _componentOptionMap;

  HashMap<String, ComponentData> get componentDataMap => _componentDataMap;

  HashMap<String, LinkData> get linkDataMap => _linkDataMap;

  notifyCanvasModelListeners() {
    notifyListeners();
  }

  // ==== initializer ====

  addNewComponentBody(String name, ComponentBody body) {
    assert(body != null);
    _componentBodyMap[name] = body;
  }

  addNewComponentOption(String name, ComponentOptionData option) {
    assert(option != null);
    _componentOptionMap[name] = option;
  }

  // ==== CANVAS DATA ====

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

  double keepScaleInBounds(double scale, double canvasScale) {
    double scaleResult = scale;
    if (scale * canvasScale <= minScale) {
      scaleResult = minScale / canvasScale;
    }
    if (scale * canvasScale >= maxScale) {
      scaleResult = maxScale / canvasScale;
    }
    return scaleResult;
  }

  // ==== COMPONENT DATA ====

  ComponentData getComponentData(String id) {
    return componentDataMap[id];
  }

  addComponent(ComponentData componentData) {
    _componentDataMap[componentData.id] = componentData;
    notifyListeners();
  }

  removeComponent(String id) {
    multipleSelection.clearSelected();
    removeComponentConnections(id);

    _componentDataMap.remove(id);
    selectDeselectItem();
    notifyListeners();
  }

  // ==== COMPONENT FUNCTIONS ====

  duplicateComponent(String id, Offset offset) {
    assert(_componentDataMap.keys.contains(id));
    addComponent(_componentDataMap[id].duplicate(offset));
  }

  duplicateComponentBelow(String id, Offset offset) {
    assert(_componentDataMap.keys.contains(id));
    addComponent(_componentDataMap[id]
        .duplicate(offset + Offset(0, _componentDataMap[id].size.height)));
  }

  duplicateComponentNextTo(String id, Offset offset) {
    assert(_componentDataMap.keys.contains(id));
    addComponent(_componentDataMap[id]
        .duplicate(offset + Offset(_componentDataMap[id].size.width, 0)));
  }

  removeComponentConnections(String id) {
    assert(_componentDataMap.keys.contains(id));
    List<LinkData> linksToRemove = [];

    _componentDataMap[id].ports.values.forEach((port) {
      port.connections.forEach((connection) {
        linksToRemove.add(_linkDataMap[connection.connectionId]);
      });
    });

    linksToRemove.forEach(removeLink);
    notifyListeners();
  }

  resizeComponent(String id) {
    assert(_componentDataMap.keys.contains(id));
    _componentDataMap[id].switchEnableResize();
    selectDeselectItem();
    notifyListeners();
  }

  // ==== ALL COMPONENTS FUNCTIONS ====

  removeAllComponents() {
    multipleSelection.clearSelected();
    var componentsToRemove = componentDataMap.keys.toList();
    componentsToRemove.forEach(removeComponent);
  }

  removeAllConnections() {
    componentDataMap.values.forEach((component) {
      removeComponentConnections(component.id);
    });
  }

  replaceDiagram(HashMap<String, ComponentData> newComponentDataMap,
      HashMap<String, LinkData> newLinkDataMap) {
    _componentDataMap = newComponentDataMap;
    _linkDataMap = newLinkDataMap;
  }

  // ==== SELECT ====

  selectItem(dynamic item) {
    if (item == null) return;

    if (multipleSelection.isOn) {
      if (item is ComponentData) {
        multipleSelection.addOrRemoveComponent(item.id);
      } else if (item is PortData) {
        multipleSelection.addOrRemoveComponent(item.componentId);
      }
      return;
    }

    if (selectedItem == item) return;

    if (item is PortData) {
      if (selectedItem is PortData) {
        bool connected = tryToConnectTwoPorts(selectedItem, item);
        if (connected) {
          return;
        }
      }
    }

    selectedItem = item;

    notifyListeners();
  }

  selectDeselectItem() {
    selectedItem = deselectItem;
  }

  // ==== CONNECT PORTS ====

  bool tryToConnectTwoPorts(PortData firstPort, PortData secondPort) {
    if (portRules.canConnectTwoPorts(firstPort, secondPort)) {
      connectTwoPorts(firstPort, secondPort);
      selectDeselectItem();
      notifyListeners();
      return true;
    }
    return false;
  }

  connectTwoPorts(PortData portOut, PortData portIn) {
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

  // ==== LINKS ====

  removeLink(LinkData linkData) {
    linkDataMap.remove(linkData.id);
    componentDataMap[linkData.componentOutId].removeConnection(linkData.id);
    componentDataMap[linkData.componentInId].removeConnection(linkData.id);
    selectDeselectItem();
    notifyListeners();
  }

  updateLinkMap(String componentId) {
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

// ==== SCREENSHOT ====

  saveDiagramAsImage(File file, [double scale = 1.0, double edge = 0]) async {
    CanvasScreenshot canvasScreenshot = CanvasScreenshot(this);
    canvasScreenshot.saveDiagramAsImage(file, scale, edge);
  }
}

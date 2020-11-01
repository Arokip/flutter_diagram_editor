import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/port_connection.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';

import 'item_selected.dart';
import 'link_data.dart';

int componentCount = 100;
int linkCount = 100;
int portPerComponentCount = 4;

class CanvasModel extends ChangeNotifier {
  int _componentIdGen = 0;
  int _linkIdGen = 0;

  Offset _position = Offset(0, 0);
  double _scale = 1.0;

  HashMap<int, ComponentData> _componentDataMap;
  HashMap<int, LinkData> _linkDataMap;

  final double _portSize = 12;

  dynamic selectedItem;
  final DeselectItem deselectItem = DeselectItem();

  CanvasModel() {
    // _componentDataMap = generateComponents(componentCount);
    _componentDataMap = generateRandomComponents(componentCount);

    _linkDataMap = generateRandomLinks(linkCount);
    // _linkDataMap[-1] =
    //     LinkData(start: Offset(0, 0), end: Offset(200, 100), width: 5);
  }

  Offset get position => _position;

  double get scale => _scale;

  HashMap<int, ComponentData> get componentDataMap => _componentDataMap;

  HashMap<int, LinkData> get linkDataMap => _linkDataMap;

  // ==== NOTIFIERS ====

  addComponentToList(ComponentData componentData) {
    _componentDataMap[componentData.id] = componentData;
    notifyListeners();
  }

  resetCanvasView() {
    _position = Offset(0, 0);
    _scale = 1.0;
    notifyListeners();
  }

  updateCanvasPosition(Offset position) {
    _position += position;
    // notifyListeners();
  }

  updateCanvasScale(double scale) {
    _scale *= scale;
    // notifyListeners();
  }

  setCanvasData(Offset position, double scale) {
    _scale = scale;
    _position = position; //+=
    // notifyListeners();
  }

  notifyCanvasModelListeners() {
    notifyListeners();
  }

  selectItem(dynamic item) {
    if (selectedItem == item) return;

    if (selectedItem != null) {
      selectedItem.isItemSelected = false;
    }
    selectedItem = item;
    if (selectedItem != null) {
      selectedItem.isItemSelected = true;
    }

    // if (item is ComponentData) {
    // } else if (item is PortData) {
    // } else if (item is LinkData) {
    // } else {
    //   throw ArgumentError("selected item is unknown type");
    // }

    notifyListeners();
  }

  // ==== IDs ====

  int get generateNextComponentId => _componentIdGen++;

  int get getLastUsedComponentId => _componentIdGen - 1;

  int get getNextComponentId => _componentIdGen;

  int get generateNextLinkId => _linkIdGen++;

  int get getLastUsedLinkId => _linkIdGen - 1;

  int get getNextLinkId => _linkIdGen;

  // ==== HELPERS ====

  HashMap<int, ComponentData> generateComponents(int number) {
    HashMap<int, ComponentData> resultMap = HashMap<int, ComponentData>();
    for (int j = 0; j < number / 100; j++) {
      for (int i = 0;
          i < ((number - j * 100) >= 100 ? 100 : (number % 100));
          i++) {
        resultMap[generateNextComponentId] = ComponentData(
            id: getLastUsedComponentId,
            position: Offset(i * 3.0, i * 3.0 + 100 * j),
            color: randomColor(),
            size: Size(50, 50));
      }
    }
    return resultMap;
  }

  HashMap<int, ComponentData> generateRandomComponents(int number) {
    HashMap<int, ComponentData> resultMap = HashMap<int, ComponentData>();

    for (int i = 0; i < number; i++) {
      resultMap[generateNextComponentId] = ComponentData(
        id: getLastUsedComponentId,
        color: randomColor(),
        size: Size(40 + 100 * math.Random().nextDouble(),
            40 + 300 * math.Random().nextDouble()),
        position: Offset(1200 * 2 * (math.Random().nextDouble() - 0.5),
            1200 * 2 * (math.Random().nextDouble() - 0.5)),
        portSize: _portSize,
        ports: generatePortData(getLastUsedComponentId,
            math.Random().nextInt(portPerComponentCount)),
      );
    }
    return resultMap;
  }

  HashMap<int, PortData> generatePortData(int componentId, int number) {
    HashMap<int, PortData> ports = HashMap<int, PortData>();
    for (int i = 0; i < number; i++) {
      ports[i] = PortData(
        id: i,
        componentId: componentId,
        color: randomColor(),
        borderColor: math.Random().nextBool() ? Colors.black : Colors.white,
        alignment: Alignment(2 * math.Random().nextDouble() - 1,
            2 * math.Random().nextDouble() - 1),
      );
    }
    return ports;
  }

  HashMap<int, LinkData> generateRandomLinks(int number) {
    HashMap<int, LinkData> resultMap = HashMap<int, LinkData>();
    for (int i = 0; i < number; i++) {
      generateNextLinkId;

      int idOut = math.Random().nextInt(getNextComponentId);
      int idIn = math.Random().nextInt(getNextComponentId);

      var componentOut = componentDataMap[idOut];
      var componentIn = componentDataMap[idIn];

      var portCountOut = componentOut.ports.length;
      if (portCountOut == 0) continue;
      var randomPortIdOut = math.Random().nextInt(portCountOut);

      var portCountIn = componentIn.ports.length;
      if (portCountIn == 0) continue;
      var randomPortIdIn = math.Random().nextInt(portCountIn);

      componentOut.ports[randomPortIdOut].addConnection(
        PortConnectionOut(
          linkId: getLastUsedLinkId,
          componentId: idOut,
          portId: randomPortIdOut,
        ),
      );

      componentIn.ports[randomPortIdIn].addConnection(
        PortConnectionIn(
          linkId: getLastUsedLinkId,
          componentId: idIn,
          portId: randomPortIdIn,
        ),
      );

      resultMap[getLastUsedLinkId] = LinkData(
        id: getLastUsedLinkId,
        color: Colors.black,
        width: 1.5,
        start: componentOut.getPortCenterPoint(randomPortIdOut),
        end: componentIn.getPortCenterPoint(randomPortIdIn),
      );
    }
    return resultMap;
  }

  Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}

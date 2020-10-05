import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';

import 'link_data.dart';

class CanvasModel extends ChangeNotifier {
  int _componentIdGen = 0;
  int _linkIdGen = 0;

  Offset _position = Offset(0, 0);
  double _scale = 1.0;

  HashMap<int, ComponentData> _componentDataMap;
  HashMap<int, LinkData> _linkDataMap;

  CanvasModel() {
    // _componentDataMap = generateComponents(100);
    _componentDataMap = generateRandomComponents(100);

    _linkDataMap = generateRandomLinks(100);
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
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
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
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
        size: Size(10 + 80 * math.Random().nextDouble(),
            10 + 80 * math.Random().nextDouble()),
        position: Offset(1200 * 2 * (math.Random().nextDouble() - 0.5),
            1200 * 2 * (math.Random().nextDouble() - 0.5)),
      );
    }
    return resultMap;
  }

  HashMap<int, LinkData> generateRandomLinks(int number) {
    HashMap<int, LinkData> resultList = HashMap<int, LinkData>();
    for (int i = 0; i < number; i++) {
      generateNextLinkId;

      int fromId = math.Random().nextInt(getNextComponentId);
      int toId = math.Random().nextInt(getNextComponentId);

      componentDataMap[fromId].addLinkFrom(getLastUsedLinkId);
      componentDataMap[toId].addLinkTo(getLastUsedLinkId);

      resultList[getLastUsedLinkId] = LinkData(
        // id: getLastUsedLinkId,
        color: Colors.black,
        width: 1.5,
        // fromId: fromId,
        // toId: toId,
        start: componentDataMap[fromId].position +
            componentDataMap[fromId].size.center(Offset(0, 0)),
        end: componentDataMap[toId].position +
            componentDataMap[toId].size.center(Offset(0, 0)),
      );
    }
    return resultList;
  }
}

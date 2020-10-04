import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/item_data.dart';

import 'edge_data.dart';

double maxScale = 4.0;
double minScale = 0.2;

class CanvasModel extends ChangeNotifier {
  int _itemIdGen = 0;
  int _edgeIdGen = 0;

  Offset _position = Offset(0, 0);
  double _scale = 1.0;

  HashMap<int, ItemData> _itemDataList;
  HashMap<int, EdgeData> _edgeDataList;

  CanvasModel() {
    // _itemDataList = generateItems(100);
    _itemDataList = generateRandomItems(5);

    _edgeDataList = generateRandomEdges(0);
  }

  Offset get position => _position;

  double get scale => _scale;

  HashMap<int, ItemData> get itemDataList => _itemDataList;

  HashMap<int, EdgeData> get edgeDataList => _edgeDataList;

  // ==== NOTIFIERS ====

  addItemToList(ItemData itemData) {
    _itemDataList[itemData.id] = itemData;
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
    double newScale = _scale * scale;
    _scale = keepScaleInBounds(newScale);
    // notifyListeners();
  }

  updateCanvasData(Offset position, double scale) {
    _scale = keepScaleInBounds(scale);
    _position += position;
    // notifyListeners();
  }

  updateCanvasEnd() {
    notifyListeners();
  }

  // updateItemDataPosition(ItemData itemData, Offset position) {
  //   _itemDataList[itemData.id] = ItemData(
  //     id: itemData.id,
  //     position: position,
  //     color: itemData.color,
  //     size: itemData.size,
  //   );
  //   notifyListeners();
  // }

  getItemDataPosition(int id) {
    return itemDataList[id].position;
  }

  // ==== IDs ====

  int get generateNextItemId => _itemIdGen++;

  int get getLastUsedItemId => _itemIdGen - 1;

  int get getNextItemId => _itemIdGen;

  int get generateNextEdgeId => _edgeIdGen++;

  int get getLastUsedEdgeId => _edgeIdGen - 1;

  int get getNextEdgeId => _edgeIdGen;

  // ==== HELPERS ====

  double keepScaleInBounds(double scale) {
    double scaleResult = scale;
    if (scale <= minScale) {
      scaleResult = minScale;
    }
    if (scale >= maxScale) {
      scaleResult = maxScale;
    }
    return scaleResult;
  }

  HashMap<int, ItemData> generateItems(int number) {
    HashMap<int, ItemData> resultMap = HashMap<int, ItemData>();
    for (int j = 0; j < number / 100; j++) {
      for (int i = 0;
          i < ((number - j * 100) >= 100 ? 100 : (number % 100));
          i++) {
        resultMap[generateNextItemId] = ItemData(
            id: getLastUsedItemId,
            position: Offset(i * 3.0, i * 3.0 + 100 * j),
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            size: Size(50, 50));
      }
    }
    return resultMap;
  }

  HashMap<int, ItemData> generateRandomItems(int number) {
    HashMap<int, ItemData> resultMap = HashMap<int, ItemData>();

    for (int i = 0; i < number; i++) {
      resultMap[generateNextItemId] = ItemData(
        id: getLastUsedItemId,
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
        size: Size(10 + 80 * math.Random().nextDouble(),
            10 + 80 * math.Random().nextDouble()),
        position: Offset(600 * 2 * (math.Random().nextDouble() - 0.5),
            600 * 2 * (math.Random().nextDouble() - 0.5)),
      );
    }
    return resultMap;
  }

  HashMap<int, EdgeData> generateRandomEdges(int number) {
    HashMap<int, EdgeData> resultList = HashMap<int, EdgeData>();
    for (int i = 0; i < number; i++) {
      generateNextEdgeId;

      int fromId = math.Random().nextInt(getNextItemId);
      int toId = math.Random().nextInt(getNextItemId);

      itemDataList[fromId].addEdgeFrom(getLastUsedEdgeId);
      itemDataList[toId].addEdgeTo(getLastUsedEdgeId);

      resultList[getLastUsedEdgeId] = EdgeData(
        // id: getLastUsedEdgeId,
        color: Colors.black,
        width: 1.5,
        // fromId: fromId,
        // toId: toId,
        start: itemDataList[fromId].position +
            itemDataList[fromId].size.center(Offset(0, 0)),
        end: itemDataList[toId].position +
            itemDataList[toId].size.center(Offset(0, 0)),
      );
    }
    return resultList;
  }
}

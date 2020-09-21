import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/item_data.dart';

import 'edge_data.dart';

double maxScale = 4.0;
double minScale = 0.2;

class CanvasModel extends ChangeNotifier {
  static int _itemIdGen = 0;

  Offset _position = Offset(0, 0);
  double _scale = 1.0;
  HashMap<int, ItemData> _itemDataList;
  List<EdgeData> _edgeDataList;

  CanvasModel() {
    // _itemDataList = generateLargeItemList(200);
    _itemDataList = generateRandomItemList(80);

    _edgeDataList = generateRandomEdgeList(200);
  }

  Offset get position => _position;

  double get scale => _scale;

  HashMap<int, ItemData> get itemDataList => _itemDataList;

  List<EdgeData> get edgeDataList => _edgeDataList;

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
    notifyListeners();
  }

  updateCanvasScale(double scale) {
    double newScale = _scale * scale;
    _scale = keepScaleInBounds(newScale);
    notifyListeners();
  }

  updateCanvasData(Offset position, double scale) {
    _scale = keepScaleInBounds(scale);
    _position += position;
    notifyListeners();
  }

  updateItemDataPosition(ItemData itemData, Offset position) {
    _itemDataList[itemData.id] = ItemData(
      id: itemData.id,
      position: position,
      color: itemData.color,
      size: itemData.size,
    );
    notifyListeners();
  }

  getItemDataPosition(int id) {
    return itemDataList[id].position;
  }

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

  int getNextItemId() {
    return _itemIdGen++;
  }

  int getLastId() {
    return _itemIdGen - 1;
  }

  int getNextId() {
    return _itemIdGen;
  }

  List<ItemData> generateLargeItemList(int number) {
    List<ItemData> resultList = [];
    for (int j = 0; j < number / 100; j++) {
      for (int i = 0;
          i < ((number - j * 100) >= 100 ? 100 : (number % 100));
          i++) {
        resultList.add(ItemData(
            id: getNextItemId(),
            position: Offset(i * 3.0, i * 3.0 + 100 * j),
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            size: Size(50, 50)));
      }
    }
    return resultList;
  }

  HashMap<int, ItemData> generateRandomItemList(int number) {
    HashMap<int, ItemData> resultMap = HashMap<int, ItemData>();

    for (int i = 0; i < number; i++) {
      resultMap[getNextItemId()] = ItemData(
        id: getLastId(),
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

  List<EdgeData> generateRandomEdgeList(int number) {
    List<EdgeData> resultList = [];
    for (int i = 0; i < number; i++) {
      resultList.add(EdgeData(
        id: 0,
        color: Colors.black,
        width: 1.5,
        fromId: math.Random().nextInt(getNextId()),
        toId: math.Random().nextInt(getNextId()),
      ));
    }
    return resultList;
  }
}

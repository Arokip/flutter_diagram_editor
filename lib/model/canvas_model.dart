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
  List<ItemData> _itemDataList;
  List<EdgeData> _edgeDataList;

  CanvasModel() {
    // _itemDataList = generateLargeItemList(200);
    _itemDataList = generateRandomItemList(80);

    _edgeDataList = generateRandomEdgeList(80);
  }

  Offset get position => _position;

  double get scale => _scale;

  List<ItemData> get itemDataList => _itemDataList;

  List<EdgeData> get edgeDataList => _edgeDataList;

  // ==== NOTIFIERS ====

  addItemToList(ItemData itemData) {
    _itemDataList.add(itemData);
    notifyListeners();
  }

  addItemsToList(List<ItemData> list) {
    _itemDataList.addAll(list);
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
    int index = _itemDataList.indexWhere((item) => item.id == itemData.id);
    _itemDataList[index] = ItemData(
      id: itemData.id,
      position: position,
      color: itemData.color,
      size: itemData.size,
    );
    notifyListeners();
  }

  getItemDataPosition(int id) {
    return itemDataList.firstWhere((element) => element.id == id).position;
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

  List<ItemData> generateRandomItemList(int number) {
    List<ItemData> resultList = [];
    for (int i = 0; i < number; i++) {
      resultList.add(ItemData(
        id: getNextItemId(),
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
        size: Size(10 + 80 * math.Random().nextDouble(),
            10 + 80 * math.Random().nextDouble()),
        position: Offset(600 * 2 * (math.Random().nextDouble() - 0.5),
            600 * 2 * (math.Random().nextDouble() - 0.5)),
      ));
    }
    return resultList;
  }

  List<EdgeData> generateRandomEdgeList(int number) {
    List<EdgeData> resultList = [];
    for (int i = 0; i < number; i++) {
      resultList.add(EdgeData(
        id: 0,
        color: Colors.black,
        width: 1.5,
        fromId: math.Random().nextInt(getLastId()),
        toId: math.Random().nextInt(getLastId()),
      ));
    }
    return resultList;
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/item_data.dart';

double maxScale = 4.0;
double minScale = 0.4;

class CanvasData extends ChangeNotifier {
  Offset _position = Offset(0, 0);
  double _scale = 1.0;
  List<ItemData> _itemDataList;

  CanvasData() {
    _itemDataList = generateLargeList(300);
  }

  Offset get position => _position;

  double get scale => _scale;

  List<ItemData> get itemDataList => _itemDataList;

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

  List<ItemData> generateLargeList(int number) {
    List<ItemData> resultList = [];
    for (int j = 0; j < number / 100; j++) {
      for (int i = 0;
          i < ((number - j * 100) >= 100 ? 100 : (number % 100));
          i++) {
        resultList.add(ItemData(
            position: Offset(i * 3.0, i * 3.0 + 100 * j),
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            size: Size(50, 50)));
      }
    }
    return resultList;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/item_selected.dart';

class LinkData extends ChangeNotifier with ItemSelected {
  final int id;

  final int componentOutId;
  final int componentInId;
  final Color color;
  final double width;
  final double tipSize;

  final List<Offset> linkPoints;

  LinkData({
    @required this.id,
    @required this.componentOutId,
    @required this.componentInId,
    this.color = Colors.black,
    this.width = 1.0,
    this.tipSize = 5.0,
    @required this.linkPoints,
  })  : assert(width > 0),
        assert(tipSize > 0);

  setStart(Offset start) {
    linkPoints[0] = start;
    notifyListeners();
  }

  setEnd(Offset end) {
    linkPoints[linkPoints.length - 1] = end;
    notifyListeners();
  }

  insertMiddlePoint(Offset point, int index) {
    assert(index <= linkPoints.length);
    linkPoints.insert(index, point);
    notifyListeners();
  }

  updateMiddlePoint(Offset point, int index) {
    linkPoints[index] = point;
    notifyListeners();
  }

  removeMiddlePoint(int index) {
    linkPoints.removeAt(index);
    notifyListeners();
  }
}

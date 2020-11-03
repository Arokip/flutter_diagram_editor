import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/item_selected.dart';

class LinkData extends ChangeNotifier with ItemSelected {
  final int id;

  final int componentOutId;
  final int componentInId;
  final Color color;
  final double width;

  // Offset start;
  // Offset end;

  final List<Offset> linkPoints;

  LinkData({
    this.id,
    this.componentOutId,
    this.componentInId,
    this.color = Colors.black,
    this.width = 1.0,
    this.linkPoints,
    // this.start,
    // this.end,
  });

  setStart(Offset start) {
    linkPoints[0] = start;
    notifyListeners();
  }

  setEnd(Offset end) {
    linkPoints[linkPoints.length - 1] = end;
    notifyListeners();
  }

  // middle pointy zůstávaj
  // updateLinkDataPosition(Offset position) {
  //   this.start += position;
  //   this.end += position;
  //   middlePoints.forEach((point) {
  //     point += position;
  //   });
  //
  //   notifyListeners();
  // }

  insertMiddlePoint(Offset point, int index) {
    assert(index <= linkPoints.length);
    linkPoints.insert(index, point);
    notifyListeners();
  }

  updateMiddlePoint(Offset point, int index) {
    linkPoints[index] = point;
    notifyListeners();
  }
}

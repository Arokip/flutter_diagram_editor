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
    print('update middle: $point, $index');
    linkPoints[index] = point;
    notifyListeners();
    /*The following ArgumentError was thrown while handling a gesture:
Invalid argument(s)

When the exception was thrown, this was the stack:
#0      List._setIndexed (dart:core-patch/growable_array.dart:183:73)
#1      List.[]= (dart:core-patch/growable_array.dart:180:5)
#2      LinkData.updateMiddlePoint (package:flutter_provider_canvas/model/link_data.dart:56:15)
#3      _LinkState.build.<anonymous closure> (package:flutter_provider_canvas/link.dart:66:18)
#4      LongPressGestureRecognizer._checkLongPressMoveUpdate.<anonymous closure> (package:flutter/src/gestures/long_press.dart:468:41)*/
  }

  removeMiddlePoint(int index) {
    linkPoints.removeAt(index);
    notifyListeners();
  }
}

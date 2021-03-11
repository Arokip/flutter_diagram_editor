import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/helper/link_style.dart';

class LinkData extends ChangeNotifier {
  final String id;

  final String componentOutId;
  final String componentInId;
  // final Color color;
  // final double width;
  // final double tipSize;
  final LinkStyle linkStyle;

  final List<Offset> linkPoints;

  LinkData({
    @required this.id,
    @required this.componentOutId,
    @required this.componentInId,
    // this.color = Colors.black,
    // this.width = 1.0,
    // this.tipSize = 5.0,
    @required this.linkPoints,
    this.linkStyle = const LinkStyle(),
  });

  linkNotifyListeners() {
    notifyListeners();
  }

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
    assert(linkPoints.length > 2);
    assert(index != 0);
    assert(index != linkPoints.length - 1);
    linkPoints.removeAt(index);
    notifyListeners();
  }

  updateAllMiddlePoints(Offset position) {
    for (int i = 1; i < linkPoints.length - 1; i++) {
      linkPoints[i] += position;
    }
  }
}

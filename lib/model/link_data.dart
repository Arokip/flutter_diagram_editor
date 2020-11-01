import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/item_selected.dart';

class LinkData extends ChangeNotifier with ItemSelected {
  final int id;

  // final int fromId;
  // final int toId;
  final Color color;
  final double width;
  Offset start;
  Offset end;

  LinkData({
    this.id,
    // this.fromId,
    // this.toId,
    this.color = Colors.black,
    this.width = 1.0,
    this.start,
    this.end,
  });

  updateStart(Offset newStart) {
    start += newStart;
    notifyListeners();
  }

  updateEnd(Offset newEnd) {
    end += newEnd;
    notifyListeners();
  }

  setStart(Offset start) {
    this.start = start;
    notifyListeners();
  }

  setEnd(Offset end) {
    this.end = end;
    notifyListeners();
  }
}

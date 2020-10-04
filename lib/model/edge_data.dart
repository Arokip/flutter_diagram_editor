import 'package:flutter/material.dart';

class EdgeData extends ChangeNotifier {
  // final int id;
  // final int fromId;
  // final int toId;
  final Color color;
  final double width;
  Offset start;
  Offset end;

  EdgeData({
    // this.id,
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
}

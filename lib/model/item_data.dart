import 'package:flutter/material.dart';

class ItemData extends ChangeNotifier {
  final int id;
  Offset position;
  final Color color;
  final Size size;
  List<int> edgesFrom = [];
  List<int> edgesTo = [];

  ItemData({
    this.id,
    this.position,
    this.color,
    this.size,
  });

  updateItemDataPosition(Offset position) {
    this.position += position;
    notifyListeners();
  }

  addEdgeFrom(int edgeId) {
    edgesFrom.add(edgeId);
  }

  addEdgeTo(int edgeId) {
    edgesTo.add(edgeId);
  }
}

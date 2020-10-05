import 'package:flutter/material.dart';

class ComponentData extends ChangeNotifier {
  final int id;
  Offset position;
  final Color color;
  final Size size;
  List<int> linksFrom = [];
  List<int> linksTo = [];

  ComponentData({
    this.id,
    this.position,
    this.color,
    this.size,
  });

  updateComponentDataPosition(Offset position) {
    this.position += position;
    notifyListeners();
  }

  addLinkFrom(int linkId) {
    linksFrom.add(linkId);
  }

  addLinkTo(int linkId) {
    linksTo.add(linkId);
  }
}

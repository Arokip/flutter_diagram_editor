import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ComponentData extends ChangeNotifier {
  String id;
  Offset position;

  ComponentData({
    this.id,
    this.position,
  }) {
    if (this.id == null) {
      this.id = Uuid().v4();
    }
  }

  move(Offset position) {
    this.position += position;
    notifyListeners();
  }
}

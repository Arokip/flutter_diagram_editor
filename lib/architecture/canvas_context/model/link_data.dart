import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class LinkData extends ChangeNotifier {
  String id;
  Offset position;

  LinkData({
    this.id,
    this.position,
  }) {
    if (this.id == null) {
      this.id = Uuid().v4();
    }
  }
}

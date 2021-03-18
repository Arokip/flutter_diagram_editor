import 'package:flutter/material.dart';

class CanvasState extends ChangeNotifier {
  Offset _position = Offset(0, 0);
  double _scale = 1.0;

  Offset get position => _position;

  double get scale => _scale;

  move(Offset offset) {
    _position += offset;
    notifyListeners();
  }
}

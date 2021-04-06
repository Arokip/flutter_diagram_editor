import 'package:flutter/material.dart';

class CanvasState with ChangeNotifier {
  Offset _position = Offset(0, 0);
  double _scale = 1.0;

  double mouseScaleSpeed = 0.8;

  double maxScale = 8.0;
  double minScale = 0.1;

  Color color = Colors.white;

  GlobalKey canvasGlobalKey = GlobalKey();

  bool shouldAbsorbPointer = false;

  bool isInitialized = false;

  Offset get position => _position;

  double get scale => _scale;

  updateCanvas() {
    notifyListeners();
  }

  setPosition(Offset position) {
    _position = position;
  }

  setScale(double scale) {
    _scale = scale;
  }

  updatePosition(Offset offset) {
    _position += offset;
  }

  updateScale(double scale) {
    _scale *= scale;
  }

  resetCanvasView() {
    _position = Offset(0, 0);
    _scale = 1.0;
    notifyListeners();
  }

  Offset fromCanvasCoordinates(Offset position) {
    return (position - this.position) / scale;
  }

  Offset toCanvasCoordinates(Offset position) {
    return position * scale + this.position;
  }
}

import 'package:flutter/material.dart';

class CanvasState with ChangeNotifier {
  Offset _position = const Offset(0, 0);
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

  void updateCanvas() {
    notifyListeners();
  }

  void setPosition(Offset position) {
    _position = position;
  }

  void setScale(double scale) {
    _scale = scale;
  }

  void updatePosition(Offset offset) {
    _position += offset;
  }

  void updateScale(double scale) {
    _scale *= scale;
  }

  void resetCanvasView() {
    _position = const Offset(0, 0);
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

import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyComponentData {
  bool isHighlightVisible;
  Color color =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  MyComponentData({this.isHighlightVisible = false});

  switchHighlight() {
    isHighlightVisible = !isHighlightVisible;
  }

  showHighlight() {
    isHighlightVisible = true;
  }

  hideHighlight() {
    isHighlightVisible = false;
  }
}

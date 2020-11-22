import 'package:flutter/material.dart';

class ComponentOptionsData {
  final double optionSize;
  final List<ComponentOptionData> optionsTop;
  final List<ComponentOptionData> optionsBottom;

  const ComponentOptionsData({
    this.optionSize = 40,
    this.optionsTop = const [],
    this.optionsBottom = const [],
  });
}

class ComponentOptionData {
  final Color color;
  final IconData icon;
  // final VoidCallback onOptionTap;
  final void Function(int) onOptionTap;

  const ComponentOptionData({
    this.color = Colors.grey,
    this.icon,
    // this.onOptionTap,
    this.onOptionTap,
  });
}

import 'package:flutter/material.dart';

class ComponentOptionData {
  final Color color;
  final IconData icon;
  final String tooltip;
  final void Function(String) onOptionTap;

  const ComponentOptionData({
    this.color = Colors.grey,
    this.icon,
    this.tooltip,
    this.onOptionTap,
  });
}

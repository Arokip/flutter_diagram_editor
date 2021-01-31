import 'package:flutter/material.dart';

class MultipleSelectionOptionData {
  final Color color;
  final IconData icon;
  final String tooltip;
  final Function onOptionTap;

  const MultipleSelectionOptionData({
    this.color = const Color(0x44000000),
    this.icon,
    this.tooltip,
    this.onOptionTap,
  });
}

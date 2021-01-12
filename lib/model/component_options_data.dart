import 'package:flutter/material.dart';

// TODO: předělat options - seznam options vytvořených v modelu stejně jako component body, které budou pojmenovány a přidělovány ke komponentám
// class ComponentOptionsData {
//   final double optionSize;
//   final List<ComponentOptionData> optionsTop;
//   final List<ComponentOptionData> optionsBottom;
//
//   const ComponentOptionsData({
//     this.optionSize = 40,
//     this.optionsTop = const [],
//     this.optionsBottom = const [],
//   }) : assert(optionSize > 0);
// }

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

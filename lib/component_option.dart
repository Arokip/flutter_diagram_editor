import 'package:flutter/material.dart';

import 'model/component_options_data.dart';

class ComponentOption extends StatelessWidget {
  final int componentId;
  final double optionSize;
  final ComponentOptionData option;

  const ComponentOption({
    Key key,
    @required this.componentId,
    @required this.optionSize,
    @required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: option.color,
          shape: BoxShape.circle,
        ),
        width: optionSize,
        height: optionSize,
        child: Icon(option.icon),
      ),
      onTap: () {
        if (option.onOptionTap != null) {
          option.onOptionTap(componentId);
        }
      },
    );
  }
}

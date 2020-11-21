import 'package:flutter/material.dart';

import 'model/component_options_data.dart';

class ComponentOption extends StatelessWidget {
  final double optionSize;
  final ComponentOptionData option;

  const ComponentOption({
    Key key,
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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        width: optionSize,
        height: optionSize,
        child: Icon(option.icon),
      ),
      onTap: () {
        if (option.onOptionTap != null) {
          option.onOptionTap();
        }
      },
    );
  }
}

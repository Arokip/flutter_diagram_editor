import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:provider/provider.dart';

import 'model/multiple_selection_option_data.dart';

enum OpenDirection { left, top, right, bottom }

class MultipleSelectionSwitchButton extends StatelessWidget {
  final double size;
  final Color color;
  final Color iconColor;
  final Color colorEnabled;
  final Color iconColorEnabled;
  final OpenDirection openDirection;

  const MultipleSelectionSwitchButton({
    Key key,
    this.size = 48,
    this.color = const Color(0x44000000),
    this.iconColor = Colors.white,
    this.colorEnabled = const Color(0x44ff0000),
    this.iconColorEnabled = Colors.white,
    @required this.openDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var options =
        context.select<CanvasModel, List<MultipleSelectionOptionData>>(
            (CanvasModel model) => model.multipleSelectionOptions);

    switch (openDirection) {
      case OpenDirection.left:
        return Selector<CanvasModel, bool>(
          selector: (_, canvasModel) => canvasModel.isMultipleSelectionOn,
          builder: (_, isMultipleSelectionOn, __) {
            return Row(
              children: [
                Visibility(
                  visible: isMultipleSelectionOn,
                  child: Row(
                    children: [
                      ...options.map((option) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: MultipleSelectionOption(
                            size: size,
                            option: option,
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
                MultipleSelectionButton(
                  size: size,
                  color: color,
                  iconColor: iconColor,
                  colorEnabled: colorEnabled,
                  iconColorEnabled: iconColorEnabled,
                ),
              ],
            );
          },
        );
        break;
      case OpenDirection.top:
        return Selector<CanvasModel, bool>(
          selector: (_, canvasModel) => canvasModel.isMultipleSelectionOn,
          builder: (_, isMultipleSelectionOn, __) {
            return Column(
              children: [
                Visibility(
                  visible: isMultipleSelectionOn,
                  child: Column(
                    children: [
                      ...options.map((option) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: MultipleSelectionOption(
                            size: size,
                            option: option,
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
                MultipleSelectionButton(
                  size: size,
                  color: color,
                  iconColor: iconColor,
                  colorEnabled: colorEnabled,
                  iconColorEnabled: iconColorEnabled,
                ),
              ],
            );
          },
        );
        break;
      case OpenDirection.right:
        return Selector<CanvasModel, bool>(
          selector: (_, canvasModel) => canvasModel.isMultipleSelectionOn,
          builder: (_, isMultipleSelectionOn, __) {
            return Row(
              children: [
                MultipleSelectionButton(
                  size: size,
                  color: color,
                  iconColor: iconColor,
                  colorEnabled: colorEnabled,
                  iconColorEnabled: iconColorEnabled,
                ),
                Visibility(
                  visible: isMultipleSelectionOn,
                  child: Row(
                    children: [
                      ...options.map((option) {
                        return Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: MultipleSelectionOption(
                            size: size,
                            option: option,
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            );
          },
        );
        break;
      case OpenDirection.bottom:
        return Selector<CanvasModel, bool>(
          selector: (_, canvasModel) => canvasModel.isMultipleSelectionOn,
          builder: (_, isMultipleSelectionOn, __) {
            return Column(
              children: [
                MultipleSelectionButton(
                  size: size,
                  color: color,
                  iconColor: iconColor,
                  colorEnabled: colorEnabled,
                  iconColorEnabled: iconColorEnabled,
                ),
                Visibility(
                  visible: isMultipleSelectionOn,
                  child: Column(
                    children: [
                      ...options.map((option) {
                        return Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: MultipleSelectionOption(
                            size: size,
                            option: option,
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            );
          },
        );
        break;
    }
    return SizedBox.shrink();
  }
}

class MultipleSelectionButton extends StatelessWidget {
  const MultipleSelectionButton({
    Key key,
    @required this.size,
    @required this.color,
    @required this.iconColor,
    @required this.colorEnabled,
    @required this.iconColorEnabled,
  }) : super(key: key);

  final double size;
  final Color color;
  final Color iconColor;
  final Color colorEnabled;
  final Color iconColorEnabled;

  @override
  Widget build(BuildContext context) {
    var switchMS = context.select<CanvasModel, Function>(
        (CanvasModel model) => model.switchMultipleSelection);
    var isMultipleSelectionOn = context.select<CanvasModel, bool>(
        (CanvasModel model) => model.isMultipleSelectionOn);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isMultipleSelectionOn ? colorEnabled : color,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        color: isMultipleSelectionOn ? iconColorEnabled : iconColor,
        onPressed: () {
          switchMS();
        },
        tooltip: 'Multiple selection',
        icon: const Icon(Icons.select_all),
      ),
    );
  }
}

class MultipleSelectionOption extends StatelessWidget {
  final double size;
  final MultipleSelectionOptionData option;

  const MultipleSelectionOption({
    Key key,
    @required this.size,
    @required this.option,
  })  : assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: option.color,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        color: Colors.red,
        onPressed: () {
          if (option.onOptionTap != null) {
            option.onOptionTap();
          }
        },
        tooltip: option.tooltip,
        icon: Icon(option.icon),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:provider/provider.dart';

enum OpenDirection { left, top, right, bottom }

class MultipleSelectionSwitchButton extends StatelessWidget {
  final double size;
  final Color color;
  final Color iconColor;
  final OpenDirection openDirection;

  const MultipleSelectionSwitchButton({
    Key key,
    this.size = 48,
    this.color = const Color(0x44000000),
    this.iconColor = Colors.white,
    @required this.openDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      ...[0, 1, 2].map((e) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: MultipleSelectionOption(
                            size: size,
                            color: color,
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
                      ...[0, 1, 2].map((e) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: MultipleSelectionOption(
                            size: size,
                            color: color,
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
                ),
                Visibility(
                  visible: isMultipleSelectionOn,
                  child: Row(
                    children: [
                      ...[0, 1, 2].map((e) {
                        return Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: MultipleSelectionOption(
                            size: size,
                            color: color,
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
                ),
                Visibility(
                  visible: isMultipleSelectionOn,
                  child: Column(
                    children: [
                      ...[0, 1, 2].map((e) {
                        return Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: MultipleSelectionOption(
                            size: size,
                            color: color,
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
  }
}

class MultipleSelectionButton extends StatelessWidget {
  const MultipleSelectionButton({
    Key key,
    @required this.size,
    @required this.color,
    @required this.iconColor,
  }) : super(key: key);

  final double size;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    var switchMS = context.select<CanvasModel, Function>(
        (CanvasModel model) => model.switchMultipleSelection);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        color: iconColor,
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
// TODO: icon, function on press
  final double size;
  final Color color;

  const MultipleSelectionOption({
    Key key,
    @required this.size,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        color: Colors.red,
        onPressed: () {
          print('press');
        },
        tooltip: 'Multiple selection',
        icon: const Icon(Icons.select_all),
      ),
    );
  }
}

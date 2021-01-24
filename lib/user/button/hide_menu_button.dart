import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/model/canvas_model.dart';
import 'package:provider/provider.dart';

class HideMenuButton extends StatelessWidget {
  final double size;
  final Color color;
  final Color iconColor;

  const HideMenuButton({
    Key key,
    this.size = 48,
    this.color = const Color(0x44000000),
    this.iconColor = Colors.white,
  })  : assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CanvasModel>(
      builder: (_, canvasModel, __) {
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
              canvasModel.menuData.isMenuVisible =
                  !canvasModel.menuData.isMenuVisible;
              canvasModel.notifyCanvasModelListeners();
            },
            tooltip: 'Show/Hide menu',
            icon: const Icon(Icons.view_compact),
          ),
        );
      },
    );
  }
}

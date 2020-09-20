import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'canvas.dart';
import 'menu.dart';
import 'model/menu_item_data.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  List<MenuItemData> menuItemList;

  @override
  void initState() {
    menuItemList = generateMenuItems(120);
    super.initState();
  }

  List<MenuItemData> generateMenuItems(int number) {
    List<MenuItemData> resultList = [];
    for (int i = 0; i < number; i++) {
      resultList.add(MenuItemData(
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
        size: Size(10 + 80 * math.Random().nextDouble(),
            10 + 80 * math.Random().nextDouble()),
      ));
    }
    return resultList;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.blueGrey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: DiagramEditorCanvas(),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          height: 64,
          width: 64,
          // TODO: --> own widget (resetViewButton)
          child: IconButton(
            color: Colors.white,
            onPressed: () {
              // TODO: provider reset
              // _canvasKey.currentState.resetView();
            },
            tooltip: 'Reset',
            icon: const Icon(Icons.replay),
          ),
        ),
        Positioned(
          left: 0,
          top: 200,
          child: DiagramEditorMenu(
              width: 80,
              height: 400,
              backgroundColor: Colors.grey,
              menuItemList: menuItemList),
        )
      ],
    );
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/reset_view_button.dart';
import 'package:provider/provider.dart';

import 'canvas.dart';
import 'menu.dart';
import 'model/canvas_model.dart';
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
    return ChangeNotifierProvider<CanvasModel>(
      create: (BuildContext context) => CanvasModel(),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.blueGrey,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: DiagramEditorCanvas(),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(2, 8, 0, 8),
            alignment: Alignment.centerLeft,
            child: DiagramEditorMenu(
                width: 80,
                height: 400,
                backgroundColor: Colors.grey,
                menuItemList: menuItemList),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            height: 64,
            width: 64,
            child: ResetViewButton(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Consumer<CanvasModel>(
                builder: (_, canvasData, __) {
                  return Text(
                      'l:${canvasData.itemDataList.length}, p:${canvasData.position}, s:${canvasData.scale}');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

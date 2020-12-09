import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/delete_all_button.dart';
import 'package:flutter_provider_canvas/multiple_selection_switch_button.dart';
import 'package:flutter_provider_canvas/remove_all_connections_button.dart';
import 'package:flutter_provider_canvas/reset_view_button.dart';
import 'package:provider/provider.dart';

import 'canvas.dart';
import 'menu.dart';
import 'model/canvas_model.dart';
import 'model/menu_component_data.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  List<MenuComponentData> menuComponentList;

  @override
  void initState() {
    menuComponentList = generateMenuComponents(120);
    super.initState();
  }

  List<MenuComponentData> generateMenuComponents(int number) {
    List<MenuComponentData> resultList = [];
    for (int i = 0; i < number; i++) {
      resultList.add(MenuComponentData(
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
        size: Size(10 + 80 * math.Random().nextDouble(),
            10 + 80 * math.Random().nextDouble()),
        portSize: 20,
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
            child: Container(
              width: 80,
              height: 400,
              color: Colors.black.withOpacity(0.2),
              child: DiagramEditorMenu(
                menuComponentList: menuComponentList,
              ),
            ),
          ),
          Positioned(
            left: 24,
            bottom: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ResetViewButton(),
                SizedBox(width: 8),
                MultipleSelectionSwitchButton(
                  openDirection: OpenDirection.top,
                ),
                SizedBox(width: 8),
                DeleteAllButton(),
                SizedBox(width: 8),
                RemoveAllConnectionsButton(),
              ],
            ),
          ),
          // DEBUG:
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              color: Colors.grey,
              child: Consumer<CanvasModel>(
                builder: (_, canvasData, __) {
                  return Text(
                      'l:${canvasData.componentDataMap.length}, p:${canvasData.position}, s:${canvasData.scale}');
                },
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            right: 16,
            child: Container(
              color: Colors.grey,
              child: Consumer<CanvasModel>(
                builder: (_, canvasData, __) {
                  return Text(
                      'port rules:\n${canvasData.portRules.rules}\nmax ${canvasData.portRules.maxConnectionCount}');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

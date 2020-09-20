import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'canvas.dart';
import 'menu.dart';
import 'model/item_data.dart';
import 'model/menu_item_data.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final GlobalKey<CanvasState> _canvasKey = GlobalKey();
  final GlobalKey _dragTargetKey = GlobalKey();

  List<MenuItemData> menuItemList;

  @override
  void initState() {
    menuItemList = generateMenuItems(120);
    super.initState();
  }

  void _onAcceptWithDetails(DragTargetDetails details) {
    final RenderBox renderBox =
        _dragTargetKey.currentContext.findRenderObject();
    final Offset localOffset = renderBox.globalToLocal(details.offset);
    _canvasKey.currentState.itemList.add(
      ItemData(
        color: details.data.color,
        size: details.data.size,
        position:
            (localOffset - _canvasKey.currentState.canvasData.value.position) /
                _canvasKey.currentState.canvasData.value.scale,
      ),
    );
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
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(
            'canvas setState() (rebuild all)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 8),
          ),
          onPressed: () {
            setState(() {});
            print('setState');
          },
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.blueGrey,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: DragTarget<MenuItemData>(
                  key: _dragTargetKey,
                  builder: (BuildContext context,
                      List<MenuItemData> candidateData,
                      List<dynamic> rejectedData) {
                    return Container(
                      child: Canvas(
                        key: _canvasKey,
                      ),
                    );
                  },
                  onWillAccept: (MenuItemData data) => true,
                  onAcceptWithDetails: _onAcceptWithDetails,
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              height: 64,
              width: 64,
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                  // TODO: provider reset
                  _canvasKey.currentState.resetView();
                },
                tooltip: 'Reset',
                icon: const Icon(Icons.replay),
              ),
            ),
            Positioned(
              left: 0,
              top: 200,
              child: Menu(
                  width: 80,
                  height: 400,
                  backgroundColor: Colors.grey,
                  menuItemList: menuItemList),
            )
          ],
        ),
      ),
    );
  }
}

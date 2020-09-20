import 'package:flutter/material.dart';

import 'model/menu_item_data.dart';

class MenuItem extends StatelessWidget {
  final MenuItemData menuItemData;

  MenuItem({
    Key key,
    this.menuItemData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: menuItemData.size.width,
      height: menuItemData.size.height,
      color: menuItemData.color,
    );
  }
}

class DraggableMenuItem extends StatelessWidget {
  final MenuItemData menuItemData;

  DraggableMenuItem({
    Key key,
    this.menuItemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<MenuItemData>(
      data: menuItemData,
      childWhenDragging: MenuItem(
        menuItemData: menuItemData,
      ),
      feedback: MenuItem(
        menuItemData: menuItemData,
      ),
      child: MenuItem(
        menuItemData: menuItemData,
      ),
    );
  }
}

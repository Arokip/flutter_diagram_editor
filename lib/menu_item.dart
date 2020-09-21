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

class MenuItemWhenDragging extends StatelessWidget {
  final MenuItemData menuItemData;
  final double cornerDotSize = 4.0;

  MenuItemWhenDragging({
    Key key,
    this.menuItemData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: menuItemData.size.width,
          height: menuItemData.size.height,
          color: menuItemData.color,
        ),
        Container(
          width: cornerDotSize,
          height: cornerDotSize,
          color: Colors.black,
        ),
      ],
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
      feedback: MenuItemWhenDragging(
        menuItemData: menuItemData,
      ),
      child: MenuItem(
        menuItemData: menuItemData,
      ),
    );
  }
}

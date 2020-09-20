import 'package:flutter/material.dart';

import 'menu_item.dart';
import 'model/menu_item_data.dart';

class DiagramEditorMenu extends StatelessWidget {
  final List<MenuItemData> menuItemList;
  final Color backgroundColor;
  final double width;
  final double height;

  const DiagramEditorMenu({
    Key key,
    this.menuItemList,
    this.backgroundColor,
    this.width,
    this.height,
  }) : super(key: key);

  Widget menuItemWithRightSize(MenuItemData menuItemData) {
    if (menuItemData.size.width > width - 40) {
      return AspectRatio(
        aspectRatio: menuItemData.size.width / menuItemData.size.height,
        child: DraggableMenuItem(
          menuItemData: menuItemData,
        ),
      );
    } else {
      return Align(
        alignment: Alignment.center,
        child: DraggableMenuItem(
          menuItemData: menuItemData,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: ListView(
        children: <Widget>[
          ...menuItemList
              .map((MenuItemData menuItemData) => Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 32, 8),
                    child: menuItemWithRightSize(menuItemData),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

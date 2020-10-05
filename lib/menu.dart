import 'package:flutter/material.dart';

import 'menu_component.dart';
import 'model/menu_component_data.dart';

class DiagramEditorMenu extends StatelessWidget {
  final List<MenuComponentData> menuComponentList;

  const DiagramEditorMenu({
    Key key,
    this.menuComponentList,
  }) : super(key: key);

  Widget menuComponentWithRightSize(
      MenuComponentData menuComponentData, BoxConstraints size) {
    if (menuComponentData.size.width > size.maxWidth - 40) {
      return AspectRatio(
        aspectRatio:
            menuComponentData.size.width / menuComponentData.size.height,
        child: DraggableMenuComponent(
          menuComponentData: menuComponentData,
        ),
      );
    } else {
      return Align(
        alignment: Alignment.center,
        child: DraggableMenuComponent(
          menuComponentData: menuComponentData,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return ListView(
        children: <Widget>[
          ...menuComponentList
              .map(
                (MenuComponentData menuComponentData) => Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 32, 8),
                  child: menuComponentWithRightSize(menuComponentData, size),
                ),
              )
              .toList(),
        ],
      );
    });
  }
}

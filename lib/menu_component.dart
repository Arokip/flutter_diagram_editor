import 'package:flutter/material.dart';

import 'model/menu_component_data.dart';

class MenuComponent extends StatelessWidget {
  final MenuComponentData menuComponentData;

  MenuComponent({
    Key key,
    this.menuComponentData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: menuComponentData.size.width,
      height: menuComponentData.size.height,
      color: menuComponentData.color,
    );
  }
}

class MenuComponentWhenDragging extends StatelessWidget {
  final MenuComponentData menuComponentData;

  MenuComponentWhenDragging({
    Key key,
    this.menuComponentData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: menuComponentData.size.width,
      height: menuComponentData.size.height,
      color: menuComponentData.color,
    );
  }
}

class DraggableMenuComponent extends StatelessWidget {
  final MenuComponentData menuComponentData;

  DraggableMenuComponent({
    Key key,
    this.menuComponentData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<MenuComponentData>(
      affinity: Axis.horizontal,
      data: menuComponentData,
      childWhenDragging: MenuComponent(
        menuComponentData: menuComponentData,
      ),
      feedback: MenuComponentWhenDragging(
        menuComponentData: menuComponentData,
      ),
      child: MenuComponent(
        menuComponentData: menuComponentData,
      ),
    );
  }
}

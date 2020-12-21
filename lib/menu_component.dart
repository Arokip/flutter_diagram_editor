import 'package:flutter/material.dart';

import 'model/component_data.dart';

class MenuComponent extends StatelessWidget {
  final ComponentData menuComponentData;

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

class DraggableMenuComponent extends StatelessWidget {
  final ComponentData menuComponentData;

  DraggableMenuComponent({
    Key key,
    this.menuComponentData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<ComponentData>(
      affinity: Axis.horizontal,
      data: menuComponentData,
      childWhenDragging: MenuComponent(
        menuComponentData: menuComponentData,
      ),
      feedback: MenuComponent(
        menuComponentData: menuComponentData,
      ),
      child: MenuComponent(
        menuComponentData: menuComponentData,
      ),
    );
  }
}

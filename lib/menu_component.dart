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
  final Axis affinity;

  DraggableMenuComponent({
    Key key,
    this.menuComponentData,
    this.affinity = Axis.horizontal,
  })  : assert(affinity != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<ComponentData>(
      affinity: affinity,
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

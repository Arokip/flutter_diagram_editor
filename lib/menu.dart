import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/menu_data.dart';
import 'package:provider/provider.dart';

import 'menu_component.dart';
import 'model/canvas_model.dart';
import 'model/component_data.dart';

class DiagramEditorMenu extends StatelessWidget {
  // TODO: horizontal/vertical menu

  Widget menuComponentWithRightSize(
      ComponentData componentData, BoxConstraints size) {
    if (componentData.size.width > size.maxWidth - 40) {
      return AspectRatio(
        aspectRatio: componentData.size.width / componentData.size.height,
        child: DraggableMenuComponent(
          menuComponentData: componentData,
        ),
      );
    } else {
      return Align(
        alignment: Alignment.center,
        child: DraggableMenuComponent(
          menuComponentData: componentData,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var menuData = context
        .select<CanvasModel, MenuData>((CanvasModel model) => model.menuData);
    return LayoutBuilder(builder: (context, size) {
      return ListView(
        children: <Widget>[
          ...menuData.menuComponentDataList
              .map(
                (ComponentData componentData) => Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: menuComponentWithRightSize(componentData, size),
                ),
              )
              .toList(),
        ],
      );
    });
  }
}

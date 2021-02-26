import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/menu_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/menu_component.dart';
import 'package:provider/provider.dart';

enum MenuComponentRatio { ratio34, realSizeRatio }

class DiagramEditorMenu extends StatelessWidget {
  final Axis scrollDirection;
  final MenuComponentRatio menuComponentRatio;

  const DiagramEditorMenu({
    Key key,
    this.scrollDirection = Axis.vertical,
    this.menuComponentRatio = MenuComponentRatio.ratio34,
  })  : assert(scrollDirection != null),
        super(key: key);

  Widget menuComponentWithRightSize(
      ComponentData componentData, BoxConstraints size) {
    bool useAspectRatio = (scrollDirection == Axis.vertical)
        ? componentData.size.width > size.maxWidth
        : componentData.size.height > size.maxHeight;
    if (useAspectRatio) {
      return AspectRatio(
        aspectRatio: componentData.size.width / componentData.size.height,
        child: DraggableMenuComponent(
          menuComponentData: componentData,
          affinity: flipAxis(scrollDirection),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.center,
        child: DraggableMenuComponent(
          menuComponentData: componentData,
          affinity: flipAxis(scrollDirection),
        ),
      );
    }
  }

  Widget menuComponentWithRightSize34(ComponentData componentData) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: DraggableMenuComponent(
        menuComponentData: componentData,
        affinity: flipAxis(scrollDirection),
      ),
    );
  }

  Widget menuByRatio(ComponentData componentData, BoxConstraints size) {
    if (menuComponentRatio == MenuComponentRatio.ratio34) {
      return menuComponentWithRightSize34(componentData);
    } else if (menuComponentRatio == MenuComponentRatio.realSizeRatio) {
      return menuComponentWithRightSize(componentData, size);
    } else {
      return menuComponentWithRightSize34(componentData);
    }
  }

  @override
  Widget build(BuildContext context) {
    var menuData = context
        .select<CanvasModel, MenuData>((CanvasModel model) => model.menuData);

    return LayoutBuilder(builder: (context, size) {
      return ListView(
        scrollDirection: scrollDirection,
        children: <Widget>[
          ...menuData.menuComponentDataList
              .map(
                (ComponentData componentData) => Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: menuByRatio(componentData, size),
                ),
              )
              .toList(),
        ],
      );
    });
  }
}

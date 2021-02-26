import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/menu_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/menu_component.dart';
import 'package:provider/provider.dart';

enum MenuComponentRatio { ratio34, ratio169, ratio23, realSizeRatio }

class DiagramEditorMenu extends StatelessWidget {
  final Axis scrollDirection;
  final MenuComponentRatio menuComponentRatio;

  const DiagramEditorMenu({
    Key key,
    this.scrollDirection = Axis.vertical,
    this.menuComponentRatio = MenuComponentRatio.ratio23,
  })  : assert(scrollDirection != null),
        super(key: key);

  Widget menuComponentWithRealSizeRatio(
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

  Widget menuComponentWithRatio(ComponentData componentData, double ratio) {
    return AspectRatio(
      aspectRatio: ratio,
      child: DraggableMenuComponent(
        menuComponentData: componentData,
        affinity: flipAxis(scrollDirection),
      ),
    );
  }

  Widget menuByRatio(ComponentData componentData, BoxConstraints size) {
    if (menuComponentRatio == MenuComponentRatio.ratio23) {
      return menuComponentWithRatio(componentData, 3 / 2);
    } else if (menuComponentRatio == MenuComponentRatio.ratio34) {
      return menuComponentWithRatio(componentData, 4 / 3);
    } else if (menuComponentRatio == MenuComponentRatio.ratio169) {
      return menuComponentWithRatio(componentData, 16 / 9);
    } else if (menuComponentRatio == MenuComponentRatio.realSizeRatio) {
      return menuComponentWithRealSizeRatio(componentData, size);
    } else {
      return menuComponentWithRatio(componentData, 3 / 2);
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

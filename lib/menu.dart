import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/menu_component.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/menu_data.dart';
import 'package:provider/provider.dart';

class DiagramEditorMenu extends StatelessWidget {
  final Axis scrollDirection;

  const DiagramEditorMenu({
    Key key,
    this.scrollDirection = Axis.vertical,
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
                  child: menuComponentWithRightSize(componentData, size),
                ),
              )
              .toList(),
        ],
      );
    });
  }
}

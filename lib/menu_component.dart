import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_body.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:provider/provider.dart';

class MenuComponent extends StatelessWidget {
  final ComponentData menuComponentData;
  final Widget child;

  MenuComponent({
    Key key,
    @required this.menuComponentData,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: menuComponentData.size.width,
        height: menuComponentData.size.height,
        child: child);
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
    var componentBodyMap =
        context.select<CanvasModel, HashMap<String, ComponentBody>>(
            (CanvasModel model) => model.componentBodyMap);
    return Draggable<ComponentData>(
      affinity: affinity,
      ignoringFeedbackSemantics: true,
      data: menuComponentData,
      childWhenDragging: MenuComponent(
        menuComponentData: menuComponentData,
        child: componentBodyMap[menuComponentData.componentBodyName]
            .menuComponentBody,
      ),
      feedback: Material(
        color: Colors.transparent,
        child: MenuComponent(
          menuComponentData: menuComponentData,
          child: componentBodyMap[menuComponentData.componentBodyName]
              .menuComponentBody,
        ),
      ),
      child: MenuComponent(
        menuComponentData: menuComponentData,
        child: componentBodyMap[menuComponentData.componentBodyName]
            .menuComponentBody,
      ),
    );
  }
}

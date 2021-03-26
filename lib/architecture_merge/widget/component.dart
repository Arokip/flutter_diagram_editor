import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_policy_set.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/component_data.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/widgets_definition.dart';
import 'package:provider/provider.dart';

class Component extends StatelessWidget {
  final DefaultPolicySet policy;

  const Component({
    Key key,
    this.policy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final componentData = Provider.of<ComponentData>(context);
    final canvasState = Provider.of<CanvasState>(context);
    final widgetsDefinition = Provider.of<WidgetsDefinition>(context);

    return Positioned(
      left: canvasState.scale * componentData.position.dx +
          canvasState.position.dx,
      top: canvasState.scale * componentData.position.dy +
          canvasState.position.dy,
      width: canvasState.scale * componentData.size.width,
      height: canvasState.scale * componentData.size.height,
      child: GestureDetector(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 0,
              width: componentData.size.width,
              height: componentData.size.height,
              child: Container(
                transform: Matrix4.identity()..scale(canvasState.scale),
                child: widgetsDefinition
                    .getComponentBody(componentData.componentBodyName),
              ),
            ),
          ],
        ),
        onTap: () => policy.onComponentTap(componentData.id),
        onTapDown: (TapDownDetails details) =>
            policy.onComponentTapDown(componentData.id, details),
        onTapUp: (TapUpDetails details) =>
            policy.onComponentTapUp(componentData.id, details),
        onTapCancel: () => policy.onComponentTapCancel(componentData.id),
        onScaleStart: (ScaleStartDetails details) =>
            policy.onComponentScaleStart(componentData.id, details),
        onScaleUpdate: (ScaleUpdateDetails details) =>
            policy.onComponentScaleUpdate(componentData.id, details),
        onScaleEnd: (ScaleEndDetails details) =>
            policy.onComponentScaleEnd(componentData.id, details),
        onLongPress: () => policy.onComponentLongPress(componentData.id),
        onLongPressStart: (LongPressStartDetails details) =>
            policy.onComponentLongPressStart(componentData.id, details),
        onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) =>
            policy.onComponentLongPressMoveUpdate(componentData.id, details),
        onLongPressEnd: (LongPressEndDetails details) =>
            policy.onComponentLongPressEnd(componentData.id, details),
        onLongPressUp: () => policy.onComponentLongPressUp(componentData.id),
      ),
    );
  }
}

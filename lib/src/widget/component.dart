import 'package:diagram_editor/src/abstraction_layer/policy/base/policy_set.dart';
import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Component extends StatelessWidget {
  final PolicySet policy;

  /// Fundamental building unit of a diagram. Represents one component on the canvas.
  const Component({
    Key? key,
    required this.policy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final componentData = Provider.of<ComponentData>(context);
    final canvasState = Provider.of<CanvasState>(context);

    return Positioned(
      left: canvasState.scale * componentData.position.dx +
          canvasState.position.dx,
      top: canvasState.scale * componentData.position.dy +
          canvasState.position.dy,
      width: canvasState.scale * componentData.size.width,
      height: canvasState.scale * componentData.size.height,
      child: Listener(
        onPointerSignal: (PointerSignalEvent event) {
          policy.onComponentPointerSignal(componentData.id, event);
        },
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
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
                  child: policy.showComponentBody(componentData),
                ),
              ),
              policy.showCustomWidgetWithComponentData(context, componentData),
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
      ),
    );
  }
}

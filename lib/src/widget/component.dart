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
          policy.onComponentPointerSignal(
            context,
            componentData.id,
            event,
          );
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
                  child: policy.showComponentBody(context, componentData),
                ),
              ),
              policy.showCustomWidgetWithComponentData(context, componentData),
            ],
          ),
          onTap: () => policy.onComponentTap(context, componentData.id),
          onTapDown: (TapDownDetails details) =>
              policy.onComponentTapDown(context, componentData.id, details),
          onTapUp: (TapUpDetails details) =>
              policy.onComponentTapUp(context, componentData.id, details),
          onTapCancel: () =>
              policy.onComponentTapCancel(context, componentData.id),
          onScaleStart: (ScaleStartDetails details) =>
              policy.onComponentScaleStart(context, componentData.id, details),
          onScaleUpdate: (ScaleUpdateDetails details) =>
              policy.onComponentScaleUpdate(context, componentData.id, details),
          onScaleEnd: (ScaleEndDetails details) =>
              policy.onComponentScaleEnd(context, componentData.id, details),
          onLongPress: () =>
              policy.onComponentLongPress(context, componentData.id),
          onLongPressStart: (LongPressStartDetails details) => policy
              .onComponentLongPressStart(context, componentData.id, details),
          onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) =>
              policy.onComponentLongPressMoveUpdate(
                  context, componentData.id, details),
          onLongPressEnd: (LongPressEndDetails details) => policy
              .onComponentLongPressEnd(context, componentData.id, details),
          onLongPressUp: () =>
              policy.onComponentLongPressUp(context, componentData.id),
        ),
      ),
    );
  }
}

import 'package:diagram_editor/src/controller/diagram_controller.dart';
import 'package:diagram_editor/src/model/component_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Internal widget that renders a single component on the canvas.
class ComponentWidget<C, L> extends StatelessWidget {
  const ComponentWidget({
    required this.controller,
    required this.componentData,
    required this.componentBuilder,
    super.key,
    this.componentOverlayBuilder,
    this.onComponentTap,
    this.onComponentTapDown,
    this.onComponentTapUp,
    this.onComponentLongPress,
    this.onComponentLongPressStart,
    this.onComponentLongPressMoveUpdate,
    this.onComponentLongPressEnd,
    this.onComponentLongPressUp,
    this.onComponentScaleStart,
    this.onComponentScaleUpdate,
    this.onComponentScaleEnd,
    this.onComponentPointerSignal,
  });

  final DiagramController<C, L> controller;
  final ComponentData<C> componentData;
  final Widget Function(BuildContext context, ComponentData<C> data)
      componentBuilder;
  final Widget Function(BuildContext context, ComponentData<C> data)?
      componentOverlayBuilder;
  final void Function(String id)? onComponentTap;
  final void Function(String id, TapDownDetails details)? onComponentTapDown;
  final void Function(String id, TapUpDetails details)? onComponentTapUp;
  final void Function(String id)? onComponentLongPress;
  final void Function(String id, LongPressStartDetails details)?
      onComponentLongPressStart;
  final void Function(String id, LongPressMoveUpdateDetails details)?
      onComponentLongPressMoveUpdate;
  final void Function(String id, LongPressEndDetails details)?
      onComponentLongPressEnd;
  final void Function(String id)? onComponentLongPressUp;
  final void Function(String id, ScaleStartDetails details)?
      onComponentScaleStart;
  final void Function(String id, ScaleUpdateDetails details)?
      onComponentScaleUpdate;
  final void Function(String id, ScaleEndDetails details)? onComponentScaleEnd;
  final void Function(String id, PointerSignalEvent event)?
      onComponentPointerSignal;

  @override
  Widget build(BuildContext context) {
    final scale = controller.canvasScale;
    final pos = controller.canvasPosition;

    return Positioned(
      left: scale * componentData.position.dx + pos.dx,
      top: scale * componentData.position.dy + pos.dy,
      width: scale * componentData.size.width,
      height: scale * componentData.size.height,
      child: Listener(
        onPointerSignal: onComponentPointerSignal != null
            ? (event) => onComponentPointerSignal!(componentData.id, event)
            : null,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onComponentTap != null
              ? () => onComponentTap!(componentData.id)
              : null,
          onTapDown: onComponentTapDown != null
              ? (d) => onComponentTapDown!(componentData.id, d)
              : null,
          onTapUp: onComponentTapUp != null
              ? (d) => onComponentTapUp!(componentData.id, d)
              : null,
          onLongPress: onComponentLongPress != null
              ? () => onComponentLongPress!(componentData.id)
              : null,
          onLongPressStart: onComponentLongPressStart != null
              ? (d) => onComponentLongPressStart!(componentData.id, d)
              : null,
          onLongPressMoveUpdate: onComponentLongPressMoveUpdate != null
              ? (d) => onComponentLongPressMoveUpdate!(componentData.id, d)
              : null,
          onLongPressEnd: onComponentLongPressEnd != null
              ? (d) => onComponentLongPressEnd!(componentData.id, d)
              : null,
          onLongPressUp: onComponentLongPressUp != null
              ? () => onComponentLongPressUp!(componentData.id)
              : null,
          onScaleStart: onComponentScaleStart != null
              ? (d) => onComponentScaleStart!(componentData.id, d)
              : null,
          onScaleUpdate: onComponentScaleUpdate != null
              ? (d) => onComponentScaleUpdate!(componentData.id, d)
              : null,
          onScaleEnd: onComponentScaleEnd != null
              ? (d) => onComponentScaleEnd!(componentData.id, d)
              : null,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 0,
                width: componentData.size.width,
                height: componentData.size.height,
                child: Container(
                  // Matrix4.scale() replacement not yet
                  // stable across Flutter versions.
                  // ignore: deprecated_member_use
                  transform: Matrix4.identity()..scale(scale),
                  child: componentBuilder(context, componentData),
                ),
              ),
              if (componentOverlayBuilder != null)
                componentOverlayBuilder!(context, componentData),
            ],
          ),
        ),
      ),
    );
  }
}

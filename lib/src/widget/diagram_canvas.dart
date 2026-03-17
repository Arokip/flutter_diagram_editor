import 'package:diagram_editor/src/controller/diagram_controller.dart';
import 'package:diagram_editor/src/model/component_data.dart';
import 'package:diagram_editor/src/model/link_data.dart';
import 'package:diagram_editor/src/widget/component_widget.dart';
import 'package:diagram_editor/src/widget/link_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Internal canvas widget that renders all components and links.
class DiagramCanvas<C, L> extends StatelessWidget {
  const DiagramCanvas({
    required this.controller,
    required this.componentBuilder,
    super.key,
    this.animationController,
    this.componentOverlayBuilder,
    this.componentUnderlayBuilder,
    this.linkWidgetBuilder,
    this.backgroundBuilder,
    this.foregroundBuilder,
    this.onCanvasTap,
    this.onCanvasTapDown,
    this.onCanvasTapUp,
    this.onCanvasLongPress,
    this.onCanvasLongPressStart,
    this.onCanvasLongPressMoveUpdate,
    this.onCanvasLongPressEnd,
    this.onCanvasLongPressUp,
    this.onCanvasScaleStart,
    this.onCanvasScaleUpdate,
    this.onCanvasScaleEnd,
    this.onCanvasPointerSignal,
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
    this.onLinkTap,
    this.onLinkTapDown,
    this.onLinkTapUp,
    this.onLinkLongPress,
    this.onLinkLongPressStart,
    this.onLinkLongPressMoveUpdate,
    this.onLinkLongPressEnd,
    this.onLinkLongPressUp,
    this.onLinkScaleStart,
    this.onLinkScaleUpdate,
    this.onLinkScaleEnd,
    this.onLinkPointerSignal,
    this.onLinkJointTap,
    this.onLinkJointLongPress,
    this.onLinkJointLongPressStart,
    this.onLinkJointLongPressMoveUpdate,
    this.onLinkJointLongPressEnd,
    this.onLinkJointLongPressUp,
    this.onLinkJointScaleStart,
    this.onLinkJointScaleUpdate,
    this.onLinkJointScaleEnd,
    this.linksOnTop = true,
  });

  final DiagramController<C, L> controller;
  final AnimationController? animationController;

  // Builders
  final Widget Function(BuildContext context, ComponentData<C> data)
      componentBuilder;
  final Widget Function(BuildContext context, ComponentData<C> data)?
      componentOverlayBuilder;
  final Widget Function(BuildContext context, ComponentData<C> data)?
      componentUnderlayBuilder;
  final Widget Function(BuildContext context, LinkData<L> data)?
      linkWidgetBuilder;
  final List<Widget> Function(BuildContext context)? backgroundBuilder;
  final List<Widget> Function(BuildContext context)? foregroundBuilder;

  // Canvas callbacks
  final VoidCallback? onCanvasTap;
  final void Function(TapDownDetails details)? onCanvasTapDown;
  final void Function(TapUpDetails details)? onCanvasTapUp;
  final VoidCallback? onCanvasLongPress;
  final void Function(LongPressStartDetails details)? onCanvasLongPressStart;
  final void Function(LongPressMoveUpdateDetails details)?
      onCanvasLongPressMoveUpdate;
  final void Function(LongPressEndDetails details)? onCanvasLongPressEnd;
  final VoidCallback? onCanvasLongPressUp;
  final void Function(ScaleStartDetails details)? onCanvasScaleStart;
  final void Function(ScaleUpdateDetails details)? onCanvasScaleUpdate;
  final void Function(ScaleEndDetails details)? onCanvasScaleEnd;
  final void Function(PointerSignalEvent event)? onCanvasPointerSignal;

  // Component callbacks
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

  // Link callbacks
  final void Function(String id)? onLinkTap;
  final void Function(String id, TapDownDetails details)? onLinkTapDown;
  final void Function(String id, TapUpDetails details)? onLinkTapUp;
  final void Function(String id)? onLinkLongPress;
  final void Function(String id, LongPressStartDetails details)?
      onLinkLongPressStart;
  final void Function(String id, LongPressMoveUpdateDetails details)?
      onLinkLongPressMoveUpdate;
  final void Function(String id, LongPressEndDetails details)?
      onLinkLongPressEnd;
  final void Function(String id)? onLinkLongPressUp;
  final void Function(String id, ScaleStartDetails details)? onLinkScaleStart;
  final void Function(String id, ScaleUpdateDetails details)? onLinkScaleUpdate;
  final void Function(String id, ScaleEndDetails details)? onLinkScaleEnd;
  final void Function(String id, PointerSignalEvent event)? onLinkPointerSignal;

  // Joint callbacks
  final void Function(int index, String linkId)? onLinkJointTap;
  final void Function(int index, String linkId)? onLinkJointLongPress;
  final void Function(
    int index,
    String linkId,
    LongPressStartDetails details,
  )? onLinkJointLongPressStart;
  final void Function(
    int index,
    String linkId,
    LongPressMoveUpdateDetails details,
  )? onLinkJointLongPressMoveUpdate;
  final void Function(int index, String linkId, LongPressEndDetails details)?
      onLinkJointLongPressEnd;
  final void Function(int index, String linkId)? onLinkJointLongPressUp;
  final void Function(int index, String linkId, ScaleStartDetails details)?
      onLinkJointScaleStart;
  final void Function(int index, String linkId, ScaleUpdateDetails details)?
      onLinkJointScaleUpdate;
  final void Function(int index, String linkId, ScaleEndDetails details)?
      onLinkJointScaleEnd;

  // Config
  final bool linksOnTop;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: controller.canvasGlobalKey,
      child: AbsorbPointer(
        absorbing: controller.shouldAbsorbPointer,
        child: Listener(
          onPointerSignal: onCanvasPointerSignal,
          child: GestureDetector(
            onTap: onCanvasTap,
            onTapDown: onCanvasTapDown,
            onTapUp: onCanvasTapUp,
            onLongPress: onCanvasLongPress,
            onLongPressStart: onCanvasLongPressStart,
            onLongPressMoveUpdate: onCanvasLongPressMoveUpdate,
            onLongPressEnd: onCanvasLongPressEnd,
            onLongPressUp: onCanvasLongPressUp,
            onScaleStart: onCanvasScaleStart,
            onScaleUpdate: onCanvasScaleUpdate,
            onScaleEnd: onCanvasScaleEnd,
            child: ColoredBox(
              color: controller.canvasColor,
              child: ClipRect(
                child: animationController != null
                    ? _buildAnimated(context)
                    : _buildStack(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimated(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, child) {
        controller.canUpdateCanvasModel = true;
        return Transform(
          transform: Matrix4.translationValues(
            controller.transformPosition.dx,
            controller.transformPosition.dy,
            0,
          )
            // Matrix4.scale() replacement not yet
            // stable across Flutter versions.
            // ignore: deprecated_member_use
            ..scale(controller.transformScale),
          child: child,
        );
      },
      child: _buildStack(context),
    );
  }

  Widget _buildStack(BuildContext context) {
    final components = _buildComponents();
    final links = _buildLinks();
    final underlays = _buildUnderlays();

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        if (backgroundBuilder != null) ...backgroundBuilder!(context),
        ...underlays,
        if (linksOnTop) ...components,
        ...links,
        if (!linksOnTop) ...components,
        if (foregroundBuilder != null) ...foregroundBuilder!(context),
      ],
    );
  }

  List<Widget> _buildComponents() {
    return controller.componentsSorted.map((componentData) {
      return ListenableBuilder(
        listenable: componentData,
        builder: (context, _) {
          return ComponentWidget<C, L>(
            controller: controller,
            componentData: componentData,
            componentBuilder: componentBuilder,
            componentOverlayBuilder: componentOverlayBuilder,
            onComponentTap: onComponentTap,
            onComponentTapDown: onComponentTapDown,
            onComponentTapUp: onComponentTapUp,
            onComponentLongPress: onComponentLongPress,
            onComponentLongPressStart: onComponentLongPressStart,
            onComponentLongPressMoveUpdate: onComponentLongPressMoveUpdate,
            onComponentLongPressEnd: onComponentLongPressEnd,
            onComponentLongPressUp: onComponentLongPressUp,
            onComponentScaleStart: onComponentScaleStart,
            onComponentScaleUpdate: onComponentScaleUpdate,
            onComponentScaleEnd: onComponentScaleEnd,
            onComponentPointerSignal: onComponentPointerSignal,
          );
        },
      );
    }).toList();
  }

  List<Widget> _buildLinks() {
    return controller.links.values.map((linkData) {
      return ListenableBuilder(
        listenable: linkData,
        builder: (context, _) {
          return LinkWidget<C, L>(
            controller: controller,
            linkData: linkData,
            linkWidgetBuilder: linkWidgetBuilder,
            onLinkTap: onLinkTap,
            onLinkTapDown: onLinkTapDown,
            onLinkTapUp: onLinkTapUp,
            onLinkLongPress: onLinkLongPress,
            onLinkLongPressStart: onLinkLongPressStart,
            onLinkLongPressMoveUpdate: onLinkLongPressMoveUpdate,
            onLinkLongPressEnd: onLinkLongPressEnd,
            onLinkLongPressUp: onLinkLongPressUp,
            onLinkScaleStart: onLinkScaleStart,
            onLinkScaleUpdate: onLinkScaleUpdate,
            onLinkScaleEnd: onLinkScaleEnd,
            onLinkPointerSignal: onLinkPointerSignal,
            onLinkJointTap: onLinkJointTap,
            onLinkJointLongPress: onLinkJointLongPress,
            onLinkJointLongPressStart: onLinkJointLongPressStart,
            onLinkJointLongPressMoveUpdate: onLinkJointLongPressMoveUpdate,
            onLinkJointLongPressEnd: onLinkJointLongPressEnd,
            onLinkJointLongPressUp: onLinkJointLongPressUp,
            onLinkJointScaleStart: onLinkJointScaleStart,
            onLinkJointScaleUpdate: onLinkJointScaleUpdate,
            onLinkJointScaleEnd: onLinkJointScaleEnd,
          );
        },
      );
    }).toList();
  }

  List<Widget> _buildUnderlays() {
    if (componentUnderlayBuilder == null) return [];
    return controller.components.values.map((componentData) {
      return ListenableBuilder(
        listenable: componentData,
        builder: (context, _) {
          return componentUnderlayBuilder!(context, componentData);
        },
      );
    }).toList();
  }
}

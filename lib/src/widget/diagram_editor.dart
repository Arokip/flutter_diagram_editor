import 'package:diagram_editor/src/controller/default_behaviors.dart';
import 'package:diagram_editor/src/controller/diagram_controller.dart';
import 'package:diagram_editor/src/model/component_data.dart';
import 'package:diagram_editor/src/model/link_data.dart';
import 'package:diagram_editor/src/util/link_attachment.dart';
import 'package:diagram_editor/src/widget/diagram_canvas.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// The main widget for building interactive diagrams.
///
/// Requires a [controller] and a [componentBuilder]. All gesture handling
/// is done via optional callbacks instead of policy mixins.
///
/// Default pan/zoom, link control, and joint control behaviors are enabled
/// by default and can be disabled via [enableDefaultPanZoom],
/// [enableDefaultLinkControl], and [enableDefaultJointControl].
///
/// **Callback composition order:** When default behaviors are enabled,
/// they run *before* user callbacks. For example, `onCanvasScaleUpdate`
/// fires after the default pan/zoom has already been applied. To
/// conditionally prevent the default behavior, disable it via the
/// corresponding flag (e.g. `enableDefaultPanZoom = false`) and
/// reimplement the behavior in your callback using the controller's
/// extension methods (e.g. `controller.handleCanvasScaleUpdate`).
class DiagramEditor<C, L> extends StatefulWidget {
  const DiagramEditor({
    required this.controller,
    required this.componentBuilder,
    super.key,
    this.linkEndpointAlignment,
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
    this.enableDefaultPanZoom = true,
    this.enableDefaultLinkControl = true,
    this.enableDefaultJointControl = true,
    this.linksOnTop = true,
    this.onInit,
  });

  /// The controller that manages diagram state.
  final DiagramController<C, L> controller;

  /// Builds the visual representation of each component.
  final Widget Function(BuildContext context, ComponentData<C> data)
      componentBuilder;

  /// Link endpoint alignment strategy.
  /// Defaults to [LinkAttachment.rectangular].
  final LinkEndpointAligner? linkEndpointAlignment;

  // ---- Builder params ----

  /// Builds overlay widgets per component (e.g. selection handles).
  final Widget Function(BuildContext context, ComponentData<C> data)?
      componentOverlayBuilder;

  /// Builds underlay widgets per component.
  final Widget Function(BuildContext context, ComponentData<C> data)?
      componentUnderlayBuilder;

  /// Builds custom widgets on links.
  final Widget Function(BuildContext context, LinkData<L> data)?
      linkWidgetBuilder;

  /// Background widgets behind all components and links.
  final List<Widget> Function(BuildContext context)? backgroundBuilder;

  /// Foreground widgets on top of all components and links.
  final List<Widget> Function(BuildContext context)? foregroundBuilder;

  // ---- Canvas callbacks ----

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

  // ---- Component callbacks ----

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

  // ---- Link callbacks ----

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

  // ---- Joint callbacks ----

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

  // ---- Config ----

  /// Whether default pan/zoom behavior is enabled. Defaults to true.
  final bool enableDefaultPanZoom;

  /// Whether default link control behavior is enabled. Defaults to true.
  final bool enableDefaultLinkControl;

  /// Whether default joint control behavior is enabled. Defaults to true.
  final bool enableDefaultJointControl;

  /// Whether links are rendered on top of components. Defaults to true.
  final bool linksOnTop;

  /// Called once after the widget is initialized.
  final VoidCallback? onInit;

  @override
  State<DiagramEditor<C, L>> createState() => _DiagramEditorState<C, L>();
}

class _DiagramEditorState<C, L> extends State<DiagramEditor<C, L>>
    with TickerProviderStateMixin {
  int? _linkSegmentIndex;

  @override
  void initState() {
    super.initState();

    if (widget.linkEndpointAlignment != null) {
      widget.controller.linkEndpointAligner = widget.linkEndpointAlignment!;
    }

    if (widget.enableDefaultPanZoom) {
      widget.controller.animationController = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      );
    }

    widget.onInit?.call();
  }

  @override
  void dispose() {
    // Only dispose the animation controller if we created it
    if (widget.enableDefaultPanZoom) {
      widget.controller.animationController?.dispose();
      widget.controller.animationController = null;
    }
    super.dispose();
  }

  // ===========================================================================
  // Compose user callbacks with default behaviors
  // ===========================================================================

  void _onCanvasScaleStart(ScaleStartDetails details) {
    if (widget.enableDefaultPanZoom) {
      widget.controller.handleCanvasScaleStart(details);
    }
    widget.onCanvasScaleStart?.call(details);
  }

  void _onCanvasScaleUpdate(ScaleUpdateDetails details) {
    if (widget.enableDefaultPanZoom) {
      widget.controller.handleCanvasScaleUpdate(details);
    }
    widget.onCanvasScaleUpdate?.call(details);
  }

  void _onCanvasScaleEnd(ScaleEndDetails details) {
    if (widget.enableDefaultPanZoom) {
      widget.controller.handleCanvasScaleEnd(details);
    }
    widget.onCanvasScaleEnd?.call(details);
  }

  void _onCanvasPointerSignal(PointerSignalEvent event) {
    if (widget.enableDefaultPanZoom) {
      widget.controller.handleCanvasPointerSignal(event);
    }
    widget.onCanvasPointerSignal?.call(event);
  }

  void _onLinkTapUp(String linkId, TapUpDetails details) {
    if (widget.enableDefaultLinkControl) {
      widget.controller.handleLinkTapUp(linkId, details);
    }
    widget.onLinkTapUp?.call(linkId, details);
  }

  void _onLinkScaleStart(String linkId, ScaleStartDetails details) {
    if (widget.enableDefaultLinkControl) {
      _linkSegmentIndex =
          widget.controller.handleLinkScaleStart(linkId, details);
    }
    widget.onLinkScaleStart?.call(linkId, details);
  }

  void _onLinkScaleUpdate(String linkId, ScaleUpdateDetails details) {
    if (widget.enableDefaultLinkControl) {
      widget.controller
          .handleLinkScaleUpdate(linkId, details, _linkSegmentIndex);
    }
    widget.onLinkScaleUpdate?.call(linkId, details);
  }

  void _onLinkLongPressStart(String linkId, LongPressStartDetails details) {
    if (widget.enableDefaultLinkControl) {
      _linkSegmentIndex =
          widget.controller.handleLinkLongPressStart(linkId, details);
    }
    widget.onLinkLongPressStart?.call(linkId, details);
  }

  void _onLinkLongPressMoveUpdate(
    String linkId,
    LongPressMoveUpdateDetails details,
  ) {
    if (widget.enableDefaultLinkControl) {
      widget.controller
          .handleLinkLongPressMoveUpdate(linkId, details, _linkSegmentIndex);
    }
    widget.onLinkLongPressMoveUpdate?.call(linkId, details);
  }

  void _onJointLongPress(int jointIndex, String linkId) {
    if (widget.enableDefaultJointControl) {
      widget.controller.handleJointLongPress(jointIndex, linkId);
    }
    widget.onLinkJointLongPress?.call(jointIndex, linkId);
  }

  void _onJointScaleUpdate(
    int jointIndex,
    String linkId,
    ScaleUpdateDetails details,
  ) {
    if (widget.enableDefaultJointControl) {
      widget.controller.handleJointScaleUpdate(jointIndex, linkId, details);
    }
    widget.onLinkJointScaleUpdate?.call(jointIndex, linkId, details);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        return DiagramCanvas<C, L>(
          controller: widget.controller,
          animationController: widget.controller.animationController,
          componentBuilder: widget.componentBuilder,
          componentOverlayBuilder: widget.componentOverlayBuilder,
          componentUnderlayBuilder: widget.componentUnderlayBuilder,
          linkWidgetBuilder: widget.linkWidgetBuilder,
          backgroundBuilder: widget.backgroundBuilder,
          foregroundBuilder: widget.foregroundBuilder,
          linksOnTop: widget.linksOnTop,
          // Canvas
          onCanvasTap: widget.onCanvasTap,
          onCanvasTapDown: widget.onCanvasTapDown,
          onCanvasTapUp: widget.onCanvasTapUp,
          onCanvasLongPress: widget.onCanvasLongPress,
          onCanvasLongPressStart: widget.onCanvasLongPressStart,
          onCanvasLongPressMoveUpdate: widget.onCanvasLongPressMoveUpdate,
          onCanvasLongPressEnd: widget.onCanvasLongPressEnd,
          onCanvasLongPressUp: widget.onCanvasLongPressUp,
          onCanvasScaleStart: _onCanvasScaleStart,
          onCanvasScaleUpdate: _onCanvasScaleUpdate,
          onCanvasScaleEnd: _onCanvasScaleEnd,
          onCanvasPointerSignal: _onCanvasPointerSignal,
          // Component
          onComponentTap: widget.onComponentTap,
          onComponentTapDown: widget.onComponentTapDown,
          onComponentTapUp: widget.onComponentTapUp,
          onComponentLongPress: widget.onComponentLongPress,
          onComponentLongPressStart: widget.onComponentLongPressStart,
          onComponentLongPressMoveUpdate: widget.onComponentLongPressMoveUpdate,
          onComponentLongPressEnd: widget.onComponentLongPressEnd,
          onComponentLongPressUp: widget.onComponentLongPressUp,
          onComponentScaleStart: widget.onComponentScaleStart,
          onComponentScaleUpdate: widget.onComponentScaleUpdate,
          onComponentScaleEnd: widget.onComponentScaleEnd,
          onComponentPointerSignal: widget.onComponentPointerSignal,
          // Link — compose with defaults
          onLinkTap: widget.onLinkTap,
          onLinkTapDown: widget.onLinkTapDown,
          onLinkTapUp: _onLinkTapUp,
          onLinkLongPress: widget.onLinkLongPress,
          onLinkLongPressStart: _onLinkLongPressStart,
          onLinkLongPressMoveUpdate: _onLinkLongPressMoveUpdate,
          onLinkLongPressEnd: widget.onLinkLongPressEnd,
          onLinkLongPressUp: widget.onLinkLongPressUp,
          onLinkScaleStart: _onLinkScaleStart,
          onLinkScaleUpdate: _onLinkScaleUpdate,
          onLinkScaleEnd: widget.onLinkScaleEnd,
          onLinkPointerSignal: widget.onLinkPointerSignal,
          // Joint — compose with defaults
          onLinkJointTap: widget.onLinkJointTap,
          onLinkJointLongPress: _onJointLongPress,
          onLinkJointLongPressStart: widget.onLinkJointLongPressStart,
          onLinkJointLongPressMoveUpdate: widget.onLinkJointLongPressMoveUpdate,
          onLinkJointLongPressEnd: widget.onLinkJointLongPressEnd,
          onLinkJointLongPressUp: widget.onLinkJointLongPressUp,
          onLinkJointScaleStart: widget.onLinkJointScaleStart,
          onLinkJointScaleUpdate: _onJointScaleUpdate,
          onLinkJointScaleEnd: widget.onLinkJointScaleEnd,
        );
      },
    );
  }
}

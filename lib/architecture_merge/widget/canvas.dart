import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/canvas_control_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_policy_set.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/component_data.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/link_data.dart';
import 'package:flutter_diagram_editor/architecture_merge/widget/component.dart';
import 'package:flutter_diagram_editor/architecture_merge/widget/link.dart';
import 'package:provider/provider.dart';

class DiagramEditorCanvas extends StatefulWidget {
  final DefaultPolicySet policy;

  const DiagramEditorCanvas({
    Key key,
    @required this.policy,
  }) : super(key: key);

  @override
  _DiagramEditorCanvasState createState() => _DiagramEditorCanvasState();
}

class _DiagramEditorCanvasState extends State<DiagramEditorCanvas>
    with TickerProviderStateMixin {
  DefaultPolicySet withControlPolicy;

  @override
  void initState() {
    super.initState();
    withControlPolicy =
        (widget.policy is CanvasControlPolicy) ? widget.policy : null;
    (withControlPolicy as CanvasControlPolicy)?.setAnimationController(
      AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      ),
    );
  }

  @override
  void dispose() {
    (withControlPolicy as CanvasControlPolicy)?.disposeAnimationController();
    super.dispose();
  }

  List<Widget> showComponents(CanvasModel canvasModel) {
    var zOrderedComponents = canvasModel.components.values.toList();
    zOrderedComponents.sort((a, b) => a.zOrder.compareTo(b.zOrder));

    return zOrderedComponents.map((ComponentData componentData) {
      return ChangeNotifierProvider<ComponentData>.value(
        value: componentData,
        child: Component(
          policy: widget.policy,
        ),
      );
    }).toList();
  }

  List<Widget> showOtherWithComponentData(CanvasModel canvasModel) {
    return canvasModel.components.values.map((ComponentData componentData) {
      return ChangeNotifierProvider<ComponentData>.value(
        value: componentData,
        builder: (context, child) {
          return Consumer<ComponentData>(
            builder: (context, data, child) {
              return widget.policy
                  .showCustomWidgetOnCanvasWithComponentData(componentData);
            },
          );
        },
        child: widget.policy
            .showCustomWidgetOnCanvasWithComponentData(componentData),
      );
    }).toList();
  }

  List<Widget> showLinks(CanvasModel canvasModel) {
    return canvasModel.links.values.map((LinkData linkData) {
      return ChangeNotifierProvider<LinkData>.value(
        value: linkData,
        child: Link(
          policy: widget.policy,
        ),
      );
    }).toList();
  }

  Widget canvasStack(CanvasModel canvasModel) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        // addDragTarget(canvasModel),
        ...showComponents(canvasModel),
        ...showLinks(canvasModel),
        // showOptions(canvasModel),
        // showComponentHighlight(canvasModel),
        ...showOtherWithComponentData(canvasModel),
        // ...widget.policy.showCustomWidgetsOnCanvas(),
      ],
    );
  }

  Widget canvasAnimated(CanvasModel canvasModel) {
    return AnimatedBuilder(
      animation:
          (withControlPolicy as CanvasControlPolicy).getAnimationController(),
      builder: (BuildContext context, Widget child) {
        (withControlPolicy as CanvasControlPolicy).canUpdateCanvasModel = true;
        return Transform(
          transform: Matrix4.identity()
            ..translate(
                (withControlPolicy as CanvasControlPolicy).transformPosition.dx,
                (withControlPolicy as CanvasControlPolicy).transformPosition.dy)
            ..scale((withControlPolicy as CanvasControlPolicy).transformScale),
          child: child,
        );
      },
      child: canvasStack(canvasModel),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('CANVAS build');
    final canvasModel = Provider.of<CanvasModel>(context);
    final canvasState = Provider.of<CanvasState>(context);

    return RepaintBoundary(
      key: canvasState.canvasGlobalKey,
      child: AbsorbPointer(
        absorbing: canvasState.shouldAbsorbPointer,
        child: Listener(
          onPointerSignal: (PointerSignalEvent event) =>
              widget.policy.onCanvasPointerSignal(event),
          child: GestureDetector(
            child: Container(
              color: canvasState.color,
              child: ClipRect(
                child: (withControlPolicy != null)
                    ? canvasAnimated(canvasModel)
                    : canvasStack(canvasModel),
              ),
            ),
            onScaleStart: (details) =>
                widget.policy.onCanvasScaleStart(details),
            onScaleUpdate: (details) =>
                widget.policy.onCanvasScaleUpdate(details),
            onScaleEnd: (details) => widget.policy.onCanvasScaleEnd(details),
            onTap: () => widget.policy.onCanvasTap(),
            onTapDown: (TapDownDetails details) =>
                widget.policy.onCanvasTapDown(details),
            onTapUp: (TapUpDetails details) =>
                widget.policy.onCanvasTapUp(details),
            onTapCancel: () => widget.policy.onCanvasTapCancel(),
            onLongPress: () => widget.policy.onCanvasLongPress(),
            onLongPressStart: (LongPressStartDetails details) =>
                widget.policy.onCanvasLongPressStart(details),
            onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) =>
                widget.policy.onCanvasLongPressMoveUpdate(details),
            onLongPressEnd: (LongPressEndDetails details) =>
                widget.policy.onCanvasLongPressEnd(details),
            onLongPressUp: () => widget.policy.onCanvasLongPressUp(),
          ),
        ),
      ),
    );
  }
}

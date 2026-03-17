import 'package:diagram_editor/src/controller/diagram_controller.dart';
import 'package:diagram_editor/src/model/link_data.dart';
import 'package:diagram_editor/src/painter/link_joint_painter.dart';
import 'package:diagram_editor/src/painter/link_painter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Internal widget that renders a single link and its joints on the canvas.
class LinkWidget<C, L> extends StatelessWidget {
  const LinkWidget({
    required this.controller,
    required this.linkData,
    super.key,
    this.linkWidgetBuilder,
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
  });

  final DiagramController<C, L> controller;
  final LinkData<L> linkData;
  final Widget Function(BuildContext context, LinkData<L> data)?
      linkWidgetBuilder;

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

  @override
  Widget build(BuildContext context) {
    final scale = controller.canvasScale;
    final pos = controller.canvasPosition;

    final scaledPoints =
        linkData.linkPoints.map((point) => point * scale + pos).toList();

    return Listener(
      onPointerSignal: onLinkPointerSignal != null
          ? (event) => onLinkPointerSignal!(linkData.id, event)
          : null,
      child: GestureDetector(
        onTap: onLinkTap != null ? () => onLinkTap!(linkData.id) : null,
        onTapDown: onLinkTapDown != null
            ? (d) => onLinkTapDown!(linkData.id, d)
            : null,
        onTapUp:
            onLinkTapUp != null ? (d) => onLinkTapUp!(linkData.id, d) : null,
        onLongPress: onLinkLongPress != null
            ? () => onLinkLongPress!(linkData.id)
            : null,
        onLongPressStart: onLinkLongPressStart != null
            ? (d) => onLinkLongPressStart!(linkData.id, d)
            : null,
        onLongPressMoveUpdate: onLinkLongPressMoveUpdate != null
            ? (d) => onLinkLongPressMoveUpdate!(linkData.id, d)
            : null,
        onLongPressEnd: onLinkLongPressEnd != null
            ? (d) => onLinkLongPressEnd!(linkData.id, d)
            : null,
        onLongPressUp: onLinkLongPressUp != null
            ? () => onLinkLongPressUp!(linkData.id)
            : null,
        onScaleStart: onLinkScaleStart != null
            ? (d) => onLinkScaleStart!(linkData.id, d)
            : null,
        onScaleUpdate: onLinkScaleUpdate != null
            ? (d) => onLinkScaleUpdate!(linkData.id, d)
            : null,
        onScaleEnd: onLinkScaleEnd != null
            ? (d) => onLinkScaleEnd!(linkData.id, d)
            : null,
        child: CustomPaint(
          painter: LinkPainter(
            linkPoints: scaledPoints,
            scale: scale,
            linkStyle: linkData.linkStyle,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ..._buildJoints(context, scale),
              if (linkWidgetBuilder != null)
                linkWidgetBuilder!(context, linkData),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildJoints(BuildContext context, double scale) {
    final middlePoints =
        linkData.linkPoints.sublist(1, linkData.linkPoints.length - 1);

    return middlePoints.asMap().entries.map((entry) {
      final jointIndex = entry.key + 1; // joints indexed from 1
      final jointPoint = entry.value;

      return Visibility(
        visible: linkData.areJointsVisible,
        child: GestureDetector(
          onTap: onLinkJointTap != null
              ? () => onLinkJointTap!(jointIndex, linkData.id)
              : null,
          onLongPress: onLinkJointLongPress != null
              ? () => onLinkJointLongPress!(jointIndex, linkData.id)
              : null,
          onLongPressStart: onLinkJointLongPressStart != null
              ? (d) => onLinkJointLongPressStart!(jointIndex, linkData.id, d)
              : null,
          onLongPressMoveUpdate: onLinkJointLongPressMoveUpdate != null
              ? (d) =>
                  onLinkJointLongPressMoveUpdate!(jointIndex, linkData.id, d)
              : null,
          onLongPressEnd: onLinkJointLongPressEnd != null
              ? (d) => onLinkJointLongPressEnd!(jointIndex, linkData.id, d)
              : null,
          onLongPressUp: onLinkJointLongPressUp != null
              ? () => onLinkJointLongPressUp!(jointIndex, linkData.id)
              : null,
          onScaleStart: onLinkJointScaleStart != null
              ? (d) => onLinkJointScaleStart!(jointIndex, linkData.id, d)
              : null,
          onScaleUpdate: onLinkJointScaleUpdate != null
              ? (d) => onLinkJointScaleUpdate!(jointIndex, linkData.id, d)
              : null,
          onScaleEnd: onLinkJointScaleEnd != null
              ? (d) => onLinkJointScaleEnd!(jointIndex, linkData.id, d)
              : null,
          child: CustomPaint(
            painter: LinkJointPainter(
              location: controller.toCanvasCoordinates(jointPoint),
              radius: 8,
              scale: scale,
              color: linkData.linkStyle.color.withValues(alpha: 0.5),
            ),
          ),
        ),
      );
    }).toList();
  }
}

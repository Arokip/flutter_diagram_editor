import 'package:diagram_editor/src/abstraction_layer/policy/base/policy_set.dart';
import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:diagram_editor/src/canvas_context/model/link_data.dart';
import 'package:diagram_editor/src/utils/painter/link_joint_painter.dart';
import 'package:diagram_editor/src/utils/painter/link_painter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Link extends StatelessWidget {
  final PolicySet policy;

  /// Widget that connects two [Component]s on the canvas. Another fundamental unit of the diagram.
  const Link({
    Key? key,
    required this.policy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final linkData = Provider.of<LinkData>(context);
    final canvasState = Provider.of<CanvasState>(context);

    LinkPainter linkPainter = LinkPainter(
      linkPoints: (linkData.linkPoints
              .map((point) => point * canvasState.scale + canvasState.position))
          .toList(),
      scale: canvasState.scale,
      linkStyle: linkData.linkStyle,
    );

    return Listener(
      onPointerSignal: (PointerSignalEvent event) =>
          policy.onLinkPointerSignal(context, linkData.id, event),
      child: GestureDetector(
        child: CustomPaint(
          painter: linkPainter,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ...linkData.linkPoints
                  .getRange(1, linkData.linkPoints.length - 1)
                  .map(
                (jointPoint) {
                  var index = linkData.linkPoints.indexOf(jointPoint);
                  return Visibility(
                    visible: linkData.areJointsVisible,
                    child: GestureDetector(
                      onTap: () =>
                          policy.onLinkJointTap(context, index, linkData.id),
                      onTapDown: (TapDownDetails details) =>
                          policy.onLinkJointTapDown(
                              context, index, linkData.id, details),
                      onTapUp: (TapUpDetails details) =>
                          policy.onLinkJointTapUp(
                              context, index, linkData.id, details),
                      onTapCancel: () => policy.onLinkJointTapCancel(
                          context, index, linkData.id),
                      onScaleStart: (ScaleStartDetails details) =>
                          policy.onLinkJointScaleStart(
                              context, index, linkData.id, details),
                      onScaleUpdate: (ScaleUpdateDetails details) =>
                          policy.onLinkJointScaleUpdate(
                              context, index, linkData.id, details),
                      onScaleEnd: (ScaleEndDetails details) =>
                          policy.onLinkJointScaleEnd(
                              context, index, linkData.id, details),
                      onLongPress: () => policy.onLinkJointLongPress(
                          context, index, linkData.id),
                      onLongPressStart: (LongPressStartDetails details) =>
                          policy.onLinkJointLongPressStart(
                              context, index, linkData.id, details),
                      onLongPressMoveUpdate:
                          (LongPressMoveUpdateDetails details) =>
                              policy.onLinkJointLongPressMoveUpdate(
                                  context, index, linkData.id, details),
                      onLongPressEnd: (LongPressEndDetails details) =>
                          policy.onLinkJointLongPressEnd(
                              context, index, linkData.id, details),
                      onLongPressUp: () =>
                          policy.onLinkJointLongPressUp(index, linkData.id),
                      child: CustomPaint(
                        painter: LinkJointPainter(
                          location: canvasState.toCanvasCoordinates(jointPoint),
                          radius: 8,
                          scale: canvasState.scale,
                          color: linkData.linkStyle.color.withOpacity(0.5),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
              ...policy.showWidgetsWithLinkData(context, linkData),
            ],
          ),
        ),
        onTap: () => policy.onLinkTap(context, linkData.id),
        onTapDown: (TapDownDetails details) =>
            policy.onLinkTapDown(context, linkData.id, details),
        onTapUp: (TapUpDetails details) =>
            policy.onLinkTapUp(context, linkData.id, details),
        onTapCancel: () => policy.onLinkTapCancel(context, linkData.id),
        onScaleStart: (ScaleStartDetails details) =>
            policy.onLinkScaleStart(context, linkData.id, details),
        onScaleUpdate: (ScaleUpdateDetails details) =>
            policy.onLinkScaleUpdate(context, linkData.id, details),
        onScaleEnd: (ScaleEndDetails details) =>
            policy.onLinkScaleEnd(context, linkData.id, details),
        onLongPress: () => policy.onLinkLongPress(context, linkData.id),
        onLongPressStart: (LongPressStartDetails details) =>
            policy.onLinkLongPressStart(context, linkData.id, details),
        onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) =>
            policy.onLinkLongPressMoveUpdate(context, linkData.id, details),
        onLongPressEnd: (LongPressEndDetails details) =>
            policy.onLinkLongPressEnd(context, linkData.id, details),
        onLongPressUp: () => policy.onLinkLongPressUp(context, linkData.id),
      ),
    );
  }
}

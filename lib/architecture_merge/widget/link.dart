import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_policy_set.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/link_data.dart';
import 'package:flutter_diagram_editor/architecture_merge/utils/painter/link_joint_painter.dart';
import 'package:flutter_diagram_editor/architecture_merge/utils/painter/link_painter.dart';
import 'package:flutter_diagram_editor/architecture_merge/utils/painter/delete_icon_painter.dart';
import 'package:provider/provider.dart';

class Link extends StatelessWidget {
  final DefaultPolicySet policy;

  const Link({
    Key key,
    this.policy,
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

    return GestureDetector(
      child: CustomPaint(
        painter: linkPainter,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Visibility(
              visible: linkData.isDeleteIconVisible,
              child: GestureDetector(
                onTap: () => policy.onDeleteLinkIconTap(linkData.id),
                child: CustomPaint(
                  painter: DeleteIconPainter(
                    location: linkData.deleteIconPosition * canvasState.scale +
                        canvasState.position,
                    radius: 16,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            ...linkData.linkPoints
                .getRange(1, linkData.linkPoints.length - 1)
                .map(
              (jointPoint) {
                var index = linkData.linkPoints.indexOf(jointPoint);
                return Visibility(
                  visible: linkData.areJointsVisible,
                  child: GestureDetector(
                    onTap: () => policy.onLinkJointTap(index, linkData.id),
                    onTapDown: (TapDownDetails details) =>
                        policy.onLinkJointTapDown(index, linkData.id, details),
                    onTapUp: (TapUpDetails details) =>
                        policy.onLinkJointTapUp(index, linkData.id, details),
                    onTapCancel: () =>
                        policy.onLinkJointTapCancel(index, linkData.id),
                    onScaleStart: (ScaleStartDetails details) => policy
                        .onLinkJointScaleStart(index, linkData.id, details),
                    onScaleUpdate: (ScaleUpdateDetails details) => policy
                        .onLinkJointScaleUpdate(index, linkData.id, details),
                    onScaleEnd: (ScaleEndDetails details) =>
                        policy.onLinkJointScaleEnd(index, linkData.id, details),
                    onLongPress: () =>
                        policy.onLinkJointLongPress(index, linkData.id),
                    onLongPressStart: (LongPressStartDetails details) => policy
                        .onLinkJointLongPressStart(index, linkData.id, details),
                    onLongPressMoveUpdate:
                        (LongPressMoveUpdateDetails details) =>
                            policy.onLinkJointLongPressMoveUpdate(
                                index, linkData.id, details),
                    onLongPressEnd: (LongPressEndDetails details) => policy
                        .onLinkJointLongPressEnd(index, linkData.id, details),
                    onLongPressUp: () =>
                        policy.onLinkJointLongPressUp(index, linkData.id),
                    child: CustomPaint(
                      painter: LinkJointPainter(
                        location: jointPoint * canvasState.scale +
                            canvasState.position,
                        radius: 8,
                        scale: canvasState.scale,
                        color: linkData.linkStyle.color.withOpacity(0.5),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ),
      onTap: () => policy.onLinkTap(linkData.id),
      onTapDown: (TapDownDetails details) =>
          policy.onLinkTapDown(linkData.id, details),
      onTapUp: (TapUpDetails details) =>
          policy.onLinkTapUp(linkData.id, details),
      onTapCancel: () => policy.onLinkTapCancel(linkData.id),
      onScaleStart: (ScaleStartDetails details) =>
          policy.onLinkScaleStart(linkData.id, details),
      onScaleUpdate: (ScaleUpdateDetails details) =>
          policy.onLinkScaleUpdate(linkData.id, details),
      onScaleEnd: (ScaleEndDetails details) =>
          policy.onLinkScaleEnd(linkData.id, details),
      onLongPress: () => policy.onLinkLongPress(linkData.id),
      onLongPressStart: (LongPressStartDetails details) =>
          policy.onLinkLongPressStart(linkData.id, details),
      onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) =>
          policy.onLinkLongPressMoveUpdate(linkData.id, details),
      onLongPressEnd: (LongPressEndDetails details) =>
          policy.onLinkLongPressEnd(linkData.id, details),
      onLongPressUp: () => policy.onLinkLongPressUp(linkData.id),
    );
  }
}

import 'package:diagram_editor/src/abstraction_layer/policy/base/link_delete_policy.dart';
import 'package:diagram_editor/src/utils/painter/delete_icon_painter.dart';
import 'package:flutter/material.dart';

mixin LinkDeleteIconPolicy implements LinkDeletePolicy {
  @override
  onDeleteLinkIconTap(String linkId) {
    canvasWriter.model.removeLink(linkId);
  }

  @override
  CustomPainter deleteIconPainter(Offset location) {
    return DeleteIconPainter(
      location: location,
      radius: 12,
      color: Colors.red,
    );
  }
}

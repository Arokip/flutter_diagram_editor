import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/policy_set.dart';

mixin DefaultLinkPolicy on PolicySet {
  onLinkTap(String linkId) {}

  onLinkTapDown(String linkId, TapDownDetails details) {}

  onLinkTapUp(String linkId, TapUpDetails details) {}

  onLinkTapCancel(String linkId) {}

  onLinkScaleStart(String linkId, ScaleStartDetails details) {}

  onLinkScaleUpdate(String linkId, ScaleUpdateDetails details) {}

  onLinkScaleEnd(String linkId, ScaleEndDetails details) {}

  onLinkLongPress(String linkId) {}

  onLinkLongPressStart(String linkId, LongPressStartDetails details) {}

  onLinkLongPressMoveUpdate(
      String linkId, LongPressMoveUpdateDetails details) {}

  onLinkLongPressEnd(String linkId, LongPressEndDetails details) {}

  onLinkLongPressUp(String linkId) {}

  onDeleteLinkIconTap(String linkId) {}
}

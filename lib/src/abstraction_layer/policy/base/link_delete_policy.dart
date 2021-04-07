import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/material.dart';

mixin LinkDeletePolicy on BasePolicySet {
  onDeleteLinkIconTap(String linkId) {}

  CustomPainter deleteIconPainter(Offset location) {
    return null;
  }
}

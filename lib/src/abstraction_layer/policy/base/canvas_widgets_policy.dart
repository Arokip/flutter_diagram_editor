import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/material.dart';

mixin CanvasWidgetsPolicy on BasePolicySet {
  List<Widget> showCustomWidgetsOnCanvasBackground(BuildContext context) {
    return [];
  }

  List<Widget> showCustomWidgetsOnCanvasForeground(BuildContext context) {
    return [];
  }
}

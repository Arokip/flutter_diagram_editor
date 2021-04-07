import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:diagram_editor/src/canvas_context/model/link_data.dart';
import 'package:flutter/material.dart';

mixin LinkWidgetsPolicy on BasePolicySet {
  List<Widget> showCustomWidgetWithLinkData(
      BuildContext context, LinkData linkData) {
    return [];
  }
}

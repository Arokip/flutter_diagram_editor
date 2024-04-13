import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:diagram_editor/src/canvas_context/model/link_data.dart';
import 'package:flutter/material.dart';

/// Allows you to add any widget to a link.
mixin LinkWidgetsPolicy on BasePolicySet {
  /// Allows you to add any widget to a link.
  ///
  /// You have [LinkData] here so you can customize the widgets to individual link.
  ///
  /// Recommendation: use Positioned as the root widget.
  List<Widget> showWidgetsWithLinkData(
    BuildContext context,
    LinkData linkData,
  ) {
    return [];
  }
}

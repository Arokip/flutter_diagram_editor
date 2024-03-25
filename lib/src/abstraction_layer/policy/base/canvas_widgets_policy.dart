import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:flutter/material.dart';

/// Allows you to add any widget to the canvas.
mixin CanvasWidgetsPolicy on BasePolicySet {
  /// Allows you to add any widget to the canvas.
  ///
  /// The widgets will be displayed under all components and links.
  ///
  /// Recommendation: use Positioned as the root widget.
  List<Widget> showCustomWidgetsOnCanvasBackground(BuildContext context) {
    return [];
  }

  /// Allows you to add any widget to the canvas.
  ///
  /// The widgets will be displayed over all components and links.
  ///
  /// Recommendation: use Positioned as the root widget.
  List<Widget> showCustomWidgetsOnCanvasForeground(BuildContext context) {
    return [];
  }

  /// Allows you to change whether to display links in front of components or vice versa.
  bool displayLinksInFrontOfComponents() {return true;}
}

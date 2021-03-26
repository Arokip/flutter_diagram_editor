import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/policy_set.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/component_data.dart';

mixin DefaultCanvasStackWidgetsPolicy on PolicySet {
  /// Each widget should start with Positioned
  List<Widget> showCustomWidgetsOnCanvas() {
    return [];
  }

  Widget showCustomWidgetOnCanvasWithComponentData(
      ComponentData componentData) {
    return SizedBox.shrink();
  }
}

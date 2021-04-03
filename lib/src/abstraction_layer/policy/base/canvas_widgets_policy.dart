import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:flutter/material.dart';

mixin CanvasWidgetsPolicy on BasePolicySet {
  List<Widget> showCustomWidgetsOnCanvasBackground(BuildContext context) {
    return [];
  }

  List<Widget> showCustomWidgetsOnCanvasForeground(BuildContext context) {
    return [];
  }

  Widget showCustomWidgetWithComponentDataUnder(ComponentData componentData) {
    return SizedBox.shrink();
  }

  Widget showCustomWidgetWithComponentData(ComponentData componentData) {
    return SizedBox.shrink();
  }

  Widget showCustomWidgetWithComponentDataOver(ComponentData componentData) {
    return SizedBox.shrink();
  }
}

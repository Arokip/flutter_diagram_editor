import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:flutter/material.dart';

mixin ComponentWidgetsPolicy on BasePolicySet {
  Widget showCustomWidgetWithComponentDataUnder(
      BuildContext context, ComponentData componentData) {
    return SizedBox.shrink();
  }

  Widget showCustomWidgetWithComponentData(
      BuildContext context, ComponentData componentData) {
    return SizedBox.shrink();
  }

  Widget showCustomWidgetWithComponentDataOver(
      BuildContext context, ComponentData componentData) {
    return SizedBox.shrink();
  }
}

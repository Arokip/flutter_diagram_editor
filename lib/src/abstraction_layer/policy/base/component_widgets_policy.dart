import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:flutter/material.dart';

/// Allows you to add any widget to a component.
mixin ComponentWidgetsPolicy on BasePolicySet {
  /// Allows you to add any widget to a component.
  ///
  /// These widgets will be displayed under all components.
  ///
  /// You have [ComponentData] here so you can customize the widgets to individual component.
  Widget showCustomWidgetWithComponentDataUnder(
    BuildContext context,
    ComponentData componentData,
  ) {
    return const SizedBox.shrink();
  }

  /// Allows you to add any widget to a component.
  ///
  /// These widgets will have the same z-order as this component and will be displayed over this component.
  ///
  /// You have [ComponentData] here so you can customize the widgets to individual component.
  Widget showCustomWidgetWithComponentData(
    BuildContext context,
    ComponentData componentData,
  ) {
    return const SizedBox.shrink();
  }

  /// Allows you to add any widget to a component.
  ///
  /// These widgets will be displayed over all components.
  ///
  /// You have [ComponentData] here so you can customize the widgets to individual component.
  Widget showCustomWidgetWithComponentDataOver(
    BuildContext context,
    ComponentData componentData,
  ) {
    return const SizedBox.shrink();
  }
}

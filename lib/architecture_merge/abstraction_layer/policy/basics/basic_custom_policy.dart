import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_policy_set.dart';

mixin CustomStatePolicy {
  int custom = 0;
  String selectedComponentId;

  String selectedLinkId;
}

mixin CustomBehaviourPolicy implements DefaultPolicySet, CustomStatePolicy {
  removeAll() {
    print('custom butt: ${custom++}');
    canvasWriter.model.removeAllComponents();
  }

  resetView() {
    print('custom butt: ${custom++}');
    canvasWriter.state.resetCanvasView();
  }

  removeLink(String linkId) {
    if (linkId != null) {
      canvasWriter.model.removeLink(linkId);
    }
  }
}

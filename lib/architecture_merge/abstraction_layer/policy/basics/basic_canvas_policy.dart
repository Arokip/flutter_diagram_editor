import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/basics/basic_custom_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_canvas_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/component_data.dart';
import 'package:flutter_diagram_editor/architecture_merge/widget/body/rect_widget_body.dart';
import 'package:uuid/uuid.dart';

mixin BasicCanvasPolicy implements DefaultCanvasPolicy, CustomStatePolicy {
  onCanvasTap() {
    print('canvas tapped');
    print('custom canvas: ${custom++}');
    selectedComponentId = null;

    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.hideAllComponentHighlights();
    canvasWriter.model.hideAllDeleteIcons();
    selectedLinkId = null;
  }

  onCanvasTapUp(TapUpDetails details) {
    print('canvas tapped at: ${details.localPosition}');
    canvasWriter.model.addComponent(
      ComponentData(
        position:
            canvasReader.state.fromCanvasCoordinates(details.localPosition),
        size: Size(
          math.Random().nextInt(120) + 80.0,
          math.Random().nextInt(80) + 80.0,
        ),
        componentBodyName: 'rect',
        customData: RectCustomData(
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
          text: 'custom text',
        ),
      ),
    );
  }

  @override
  onCanvasTapDown(TapDownDetails details) {
    print('canvas tap down');
  }
}

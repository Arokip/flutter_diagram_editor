import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/component_option.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/component_options_data.dart';
import 'package:provider/provider.dart';

class ComponentOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var componentData = Provider.of<ComponentData>(context);
    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var componentOptionMap =
        context.select<CanvasModel, HashMap<String, ComponentOptionData>>(
            (CanvasModel model) => model.componentOptionMap);

    return Positioned(
      left: canvasScale *
              (componentData.position.dx + componentData.portSize / 2) +
          canvasPosition.dx -
          componentData.optionSize / 2,
      top: canvasScale * componentData.position.dy +
          canvasPosition.dy -
          componentData.optionSize,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(height: componentData.optionSize, width: 0),
                  ...componentData.topOptions.map(
                    (optionName) => Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ComponentOption(
                        componentId: componentData.id,
                        optionSize: componentData.optionSize,
                        option: componentOptionMap[optionName],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: (componentData.size.height + componentData.portSize) *
                    canvasScale,
              ),
              Row(
                children: [
                  ...componentData.bottomOptions.map(
                    (optionName) => Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ComponentOption(
                        componentId: componentData.id,
                        optionSize: componentData.optionSize,
                        option: componentOptionMap[optionName],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

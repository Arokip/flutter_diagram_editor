import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component_option.dart';
import 'highlight.dart';
import 'model/canvas_model.dart';
import 'model/component_data.dart';

class ComponentOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var componentData = Provider.of<ComponentData>(context);
    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);

    return Positioned(
      left: canvasScale *
              (componentData.position.dx + componentData.portSize / 2) +
          canvasPosition.dx -
          componentData.optionsData.optionSize / 2,
      top: canvasScale * componentData.position.dy +
          canvasPosition.dy -
          componentData.optionsData.optionSize,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                      height: componentData.optionsData.optionSize, width: 0),
                  ...componentData.optionsData.optionsTop.map(
                    (option) => Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ComponentOption(
                        componentId: componentData.id,
                        optionSize: componentData.optionsData.optionSize,
                        option: option,
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
                  ...componentData.optionsData.optionsBottom.map(
                    (option) => Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ComponentOption(
                        componentId: componentData.id,
                        optionSize: componentData.optionsData.optionSize,
                        option: option,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Highlight(
            position: Offset(
                componentData.optionsData.optionSize / 2,
                componentData.optionsData.optionSize +
                    (componentData.portSize / 2) * canvasScale),
            width: componentData.size.width * canvasScale,
            height: componentData.size.height * canvasScale,
          ),
        ],
      ),
    );
  }
}

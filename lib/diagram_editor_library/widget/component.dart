import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_body.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/port.dart';
import 'package:provider/provider.dart';

class Component extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var componentBodyMap =
        context.select<CanvasModel, HashMap<String, ComponentBody>>(
            (CanvasModel model) => model.componentBodyMap);
    var canvasSelectItem = context
        .select<CanvasModel, Function>((CanvasModel model) => model.selectItem);
    var deselectIfLinkSelected = context.select<CanvasModel, Function>(
        (CanvasModel model) => model.deselectIfLinkSelected);
    var isMultipleSelectionOn = context.select<CanvasModel, bool>(
        (CanvasModel model) => model.isMultipleSelectionOn);
    var addToMultipleSelection = context.select<CanvasModel, Function>(
        (CanvasModel model) => model.addToMultipleSelection);
    var componentData = Provider.of<ComponentData>(context);
    var updateLinkMap = context.select<CanvasModel, Function>(
        (CanvasModel model) => model.updateLinkMap);
    var moveSelectedComponents = context.select<CanvasModel, Function>(
        (CanvasModel model) => model.moveSelectedComponents);

    return Positioned(
      left: canvasScale * componentData.position.dx + canvasPosition.dx,
      top: canvasScale * componentData.position.dy + canvasPosition.dy,
      child: GestureDetector(
        onTap: () {
          canvasSelectItem(componentData);
        },
        onPanStart: (_) {
          deselectIfLinkSelected();
        },
        onPanUpdate: (details) {
          if (isMultipleSelectionOn) {
            addToMultipleSelection(componentData.id);
            moveSelectedComponents(details.delta / canvasScale);
          } else {
            componentData
                .updateComponentDataPosition(details.delta / canvasScale);
            updateLinkMap(componentData.id);
          }
        },
        child: Stack(
          // fit: StackFit.expand,
          children: [
            SizedBox(
              width: canvasScale *
                  (componentData.size.width + componentData.portSize),
              height: canvasScale *
                  (componentData.size.height + componentData.portSize),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // component body:
                  SizedBox(
                    width: canvasScale * componentData.size.width,
                    height: canvasScale * componentData.size.height,
                    child: componentBodyMap[componentData.componentBodyName]
                        .componentBody,
                  ),

                  // ports:
                  ...showPorts(componentData),
                ],
              ),
            ),
            Visibility(
              visible: componentData.enableResize,
              child: Stack(
                children: [
                  SizedBox(
                    width: (componentData.size.width + componentData.portSize) *
                        canvasScale,
                    height:
                        (componentData.size.height + componentData.portSize) *
                            canvasScale,
                  ),
                  resizeCorner(componentData, updateLinkMap, canvasScale,
                      componentData.minSize.shortestSide),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget resizeCorner(ComponentData componentData, Function updateLinkMap,
      double scale, double size) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: GestureDetector(
        onPanUpdate: (d) {
          componentData.resize(d.delta / scale);

          updateLinkMap(
            componentData.id,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.0 * scale,
              color: Colors.black,
            ),
          ),
          width: size * scale,
          height: size * scale,
          child: Center(
            child: Transform.rotate(
              angle: pi / 2,
              child: Icon(
                Icons.open_in_full,
                size: size / 2 * scale,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> showPorts(ComponentData componentData) {
    return componentData.ports.values
        .map(
          (portData) => Port(
            portData: portData,
            size: componentData.portSize,
          ),
        )
        .toList();
  }
}

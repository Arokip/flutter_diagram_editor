import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/item_selected.dart';
import 'package:provider/provider.dart';

import 'model/canvas_model.dart';
import 'model/component_data.dart';
import 'port.dart';

class Component extends StatelessWidget with ItemSelected {
  @override
  Widget build(BuildContext context) {
    // print('COMPONENT build');
    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var canvasSelectItem = context
        .select<CanvasModel, Function>((CanvasModel model) => model.selectItem);
    var isMultipleSelectionOn = context.select<CanvasModel, bool>(
        (CanvasModel model) => model.isMultipleSelectionOn);
    var addOrRemoveToMultipleSelection = context.select<CanvasModel, Function>(
        (CanvasModel model) => model.addOrRemoveToMultipleSelection);
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
          if (isMultipleSelectionOn) {
            addOrRemoveToMultipleSelection(componentData.id);
          } else {
            canvasSelectItem(componentData);
          }
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
                  ComponentBody(
                    componentData: componentData,
                    canvasScale: canvasScale,
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
            componentData,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: componentData.color,
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
}

class ComponentBody extends StatelessWidget {
  const ComponentBody({
    Key key,
    @required this.componentData,
    @required this.canvasScale,
  }) : super(key: key);

  final ComponentData componentData;
  final double canvasScale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showEditComponent(context, componentData);
      },
      child: Container(
        width: canvasScale * componentData.size.width,
        height: canvasScale * componentData.size.height,
        child: Center(
          child: Text(
            '${componentData.customData.title}',
            style: TextStyle(fontSize: 16 * canvasScale),
            maxLines: 1,
          ),
        ),
        decoration: BoxDecoration(
          color: componentData.color,
          border: Border.all(
            width: 2.0 * canvasScale,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

void showEditComponent(BuildContext context, ComponentData componentData) {
  final titleController = TextEditingController(
      text: componentData.customData.title ?? 'fail null');
  final descriptionController = TextEditingController(
      text: componentData.customData.description ?? 'fail null');

  disposeControllers() {
    titleController.dispose();
    descriptionController.dispose();
  }

  showDialog(
    barrierDismissible: false,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          children: [
            SizedBox(width: 600),
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
            Container(
              color: Colors.purple,
              child: Text('whatever'),
            ),
            TextField(
              controller: titleController,
              maxLines: 1,
              decoration: InputDecoration(
                // hintText: 'Find Group',
                labelText: 'Title',
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 13),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              textInputAction: TextInputAction.newline,
              maxLines: null,
              decoration: InputDecoration(
                // hintText: 'Find Group',
                labelText: 'Description',
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 13),
              ),
            ),
          ],
        ),
        scrollable: true,
        actions: [
          FlatButton(
            onPressed: () {
              // disposeControllers();
              Navigator.of(context).pop();
            },
            child: Text('DISCARD'),
          ),
          FlatButton(
            onPressed: () {
              componentData.customData.title = titleController.text;
              componentData.customData.description = descriptionController.text;
              componentData.componentNotifyListeners();
              // disposeControllers();
              Navigator.of(context).pop();
            },
            child: Text('SAVE'),
          )
        ],
      );
    },
  );
}

List<Widget> showPorts(ComponentData componentData) {
  return componentData.ports.values
      .map((portData) => Port(
            portData: portData,
            size: componentData.portSize,
          ))
      .toList();
}

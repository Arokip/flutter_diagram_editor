import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/canvas.dart';
import 'package:flutter_provider_canvas/delete_all_button.dart';
import 'package:flutter_provider_canvas/menu.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_body.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/component_options_data.dart';
import 'package:flutter_provider_canvas/model/custom_component_data.dart';
import 'package:flutter_provider_canvas/model/multiple_selection_option_data.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';
import 'package:flutter_provider_canvas/multiple_selection_switch_button.dart';
import 'package:flutter_provider_canvas/remove_all_connections_button.dart';
import 'package:flutter_provider_canvas/reset_view_button.dart';
import 'package:flutter_provider_canvas/user/component/component_body_1.dart';
import 'package:flutter_provider_canvas/user/component/component_body_2.dart';
import 'package:provider/provider.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  CanvasModel model = CanvasModel();

  @override
  void initState() {
    super.initState();
    initializeModel();
  }

  initializeModel() {
    fillWithBodies(model);
    generatePortRules(model);
    model.menuData.addComponentToMenu(generateComponent(model, 'body1'));
    model.menuData.addComponentToMenu(generateComponent(model, 'body1'));
    model.menuData.addComponentToMenu(generateComponent(model, 'body2'));
    addMultipleSelectedOptions(model);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CanvasModel>.value(
      value: model,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.blueGrey,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: DiagramEditorCanvas(),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(2, 8, 0, 8),
            alignment: Alignment.centerLeft,
            child: Container(
              width: 80,
              height: 400,
              color: Colors.black.withOpacity(0.24),
              child: DiagramEditorMenu(
                  // scrollDirection: Axis.horizontal,
                  ),
            ),
          ),
          Positioned(
            left: 24,
            bottom: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ResetViewButton(),
                SizedBox(width: 8),
                MultipleSelectionSwitchButton(
                  openDirection: OpenDirection.top,
                ),
                SizedBox(width: 8),
                DeleteAllButton(),
                SizedBox(width: 8),
                RemoveAllConnectionsButton(),
              ],
            ),
          ),
          // DEBUG:
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              color: Colors.grey,
              child: Consumer<CanvasModel>(
                builder: (_, canvasData, __) {
                  return Text(
                      'l:${canvasData.componentDataMap.length}, p:${canvasData.position}, s:${canvasData.scale}');
                },
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            right: 16,
            child: Container(
              color: Colors.grey,
              child: Consumer<CanvasModel>(
                builder: (_, canvasData, __) {
                  return Text(
                      'port rules:\n${canvasData.portRules.rules}\nmax ${canvasData.portRules.maxConnectionCount}');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

fillWithBodies(CanvasModel model) {
  model.addNewComponentBody(
    "body1",
    ComponentBody(
      menuComponentBody: MenuComponentBodyWidget1(),
      componentBody: ComponentBodyWidget1(),
    ),
  );
  model.addNewComponentBody(
    "body2",
    ComponentBody(
      menuComponentBody: MenuComponentBodyWidget2(),
      componentBody: ComponentBodyWidget2(),
    ),
  );
}

ComponentData generateComponent(CanvasModel model, String name) {
  var id = math.Random().nextInt(10000);
  return ComponentData(
    id: id,
    // TODO: id
    size: Size(120, 80),
    portSize: 20,
    portList: [
      PortData(
        id: 1,
        // TODO: id
        componentId: id,
        // TODO: id
        color: Colors.red,
        borderColor: Colors.white,
        alignment: Alignment(1, 0),
        portType: 'A',
      )
    ],
    optionsData: ComponentOptionsData(
      optionSize: 40,
      optionsTop: [
        ComponentOptionData(
          color: Colors.lime,
          icon: Icons.map,
          tooltip: "map",
          onOptionTap: (cid) {
            print('map tap: $cid');
          },
        ),
        ComponentOptionData(),
        ComponentOptionData(tooltip: "nothing"),
      ],
      optionsBottom: [
        ComponentOptionData(
          color: Colors.red,
          icon: Icons.delete_forever,
          tooltip: "Delete",
          onOptionTap: (cid) {
            model.removeComponentFromList(cid);
            print('remove component: $cid');
          },
        ),
        ComponentOptionData(
          color: Colors.yellow,
          icon: Icons.copy,
          tooltip: "Duplicate",
          onOptionTap: (cid) {
            model.duplicateComponentBelow(cid, Offset(0, 24));
            print('duplicate component: $cid');
          },
        ),
        ComponentOptionData(
          color: Colors.deepPurple,
          icon: Icons.link_off,
          tooltip: "Remove all connections",
          onOptionTap: (cid) {
            model.removeComponentConnections(cid);
            print('remove connections: $cid');
          },
        ),
        ComponentOptionData(
          color: Colors.deepOrange,
          icon: Icons.aspect_ratio,
          tooltip: "Resize",
          onOptionTap: (cid) {
            model.resizeComponent(cid);
            print('resize: $cid');
          },
        )
      ],
    ),
    customData: CustomComponentData(
      title: 'random title',
      description: 'loooong description',
    ),
    componentBodyName: name,
  );
}

generatePortRules(CanvasModel model) {
  model.portRules.addRule("0", "1");
  model.portRules.addRule("0", "0");
  model.portRules.addRule("1", "1");
  model.portRules.addRules("2", ["0", "1"]);

  // portRules.canConnectSameComponent = true;

  model.portRules.setMaxConnectionCount("0", 2);
}

addMultipleSelectedOptions(CanvasModel model) {
  model.addMultipleSelectionOption(
    MultipleSelectionOptionData(
      icon: Icons.link_off,
      tooltip: "Delete connections",
      onOptionTap: model.removeSelectedConnections,
    ),
  );
  model.addMultipleSelectionOption(
    MultipleSelectionOptionData(
      icon: Icons.delete_forever,
      tooltip: "Delete",
      onOptionTap: model.removeSelectedComponents,
    ),
  );
  model.addMultipleSelectionOption(
    MultipleSelectionOptionData(
      icon: Icons.copy,
      tooltip: "Duplicate",
      onOptionTap: model.duplicateSelectedComponents,
    ),
  );
  model.addMultipleSelectionOption(
    MultipleSelectionOptionData(
      icon: Icons.all_inclusive,
      tooltip: "Select all",
      onOptionTap: model.selectAllComponents,
    ),
  );
}

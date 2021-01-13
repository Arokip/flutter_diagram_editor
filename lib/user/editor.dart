import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_provider_canvas/canvas.dart';
import 'package:flutter_provider_canvas/delete_all_button.dart';
import 'package:flutter_provider_canvas/hide_menu_button.dart';
import 'package:flutter_provider_canvas/load_diagram_from_graphml_button.dart';
import 'package:flutter_provider_canvas/menu.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_body.dart';
import 'package:flutter_provider_canvas/model/multiple_selection_option_data.dart';
import 'package:flutter_provider_canvas/multiple_selection_switch_button.dart';
import 'package:flutter_provider_canvas/remove_all_connections_button.dart';
import 'package:flutter_provider_canvas/reset_view_button.dart';
import 'package:flutter_provider_canvas/save_as_graphml_button.dart';
import 'package:flutter_provider_canvas/save_as_image_button.dart';
import 'package:flutter_provider_canvas/user/component/component_1.dart';
import 'package:flutter_provider_canvas/user/component/component_2.dart';
import 'package:flutter_provider_canvas/user/component/component_3.dart';
import 'package:flutter_provider_canvas/user/component/component_common.dart';
import 'package:flutter_provider_canvas/user/component/component_crystal.dart';
import 'package:flutter_provider_canvas/user/component/component_oval.dart';
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
    fillWithOptions(model);

    model.selectedPortColor = Colors.cyanAccent;
    model.otherPortsColor = Colors.teal;
    model.componentHighLightColor = Colors.deepOrange;

    model.menuData.addComponentsToMenu([
      generateComponentCrystal(model),
      generateComponentOval(model),
      generateComponent1(model),
      generateComponent2(model, context),
      generateComponent3(model),
    ]);
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
          Consumer(builder: (_, CanvasModel canvasModel, __) {
            return canvasModel.isTakingImage
                ? Container(
                    alignment: Alignment.center,
                    color: Colors.black.withOpacity(0.5),
                    child: CircularProgressIndicator(),
                  )
                : SizedBox.shrink();
          }),
          Consumer(
            builder: (_, CanvasModel canvasModel, __) {
              return Visibility(
                visible: canvasModel.menuData.isMenuVisible,
                child: Container(
                  margin: EdgeInsets.fromLTRB(2, 8, 0, 8),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 96,
                    height: 400,
                    color: Colors.black.withOpacity(0.24),
                    child: DiagramEditorMenu(
                        // scrollDirection: Axis.horizontal,
                        ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 24,
            bottom: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    HideMenuButton(),
                    SizedBox(height: 8),
                    SaveAsImageButton(),
                    SizedBox(height: 8),
                    ResetViewButton(),
                  ],
                ),
                SizedBox(width: 8),
                MultipleSelectionSwitchButton(
                  openDirection: OpenDirection.top,
                  options: [
                    MultipleSelectionOptionData(
                      icon: Icons.link_off,
                      tooltip: "Delete connections",
                      onOptionTap: model.removeSelectedConnections,
                    ),
                    MultipleSelectionOptionData(
                      icon: Icons.delete_forever,
                      tooltip: "Delete",
                      onOptionTap: model.removeSelectedComponents,
                    ),
                    MultipleSelectionOptionData(
                      icon: Icons.copy,
                      tooltip: "Duplicate",
                      onOptionTap: model.duplicateSelectedComponents,
                    ),
                    MultipleSelectionOptionData(
                      icon: Icons.all_inclusive,
                      tooltip: "Select all",
                      onOptionTap: model.selectAllComponents,
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    LoadDiagramFromGraphmlButton(),
                    SizedBox(height: 8),
                    SaveAsGraphmlButton(),
                    SizedBox(height: 8),
                    DeleteAllButton(),
                  ],
                ),
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
  model.addNewComponentBody(
    "body3",
    ComponentBody(
      menuComponentBody: MenuComponentBodyWidget3(),
      componentBody: ComponentBodyWidget3(),
    ),
  );
  model.addNewComponentBody(
    "body oval",
    ComponentBody(
      menuComponentBody: MenuComponentBodyWidgetOval(),
      componentBody: ComponentBodyWidgetOval(),
    ),
  );
  model.addNewComponentBody(
    "body crystal",
    ComponentBody(
      menuComponentBody: MenuComponentBodyWidgetCrystal(),
      componentBody: ComponentBodyWidgetCrystal(),
    ),
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

fillWithOptions(CanvasModel model) {
  ComponentCommon.optionsData(model).forEach((optionName, optionData) {
    model.addNewComponentOption(optionName, optionData);
  });
}

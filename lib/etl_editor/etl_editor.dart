import 'package:flutter_diagram_editor/etl_editor/component/component_rect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_diagram_editor/diagram_editor/button/delete_all_button.dart';
import 'package:flutter_diagram_editor/diagram_editor/button/hide_menu_button.dart';
import 'package:flutter_diagram_editor/diagram_editor/button/load_diagram_from_graphml_button.dart';
import 'package:flutter_diagram_editor/diagram_editor/button/multiple_selection_switch_button.dart';
import 'package:flutter_diagram_editor/diagram_editor/button/remove_all_connections_button.dart';
import 'package:flutter_diagram_editor/diagram_editor/button/reset_view_button.dart';
import 'package:flutter_diagram_editor/diagram_editor/button/save_as_graphml_button_mobile.dart'
    if (dart.library.html) 'package:flutter_diagram_editor/diagram_editor/button/save_as_graphml_button_web.dart';
import 'package:flutter_diagram_editor/diagram_editor/button/save_as_image_button.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_option_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/multiple_selection_option_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/canvas.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/menu.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_json/etl_editor_loader.dart';
import 'package:provider/provider.dart';

class EtlEditor extends StatefulWidget {
  @override
  _EtlEditorState createState() => _EtlEditorState();
}

class _EtlEditorState extends State<EtlEditor> {
  CanvasModel model = CanvasModel();

  EtlEditorLoader etlEditorLoader = EtlEditorLoader();

  String diagramName = '';
  String diagramUrl = '';

  Future<bool> isComponentSetLoading;
  Future<bool> isDiagramLoading;

  final pipelineUrlController = TextEditingController(
      text:
          // 'https://demo.etl.linkedpipes.com/resources/pipelines/created-1519816576397');
          // 'https://demo.etl.linkedpipes.com/resources/pipelines/created-1497543801843');
          // 'https://demo.etl.linkedpipes.com/resources/pipelines/created-1468331256943');
          // 'https://demo.etl.linkedpipes.com/resources/pipelines/created-1468324550431'); // red comps
          'https://demo.etl.linkedpipes.com/resources/pipelines/1560425451529');

  @override
  void initState() {
    super.initState();
    initializeModel();
  }

  initializeModel() {
    model.addNewComponentOption(
        'delete',
        ComponentOptionData(
          color: Colors.red,
          icon: Icons.delete_forever,
          tooltip: "Delete",
          onOptionTap: (cid) {
            model.removeComponent(cid);
            print('remove component: $cid');
          },
        ));
    model.addNewComponentOption(
        'duplicate',
        ComponentOptionData(
          color: Colors.yellow,
          icon: Icons.copy,
          tooltip: "Duplicate",
          onOptionTap: (cid) {
            model.duplicateComponentBelow(cid, Offset(0, 24));
            print('duplicate component: $cid');
          },
        ));
    model.addNewComponentOption(
        'edit',
        ComponentOptionData(
          color: Colors.lightGreen,
          icon: Icons.edit,
          tooltip: "Edit",
          onOptionTap: (cid) {
            showEditComponentDialog(context, model.getComponentData(cid));
            print('edit component: $cid');
          },
        ));
    isComponentSetLoading = etlEditorLoader.loadComponentSet(model);
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
                    child: Center(
                      child: FutureBuilder<bool>(
                        future: isComponentSetLoading,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return DiagramEditorMenu(
                                // scrollDirection: Axis.horizontal,
                                );
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          }
                          return CircularProgressIndicator();
                        },
                      ),
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
                      onOptionTap: model.multipleSelection.removeConnections,
                    ),
                    MultipleSelectionOptionData(
                      icon: Icons.delete_forever,
                      tooltip: "Delete",
                      onOptionTap: model.multipleSelection.removeComponents,
                    ),
                    MultipleSelectionOptionData(
                      icon: Icons.copy,
                      tooltip: "Duplicate",
                      onOptionTap: model.multipleSelection.duplicateComponents,
                    ),
                    MultipleSelectionOptionData(
                      icon: Icons.all_inclusive,
                      tooltip: "Select all",
                      onOptionTap: model.multipleSelection.selectAllComponents,
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
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   left: 0,
          //   top: 0,
          //   child: Center(
          //     child: FutureBuilder<bool>(
          //       future: isDiagramLoading,
          //       builder: (context, snapshot) {
          //         if (snapshot.hasData) {
          //           return SizedBox.shrink();
          //         } else if (snapshot.hasError) {
          //           return Text("Error: ${snapshot.error}");
          //         }
          //         return CircularProgressIndicator();
          //       },
          //     ),
          //   ),
          // ),
          Positioned(
            right: 24,
            top: 24,
            child: Column(children: [
              Container(
                width: 320,
                height: 64,
                child: TextField(
                  controller: pipelineUrlController,
                  decoration: InputDecoration(
                    labelText: 'Pipeline URL',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  model.removeAllComponents();
                  etlEditorLoader.loadPipeline(
                      model, pipelineUrlController.text);
                  print('load button');
                },
                child: Text('LOAD'),
              ),
            ]),
          ),
          Positioned(
            bottom: 24,
            right: 24,
            child: Container(
              color: Colors.grey[200],
              child: Text('hint: long press on component to edit'),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, size: 16),
                  SizedBox(width: 8),
                  Text('BACK TO MENU'),
                ],
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

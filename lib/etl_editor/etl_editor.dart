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
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_body.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_option_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/multiple_selection_option_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/canvas.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/menu.dart';
import 'package:flutter_diagram_editor/etl_editor/component/component_rect.dart';
import 'package:flutter_diagram_editor/etl_editor/elt_diagram_graph.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_components_list.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_http_get.dart';
import 'package:flutter_diagram_editor/etl_editor/mock_etl_data.dart';
import 'package:provider/provider.dart';

class EtlEditor extends StatefulWidget {
  @override
  _EtlEditorState createState() => _EtlEditorState();
}

class _EtlEditorState extends State<EtlEditor> {
  CanvasModel model = CanvasModel();

  @override
  void initState() {
    super.initState();
    initializeModel();
  }

  getPipelineJson() async {
    EtlHttpGet etlHttpGet = EtlHttpGet();

    String pipelineString = '1611664269714';
    String baseUrl = 'demo.etl.linkedpipes.com';

    // String pipeline = await etlHttpGet.fetchPipeline(
    //     Uri.https(baseUrl, 'resources/pipelines/$pipelineString').toString());

    String pipeline = MockEtlData.pipelineJson;
    String components = MockEtlData.componentsJson;

    var ecj = EtlComponentsJsonObject(
      etlJson: components,
    );
    var gc = ecj.graphList;

    gc.forEach((graph) {
      EtlJarTemplateItem template;
      List<EtlPortItem> ports = [];
      graph.graphItems.forEach((item) {
        if (item is EtlJarTemplateItem) {
          template = item;
        } else if (item is EtlPortItem) {
          model.portRules.addRule(
            item.portType + EtlPortItemType.output.toString(),
            item.portType + EtlPortItemType.input.toString(),
          );
          ports.add(item);
        }
      });

      if (template == null) {
        print('template is null because nonJar template TODO');
      } else {
        model.addNewComponentBody(
          template.id,
          ComponentBody(
            menuComponentBody: MenuComponentBodyRect(
              template: template,
            ),
            componentBody: ComponentBodyRect(
              template: template,
            ),
            fromJsonCustomData: (json) =>
                RectCustomComponentData.fromJson(json),
          ),
        );
        model.menuData.addComponentsToMenu([
          generateComponentRect(
            model: model,
            ports: ports,
            template: template,
          ),
        ]);
      }
    });

    print('====');
    //
    var edj = EtlDiagramJsonObject(
      etlJson: pipeline,
      pipelineUrlId:
          // 'https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714',
          // 'https://demo.etl.linkedpipes.com/resources/pipelines/created-1517825741149',
          'https://demo.etl.linkedpipes.com/resources/pipelines/created-1524160642014',
    );

    var g = edj.getEtlGraph();

    g.graphItems.forEach((item) {
      if (item is EtlComponentItem) {
        var a = ecj.getComponentGraphFromTemplateId(item.template);

        if (a == null) {
          print('a == null (template w/o jar): ${item.template}');
        } else {
          EtlJarTemplateItem template;
          List<EtlPortItem> ports = [];
          a.graphItems.forEach((item) {
            if (item is EtlJarTemplateItem) {
              template = item;
            } else if (item is EtlPortItem) {
              ports.add(item);
            }
          });

          model.addComponent(
            generateComponentRect(
              model: model,
              template: template,
              ports: ports,
              position: Offset(item.x, item.y),
              size: Size(120, 80),
            ),
          );
        }
      }
    });
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

    getPipelineJson();
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
            top: 8,
            left: 8,
            child: RaisedButton(
              child: Row(
                children: [
                  Icon(Icons.arrow_back, size: 16),
                  SizedBox(width: 8),
                  Text('BACK TO MENU'),
                ],
              ),
              color: Colors.blue,
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

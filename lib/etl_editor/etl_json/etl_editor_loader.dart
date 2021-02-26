import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_body.dart';
import 'package:flutter_diagram_editor/etl_editor/component/component_rect.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_json/etl_components_list.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_json/etl_diagram_graph.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_json/etl_http.dart';

class EtlEditorLoader {
  Future<bool> loadComponentSet(CanvasModel model) async {
    EtlHttp etlHttp = EtlHttp();
    // String pipeline =
    // await etlHttp.getJson('resources/pipelines/created-1497543801843');
    String components = await etlHttp.getJson('resources/components');

    // String pipeline = MockEtlData.pipelineJson;
    // String components = MockEtlData.componentsJson;

    var etlComponentsJsonObject = EtlComponentsJsonObject(
      etlJson: components,
    );
    var listOfComponentGraph = etlComponentsJsonObject.graphList;

    bool isJarTemplate(EtlComponentsGraph graph) {
      return graph.graphItems.whereType<EtlJarTemplateItem>().isNotEmpty;
    }

    listOfComponentGraph.forEach((graph) {
      EtlJarTemplateItem template;
      List<EtlPortItem> ports = [];
      if (isJarTemplate(graph)) {
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
      } else {
        print('else template -- do nothing');
        // var etlTemplateItem =
        //     graph.graphItems.whereType<EtlTemplateItem>().single;
        //
        // print('tempalte: ${etlTemplateItem.template}');
        // print('tempalte: ${etlTemplateItem.label}');
        // print('tempalte: ${etlTemplateItem.id}');
        //
        // EtlComponentsGraph possibleJarTemplateGraph;
        // print('t item: $etlTemplateItem');
        // print('t item id: ${etlTemplateItem.id}');
        // print('t item label: ${etlTemplateItem.label}');
        // print('t item template: ${etlTemplateItem.template}');
        // do {
        //   print(' do do dod do do dod od dod od od do while');
        //   possibleJarTemplateGraph = etlComponentsJsonObject
        //       .searchForTemplate(etlTemplateItem.template);
        // } while (!isJarTemplate(possibleJarTemplateGraph));
        //
        // possibleJarTemplateGraph.graphItems.forEach((item) {
        //   if (item is EtlJarTemplateItem) {
        //     template = EtlJarTemplateItem(
        //       id: etlTemplateItem.id,
        //       color: item.color,
        //       label: etlTemplateItem.label,
        //     );
        //   } else if (item is EtlPortItem) {
        //     model.portRules.addRule(
        //       item.portType + EtlPortItemType.output.toString(),
        //       item.portType + EtlPortItemType.input.toString(),
        //     );
        //     ports.add(item);
        //   }
        // });
      }

      // assert(template != null);

      if (template != null) {
        model.addNewComponentBody(
          template.id,
          ComponentBody(
            menuComponentBody: MenuComponentBodyRect(template: template),
            componentBody: ComponentBodyRect(template: template),
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
    return true;
  }

  Future<bool> loadPipeline(CanvasModel model, String pipelineUrl) async {
    if (!pipelineUrl.contains('demo.etl.linkedpipes.com/resources')) {
      print('!pipelineUrl.contains(demo.etl.linkedpipes.com/resources)');
      return false;
    }
    EtlHttp etlHttp = EtlHttp();
    String pipeline = await etlHttp
        .getJson(pipelineUrl.substring(pipelineUrl.indexOf('resources/')));

    if (pipeline == null) {
      print('false, pipeline is null');
      return false;
    }

    var etlDiagramJsonObject = EtlDiagramJsonObject(
      etlJson: pipeline,
      pipelineUrlId: pipelineUrl,
      // 'https://demo.etl.linkedpipes.com/resources/pipelines/created-1497543801843',
      // 'https://demo.etl.linkedpipes.com/resources/pipelines/created-1524220761121',
    );

    var etlDiagramGraph = etlDiagramJsonObject.getEtlGraphDiagram();

    print('load diagram foreach');

    etlDiagramGraph.graphItems.forEach((item) {
      if (item is EtlComponentItem) {
        // var etlComponentsGraph = etlComponentsJsonObject
        //     .getComponentGraphFromTemplateId(item.template);

        // if (etlComponentsGraph.isJarTemplate) {
        //   EtlJarTemplateItem jarTemplate;
        //   List<EtlPortItem> ports = [];
        //   etlComponentsGraph.graphItems.forEach((item) {
        //     if (item is EtlJarTemplateItem) {
        //       jarTemplate = item;
        //     } else if (item is EtlPortItem) {
        //       ports.add(item);
        //     }
        //   });

        print('item template: ${item.template}');
        var componentData = model.menuData.menuComponentDataList
            .where((cd) => cd.componentBodyName == item.template)
            .single
            .duplicate(offset: Offset(item.x, item.y), newId: item.id);

        (componentData.customData as RectCustomComponentData).color =
            item.color;
        (componentData.customData as RectCustomComponentData).description =
            item.description;

        model.addComponent(componentData);
        print('added comp: ${componentData.id}');
        // } else {}

        // if (etlComponentsGraph == null) {
        //   print('a == null (template w/o jar): ${item.template}');
        // } else {
        //   EtlJarTemplateItem template;
        //   List<EtlPortItem> ports = [];
        //   etlComponentsGraph.graphItems.forEach((item) {
        //     if (item is EtlJarTemplateItem) {
        //       template = item;
        //     } else if (item is EtlPortItem) {
        //       ports.add(item);
        //     }
        //   });
        //
        //   model.addComponent(
        //     generateComponentRect(
        //       model: model,
        //       template: template,
        //       ports: ports,
        //       position: Offset(item.x, item.y),
        //       size: Size(120, 80),
        //     ),
        //   );
        // }
      }
    });

    etlDiagramGraph.graphItems.forEach((item) {
      if (item is EtlConnectionItem) {
        var sourceComponent = model.getComponentData(item.sourceComponent);
        var sourcePort = sourceComponent.ports[item.sourceBinding];
        var targetComponent = model.getComponentData(item.targetComponent);
        var targetPort = targetComponent.ports[item.targetBinding];
        model.tryToConnectTwoPorts(sourcePort, targetPort);

        if (item.vertices.isNotEmpty) {
          print('middle vertices');
          String connectionId = sourcePort.connections
              .singleWhere((connection) =>
                  connection.portId == targetPort.id &&
                  connection.componentId == targetComponent.id)
              .connectionId;
          var link = model.getLinkData(connectionId);
          var vertexList =
              etlDiagramGraph.graphItems.whereType<EtlVertexItem>().toList();
          SplayTreeMap<int, Offset> vertexMap = SplayTreeMap<int, Offset>();
          item.vertices.forEach((String vertexId) {
            EtlVertexItem vertexItem =
                vertexList.singleWhere((element) => element.id == vertexId);
            vertexMap[vertexItem.order] = Offset(vertexItem.x, vertexItem.y);
          });
          for (final int index in vertexMap.keys) {
            link.insertMiddlePoint(vertexMap[index], index);
          }
        }
      }
    });

    return true;
  }
}

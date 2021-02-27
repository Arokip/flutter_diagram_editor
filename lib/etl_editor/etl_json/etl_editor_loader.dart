import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_body.dart';
import 'package:flutter_diagram_editor/etl_editor/component/component_rect.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_json/etl_components_list.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_json/etl_http.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_json/etl_pipeline_graph.dart';

class EtlEditorLoader {
  Future<bool> loadComponentSet(CanvasModel model) async {
    EtlHttp etlHttp = EtlHttp();

    String components = await etlHttp.getJson('resources/components');

    var etlComponentsJsonObject = EtlComponentsJsonObject(
      etlJson: components,
    );
    var listOfComponentGraph = etlComponentsJsonObject.graphList;

    bool isJarTemplate(EtlComponentsGraph graph) {
      return graph.graphItems.whereType<EtlJarTemplateItem>().isNotEmpty;
    }

    var jarTemplateList =
        listOfComponentGraph.where((graph) => isJarTemplate(graph));
    var templateList =
        listOfComponentGraph.where((graph) => !isJarTemplate(graph));

    jarTemplateList.forEach((graph) {
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

      model.addNewComponentBody(
        template.id,
        ComponentBody(
          menuComponentBody: MenuComponentBodyRect(template: template),
          componentBody: ComponentBodyRect(template: template),
          fromJsonCustomData: (json) => RectCustomComponentData.fromJson(json),
        ),
      );

      var componentSize = Size(40 + template.label.length * 6.0, 60);

      model.menuData.addComponentsToMenu([
        generateComponentRect(
          model: model,
          ports: ports,
          template: template,
          size: componentSize,
        ),
      ]);
    });

    templateList.forEach((graph) {
      var futureJarTemplateGraph = graph;

      do {
        futureJarTemplateGraph =
            etlComponentsJsonObject.getComponentGraphFromTemplateId(
                (futureJarTemplateGraph.graphItems.single as EtlTemplateItem)
                    .template);
      } while (!isJarTemplate(futureJarTemplateGraph));

      EtlTemplateItem etlTemplateItem = graph.graphItems.single;

      EtlJarTemplateItem etlJarTemplateItem;
      List<EtlPortItem> ports = [];
      futureJarTemplateGraph.graphItems.forEach((item) {
        if (item is EtlJarTemplateItem) {
          etlJarTemplateItem = item;
        } else if (item is EtlPortItem) {
          ports.add(item);
        }
      });

      EtlJarTemplateItem finalTemplate = EtlJarTemplateItem(
        id: etlTemplateItem.id,
        color: etlJarTemplateItem.color,
        label: etlTemplateItem.label,
      );

      model.addNewComponentBody(
        finalTemplate.id,
        ComponentBody(
          menuComponentBody: MenuComponentBodyRect(template: finalTemplate),
          componentBody: ComponentBodyRect(template: finalTemplate),
          fromJsonCustomData: (json) => RectCustomComponentData.fromJson(json),
        ),
      );

      var componentSize = Size(40 + finalTemplate.label.length * 6.0, 60);

      model.menuData.addComponentsToMenu([
        generateComponentRect(
          model: model,
          ports: ports,
          template: finalTemplate,
          size: componentSize,
        ),
      ]);
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

    var etlDiagramJsonObject = EtlPipelineJsonObject(
      etlJson: pipeline,
      pipelineUrlId: pipelineUrl,
    );

    var etlDiagramGraph = etlDiagramJsonObject.getEtlPipelineGraph();

    etlDiagramGraph.graphItems.forEach((item) {
      if (item is EtlComponentItem) {
        var componentData = model.menuData.menuComponentDataList
            .where((cd) => cd.componentBodyName == item.template)
            .single
            .duplicate(offset: Offset(item.x, item.y), newId: item.id);

        (componentData.customData as RectCustomComponentData).color =
            item.color;
        (componentData.customData as RectCustomComponentData).description =
            item.description;

        double width;
        double height = 60;
        double pixelsPerLetter = 6.0;
        double baseWidth = 40;

        if (item.description == null) {
          width = baseWidth + item.label.length * pixelsPerLetter;
        } else {
          var len = item.description.length > item.label.length
              ? item.description.length
              : item.label.length;
          width = baseWidth + len * pixelsPerLetter;
        }

        componentData.size = Size(width, height);

        model.addComponent(componentData);
        print('added comp: ${componentData.id}');
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

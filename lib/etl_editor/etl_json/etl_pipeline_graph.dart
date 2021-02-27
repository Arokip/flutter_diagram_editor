import 'dart:convert';

String typePipelineType = 'http://linkedpipes.com/ontology/Pipeline';
String pipelineType = 'http://linkedpipes.com/ontology/Pipeline';
String componentType = 'http://linkedpipes.com/ontology/Component';
String connectionType = 'http://linkedpipes.com/ontology/Connection';
String verticesType = 'http://linkedpipes.com/ontology/vertex';
String vertexType = 'http://linkedpipes.com/ontology/Vertex';

String itemTemplateType = 'http://linkedpipes.com/ontology/template';
String labelType = 'http://www.w3.org/2004/02/skos/core#prefLabel';

String xPosType = 'http://linkedpipes.com/ontology/x';
String yPosType = 'http://linkedpipes.com/ontology/y';
String orderType = 'http://linkedpipes.com/ontology/order';

String sourceComponentType = 'http://linkedpipes.com/ontology/sourceComponent';
String targetComponentType = 'http://linkedpipes.com/ontology/targetComponent';
String sourceBindingType = 'http://linkedpipes.com/ontology/sourceBinding';
String targetBindingType = 'http://linkedpipes.com/ontology/targetBinding';

String descriptionType = 'http://purl.org/dc/terms/description';
String colorType = 'http://linkedpipes.com/ontology/color';

class EtlPipelineJsonObject {
  final String pipelineUrlId;
  final String etlJson;

  EtlPipelineJsonObject({this.pipelineUrlId, this.etlJson});

  EtlPipelineGraph getEtlPipelineGraph() {
    var pipelineGraph = (jsonDecode(etlJson) as List)
        .singleWhere((graph) => graph['@id'] == pipelineUrlId);
    return EtlPipelineGraph.fromJson(pipelineGraph);
  }
}

class EtlPipelineGraph {
  final String id;
  final List<EtlPipelineGraphItem> graphItems;

  EtlPipelineGraph({this.id, this.graphItems});

  factory EtlPipelineGraph.fromJson(Map<String, dynamic> json) {
    print('EtlJsonGraph.fromJson graph id:${json['@id']}');
    print('EtlJsonGraph json type: ${json.runtimeType}');

    var graphItems = (json['@graph'] as List).map((graphItem) {
      if ((graphItem['@type'] as List).contains(pipelineType)) {
        print('typ pip');
        return EtlPipelineItem.fromJson(graphItem);
      } else if ((graphItem['@type'] as List).contains(componentType)) {
        print('typ com');
        return EtlComponentItem.fromJson(graphItem);
      } else if ((graphItem['@type'] as List).contains(connectionType)) {
        print('typ con');
        return EtlConnectionItem.fromJson(graphItem);
      } else if ((graphItem['@type'] as List).contains(vertexType)) {
        print('typ ver');
        return EtlVertexItem.fromJson(graphItem);
      }
      print('${graphItem['@type']}');
      return null;
    }).toList();
    graphItems.removeWhere((value) => value == null);
    return EtlPipelineGraph(
      id: json['@id'],
      graphItems: graphItems,
    );
  }
}

abstract class EtlPipelineGraphItem {}

class EtlPipelineItem extends EtlPipelineGraphItem {
  final String id;
  final List<String> label;

  EtlPipelineItem({
    this.id,
    this.label,
  });

  factory EtlPipelineItem.fromJson(Map<String, dynamic> json) {
    return EtlPipelineItem(
      id: json['@id'],
      label:
          (json[labelType] as List).map((e) => e['@value'].toString()).toList(),
    );
  }
}

class EtlComponentItem extends EtlPipelineGraphItem {
  final String id;
  final String label;
  final String template;
  final double x;
  final double y;
  final String description;
  final String color;

  EtlComponentItem({
    this.id,
    this.label,
    this.template,
    this.x,
    this.y,
    this.description,
    this.color,
  });

  factory EtlComponentItem.fromJson(Map<String, dynamic> json) {
    return EtlComponentItem(
      id: json['@id'],
      template: (json[itemTemplateType] as List).first['@id'],
      label: (json[labelType] as List).first['@value'],
      x: double.parse((json[xPosType] as List).first['@value']),
      y: double.parse((json[yPosType] as List).first['@value']),
      description: json[descriptionType] == null
          ? null
          : (json[descriptionType] as List).first['@value'],
      color: json[colorType] == null
          ? null
          : (json[colorType] as List).first['@value'],
    );
  }
}

class EtlConnectionItem extends EtlPipelineGraphItem {
  final String id;
  final String sourceComponent;
  final String targetComponent;
  final String sourceBinding;
  final String targetBinding;
  final List<String> vertices;

  EtlConnectionItem({
    this.id,
    this.sourceComponent,
    this.targetComponent,
    this.sourceBinding,
    this.targetBinding,
    this.vertices,
  });

  factory EtlConnectionItem.fromJson(Map<String, dynamic> json) {
    return EtlConnectionItem(
      id: json['@id'],
      sourceComponent: (json[sourceComponentType] as List).first['@id'],
      targetComponent: (json[targetComponentType] as List).first['@id'],
      sourceBinding: (json[sourceBindingType] as List).first['@value'],
      targetBinding: (json[targetBindingType] as List).first['@value'],
      vertices: (json[verticesType] == null)
          ? []
          : (json[verticesType] as List)
              .map((vertex) => vertex['@id'].toString())
              .toList(),
    );
  }
}

class EtlVertexItem extends EtlPipelineGraphItem {
  final String id;
  final int order;
  final double x;
  final double y;

  EtlVertexItem({
    this.id,
    this.order,
    this.x,
    this.y,
  });

  factory EtlVertexItem.fromJson(Map<String, dynamic> json) {
    return EtlVertexItem(
      id: json['@id'],
      order: int.parse((json[orderType] as List).first['@value']),
      x: double.parse((json[xPosType] as List).first['@value']),
      y: double.parse((json[yPosType] as List).first['@value']),
    );
  }
}

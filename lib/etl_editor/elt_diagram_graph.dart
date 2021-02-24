import 'dart:convert';

String typePipelineType = 'http://linkedpipes.com/ontology/Pipeline';
String pipelineType = 'http://linkedpipes.com/ontology/Pipeline';
String componentType = 'http://linkedpipes.com/ontology/Component';
String connectionType = 'http://linkedpipes.com/ontology/Connection';

String itemTemplateType = 'http://linkedpipes.com/ontology/template';
String labelType = 'http://www.w3.org/2004/02/skos/core#prefLabel';

String xPosType = 'http://linkedpipes.com/ontology/x';
String yPosType = 'http://linkedpipes.com/ontology/y';

String sourceComponentType = 'http://linkedpipes.com/ontology/sourceComponent';
String targetComponentType = 'http://linkedpipes.com/ontology/targetComponent';
String sourceBindingType = 'http://linkedpipes.com/ontology/sourceBinding';
String targetBindingType = 'http://linkedpipes.com/ontology/targetBinding';

class EtlDiagramJsonObject {
  final String pipelineUrlId;
  final String etlJson;

  EtlDiagramJsonObject({this.pipelineUrlId, this.etlJson});

  EtlDiagramGraph getEtlGraph() {
    return (jsonDecode(etlJson) as List)
        .map((graph) => EtlDiagramGraph.fromJson(graph))
        .firstWhere((EtlDiagramGraph graph) => graph.id == pipelineUrlId);
  }
}

class EtlDiagramGraph {
  final String id;
  final List<EtlPipelineGraphItem> graphItems;

  EtlDiagramGraph({this.id, this.graphItems});

  factory EtlDiagramGraph.fromJson(Map<String, dynamic> json) {
    print('EtlJsonGraph.fromJson');
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
      }
      print('${graphItem['@type']}');
      return null;
    }).toList();
    graphItems.removeWhere((value) => value == null);

    print('');
    print('length: ${graphItems.length}');
    graphItems.forEach((element) {
      print('gi: $element');
      print('e: ${element.runtimeType}');
    });
    print('');

    return EtlDiagramGraph(
      id: json['@id'],
      graphItems: graphItems,
    );
  }
}

class EtlPipelineGraphItem {}

class EtlPipelineItem extends EtlPipelineGraphItem {
  final String id;

  // final List<String> type;
  final List<String> label;

  EtlPipelineItem({
    this.id,
    // this.type,
    this.label,
  });

  factory EtlPipelineItem.fromJson(Map<String, dynamic> json) {
    return EtlPipelineItem(
      id: json['@id'],
      // type: (json['@type'] as List).map((type) => type.toString()).toList(),
      label:
          (json[labelType] as List).map((e) => e['@value'].toString()).toList(),
    );
  }
}

class EtlComponentItem extends EtlPipelineGraphItem {
  final String id;

  // final List<String> type;
  final String label;
  final String template;
  final double x;
  final double y;

  EtlComponentItem({
    this.id,
    // this.type,
    this.label,
    this.template,
    this.x,
    this.y,
  });

  factory EtlComponentItem.fromJson(Map<String, dynamic> json) {
    return EtlComponentItem(
      id: json['@id'],
      // type: (json['@type'] as List).map((type) => type.toString()).toList(),
      template: (json[itemTemplateType] as List).first['@id'],
      label: (json[labelType] as List).first['@value'],
      x: double.parse((json[xPosType] as List).first['@value']),
      y: double.parse((json[yPosType] as List).first['@value']),
    );
  }
}

class EtlConnectionItem extends EtlPipelineGraphItem {
  final String id;

  // final List<String> type;
  final String sourceComponent;
  final String targetComponent;
  final String sourceBinding;
  final String targetBinding;

  // TODO: vertex

  EtlConnectionItem({
    this.id,
    // this.type,
    this.sourceComponent,
    this.targetComponent,
    this.sourceBinding,
    this.targetBinding,
  });

  factory EtlConnectionItem.fromJson(Map<String, dynamic> json) {
    return EtlConnectionItem(
      id: json['@id'],
      // type: (json['@type'] as List).map((type) => type.toString()).toList(),
      sourceComponent: (json[sourceComponentType] as List).first['@id'],
      targetComponent: (json[targetComponentType] as List).first['@id'],
      sourceBinding: (json[sourceBindingType] as List).first['@id'],
      targetBinding: (json[targetBindingType] as List).first['@id'],
    );
  }
}

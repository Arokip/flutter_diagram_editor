import 'package:diagram_editor/diagram_editor.dart';

class DiagramData {
  final List<ComponentData> components;
  final List<LinkData> links;

  /// Contains list of all components and list of all links of the diagram
  DiagramData({
    required this.components,
    required this.links,
  });

  DiagramData.empty()
      : this.components = <ComponentData>[],
        this.links = <LinkData>[];

  DiagramData.fromJson(
    Map<String, dynamic> json, {
    Function(Map<String, dynamic> json)? decodeCustomComponentData,
    Function(Map<String, dynamic> json)? decodeCustomLinkData,
  })  : components = (json['components'] as List)
            .map((componentJson) => ComponentData.fromJson(
                  componentJson,
                  decodeCustomComponentData: decodeCustomComponentData,
                ))
            .toList(),
        links = (json['links'] as List)
            .map((linkJson) => LinkData.fromJson(
                  linkJson,
                  decodeCustomLinkData: decodeCustomLinkData,
                ))
            .toList();

  Map<String, dynamic> toJson() => {
        'components': components,
        'links': links,
      };
}

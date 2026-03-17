import 'package:diagram_editor/src/model/component_data.dart';
import 'package:diagram_editor/src/model/link_data.dart';

/// Contains all components and links of a diagram for serialization.
class DiagramData<C, L> {
  DiagramData({
    required this.components,
    required this.links,
  });

  /// All components in the diagram.
  final List<ComponentData<C>> components;

  /// All links in the diagram.
  final List<LinkData<L>> links;
}

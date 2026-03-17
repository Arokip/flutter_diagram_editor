import 'dart:convert';

import 'package:diagram_editor/src/codec/json_codec.dart';
import 'package:diagram_editor/src/model/component_data.dart';
import 'package:diagram_editor/src/model/diagram_data.dart';
import 'package:diagram_editor/src/model/link_data.dart';

/// Handles serialization and deserialization of diagram data.
class DiagramSerializer<C, L> {
  const DiagramSerializer({
    this.componentDataCodec,
    this.linkDataCodec,
  });

  /// Optional codec for component custom data.
  final JsonCodec<C>? componentDataCodec;

  /// Optional codec for link custom data.
  final JsonCodec<L>? linkDataCodec;

  /// Serializes a [DiagramData] to a JSON string.
  String serialize(DiagramData<C, L> diagram) {
    return jsonEncode({
      'components': diagram.components
          .map((c) => c.toJson(encodeData: componentDataCodec?.encode))
          .toList(),
      'links': diagram.links
          .map((l) => l.toJson(encodeData: linkDataCodec?.encode))
          .toList(),
    });
  }

  /// Deserializes a JSON string to a [DiagramData].
  ///
  /// Throws [FormatException] if the JSON is invalid or missing
  /// required fields.
  DiagramData<C, L> deserialize(String json) {
    final Object? decoded;
    try {
      decoded = jsonDecode(json);
    } on FormatException catch (e) {
      throw FormatException('Invalid diagram JSON: ${e.message}');
    }

    if (decoded is! Map<String, dynamic>) {
      throw const FormatException(
        'Diagram JSON must be an object with '
        '"components" and "links" arrays',
      );
    }

    final componentsList = decoded['components'];
    final linksList = decoded['links'];

    if (componentsList is! List || linksList is! List) {
      throw const FormatException(
        'Diagram JSON must contain '
        '"components" and "links" arrays',
      );
    }

    return DiagramData<C, L>(
      components: componentsList
          .map(
            (componentJson) => ComponentData<C>.fromJson(
              componentJson as Map<String, dynamic>,
              decodeData: componentDataCodec?.decode,
            ),
          )
          .toList(),
      links: linksList
          .map(
            (linkJson) => LinkData<L>.fromJson(
              linkJson as Map<String, dynamic>,
              decodeData: linkDataCodec?.decode,
            ),
          )
          .toList(),
    );
  }
}

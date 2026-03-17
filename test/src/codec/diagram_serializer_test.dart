import 'package:diagram_editor/src/codec/diagram_serializer.dart';
import 'package:diagram_editor/src/codec/json_codec.dart';
import 'package:diagram_editor/src/model/component_data.dart';
import 'package:diagram_editor/src/model/diagram_data.dart';
import 'package:diagram_editor/src/model/link_data.dart';
import 'package:diagram_editor/src/model/link_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiagramSerializer', () {
    test('round-trip without custom data', () {
      const serializer = DiagramSerializer<void, void>();

      final component = ComponentData<void>(
        id: 'c1',
        position: const Offset(10, 20),
        size: const Size(100, 80),
      );

      final diagram = DiagramData<void, void>(
        components: [component],
        links: [],
      );

      final json = serializer.serialize(diagram);
      final restored = serializer.deserialize(json);

      expect(restored.components, hasLength(1));
      expect(restored.components.first.id, 'c1');
      expect(restored.components.first.position, const Offset(10, 20));
      expect(restored.links, isEmpty);
    });

    test('round-trip with custom component data', () {
      final serializer = DiagramSerializer<Map<String, int>, void>(
        componentDataCodec: JsonCodec<Map<String, int>>(
          encode: (d) => d,
          decode: (j) => j.cast<String, int>(),
        ),
      );

      final component = ComponentData<Map<String, int>>(
        id: 'c1',
        data: {'count': 42},
      );

      final diagram = DiagramData<Map<String, int>, void>(
        components: [component],
        links: [],
      );

      final json = serializer.serialize(diagram);
      final restored = serializer.deserialize(json);

      expect(restored.components.first.data, {'count': 42});
    });

    test('round-trip with links', () {
      const serializer = DiagramSerializer<void, void>();

      final link = LinkData<void>(
        id: 'l1',
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
        linkPoints: [
          const Offset(10, 20),
          const Offset(100, 200),
        ],
        linkStyle: const LinkStyle(
          arrowType: ArrowType.arrow,
          lineType: LineType.dashed,
        ),
      );

      final diagram = DiagramData<void, void>(
        components: [],
        links: [link],
      );

      final json = serializer.serialize(diagram);
      final restored = serializer.deserialize(json);

      expect(restored.links, hasLength(1));
      expect(restored.links.first.id, 'l1');
      expect(restored.links.first.sourceComponentId, 'c1');
      expect(restored.links.first.linkStyle.arrowType, ArrowType.arrow);
      expect(restored.links.first.linkStyle.lineType, LineType.dashed);
    });

    test('round-trip with custom link data', () {
      final serializer = DiagramSerializer<void, Map<String, int>>(
        linkDataCodec: JsonCodec<Map<String, int>>(
          encode: (d) => d,
          decode: (j) => j.cast<String, int>(),
        ),
      );

      final link = LinkData<Map<String, int>>(
        id: 'l1',
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
        linkPoints: [Offset.zero, const Offset(1, 1)],
        data: {'weight': 7},
      );

      final diagram = DiagramData<void, Map<String, int>>(
        components: [],
        links: [link],
      );

      final json = serializer.serialize(diagram);
      final restored = serializer.deserialize(json);

      expect(restored.links.first.data, {'weight': 7});
    });
  });

  group('DiagramSerializer error handling', () {
    test('throws FormatException on invalid JSON string', () {
      const serializer = DiagramSerializer<void, void>();
      expect(
        () => serializer.deserialize('not valid json'),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('Invalid diagram JSON'),
          ),
        ),
      );
    });

    test('throws FormatException when JSON is not an object', () {
      const serializer = DiagramSerializer<void, void>();
      expect(
        () => serializer.deserialize('"just a string"'),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('must be an object'),
          ),
        ),
      );
    });

    test('throws FormatException when missing components array', () {
      const serializer = DiagramSerializer<void, void>();
      expect(
        () => serializer.deserialize('{"links": []}'),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('"components" and "links" arrays'),
          ),
        ),
      );
    });

    test('throws FormatException when missing links array', () {
      const serializer = DiagramSerializer<void, void>();
      expect(
        () => serializer.deserialize('{"components": []}'),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('"components" and "links" arrays'),
          ),
        ),
      );
    });

    test('throws FormatException on JSON array instead of object', () {
      const serializer = DiagramSerializer<void, void>();
      expect(
        () => serializer.deserialize('[]'),
        throwsA(isA<FormatException>()),
      );
    });
  });
}

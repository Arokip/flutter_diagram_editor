import 'package:diagram_editor/src/model/connection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OutgoingConnection', () {
    test('contains returns true for matching linkId', () {
      const connection = OutgoingConnection(
        linkId: 'link-1',
        otherComponentId: 'comp-2',
      );
      expect(connection.contains('link-1'), isTrue);
      expect(connection.contains('link-2'), isFalse);
    });

    test('toJson produces correct format', () {
      const connection = OutgoingConnection(
        linkId: 'link-1',
        otherComponentId: 'comp-2',
      );
      final json = connection.toJson();
      expect(json['direction'], 'out');
      expect(json['link_id'], 'link-1');
      expect(json['other_component_id'], 'comp-2');
    });
  });

  group('IncomingConnection', () {
    test('toJson produces correct format', () {
      const connection = IncomingConnection(
        linkId: 'link-1',
        otherComponentId: 'comp-2',
      );
      final json = connection.toJson();
      expect(json['direction'], 'in');
      expect(json['link_id'], 'link-1');
      expect(json['other_component_id'], 'comp-2');
    });
  });

  group('Connection.fromJson', () {
    test('deserializes OutgoingConnection', () {
      final json = {
        'direction': 'out',
        'link_id': 'link-1',
        'other_component_id': 'comp-2',
      };
      final connection = Connection.fromJson(json);
      expect(connection, isA<OutgoingConnection>());
      expect(connection.linkId, 'link-1');
      expect(connection.otherComponentId, 'comp-2');
    });

    test('deserializes IncomingConnection', () {
      final json = {
        'direction': 'in',
        'link_id': 'link-1',
        'other_component_id': 'comp-2',
      };
      final connection = Connection.fromJson(json);
      expect(connection, isA<IncomingConnection>());
    });

    test('round-trip serialization', () {
      const original = OutgoingConnection(
        linkId: 'link-abc',
        otherComponentId: 'comp-xyz',
      );
      final restored = Connection.fromJson(original.toJson());
      expect(restored, isA<OutgoingConnection>());
      expect(restored.linkId, original.linkId);
      expect(restored.otherComponentId, original.otherComponentId);
    });

    test('throws on unknown direction', () {
      final json = {
        'direction': 'unknown',
        'link_id': 'link-1',
        'other_component_id': 'comp-2',
      };
      expect(
        () => Connection.fromJson(json),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}

import 'package:diagram_editor/src/model/component_data.dart';
import 'package:diagram_editor/src/model/connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ComponentData', () {
    test('generates id when none provided', () {
      final component = ComponentData<void>();
      expect(component.id, isNotEmpty);
    });

    test('uses provided id', () {
      final component = ComponentData<void>(id: 'custom-id');
      expect(component.id, 'custom-id');
    });

    test('move translates position', () {
      final component = ComponentData<void>(
        position: const Offset(10, 20),
      )..move(const Offset(5, -3));
      expect(component.position, const Offset(15, 17));
    });

    test('setPosition sets absolute position', () {
      final component = ComponentData<void>(
        position: const Offset(10, 20),
      )..setPosition(const Offset(50, 60));
      expect(component.position, const Offset(50, 60));
    });

    test('resizeDelta respects minSize', () {
      final component = ComponentData<void>(
        minSize: const Size(20, 20),
      )..resizeDelta(const Offset(-100, -100));
      expect(component.size.width, 20);
      expect(component.size.height, 20);
    });

    test('resizeDelta grows size', () {
      final component = ComponentData<void>()
        ..resizeDelta(const Offset(10, 20));
      expect(component.size, const Size(90, 100));
    });

    test('getPointOnComponent returns correct offsets', () {
      final component = ComponentData<void>(
        size: const Size(100, 200),
      );
      expect(
        component.getPointOnComponent(Alignment.topLeft),
        Offset.zero,
      );
      expect(
        component.getPointOnComponent(Alignment.center),
        const Offset(50, 100),
      );
      expect(
        component.getPointOnComponent(Alignment.bottomRight),
        const Offset(100, 200),
      );
    });

    test('addConnection and removeConnection', () {
      final component = ComponentData<void>();
      const connection = OutgoingConnection(
        linkId: 'link-1',
        otherComponentId: 'comp-2',
      );
      component.addConnection(connection);
      expect(component.connections, hasLength(1));

      component.removeConnection('link-1');
      expect(component.connections, isEmpty);
    });

    test('parent-child management', () {
      final component = ComponentData<void>()..setParent('parent-1');
      expect(component.parentId, 'parent-1');

      component.addChild('child-1');
      expect(component.childrenIds, contains('child-1'));

      component.removeChild('child-1');
      expect(component.childrenIds, isEmpty);

      component.removeParent();
      expect(component.parentId, isNull);
    });

    test('notifies listeners on move', () {
      final component = ComponentData<void>();
      var notified = false;
      component
        ..addListener(() => notified = true)
        ..move(const Offset(1, 1));
      expect(notified, isTrue);
    });

    test('generic data type works', () {
      final component = ComponentData<String>(data: 'hello');
      expect(component.data, 'hello');
    });
  });

  group('ComponentData serialization', () {
    test('toJson and fromJson round-trip', () {
      final original = ComponentData<void>(
        id: 'comp-1',
        position: const Offset(10, 20),
        size: const Size(100, 200),
        minSize: const Size(10, 10),
        type: 'custom',
      )..zOrder = 5;

      final json = original.toJson();
      final restored = ComponentData<void>.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.position, original.position);
      expect(restored.size, original.size);
      expect(restored.minSize, original.minSize);
      expect(restored.type, original.type);
      expect(restored.zOrder, original.zOrder);
    });

    test('round-trip with custom data codec', () {
      final original = ComponentData<Map<String, int>>(
        id: 'comp-1',
        data: {'count': 42},
      );

      final json = original.toJson(
        encodeData: (d) => d,
      );
      final restored = ComponentData<Map<String, int>>.fromJson(
        json,
        decodeData: (j) => j.cast<String, int>(),
      );

      expect(restored.data, {'count': 42});
    });
  });
}

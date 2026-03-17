import 'package:diagram_editor/src/model/link_data.dart';
import 'package:diagram_editor/src/model/link_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LinkData', () {
    late LinkData<void> link;

    setUp(() {
      link = LinkData<void>(
        id: 'l1',
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
        linkPoints: [
          Offset.zero,
          const Offset(100, 100),
        ],
      );
    });

    test('setStart updates first point', () {
      link.setStart(const Offset(10, 20));
      expect(link.linkPoints.first, const Offset(10, 20));
    });

    test('setEnd updates last point', () {
      link.setEnd(const Offset(200, 300));
      expect(link.linkPoints.last, const Offset(200, 300));
    });

    test('setEndpoints updates both start and end', () {
      link.setEndpoints(const Offset(5, 5), const Offset(50, 50));
      expect(link.linkPoints.first, const Offset(5, 5));
      expect(link.linkPoints.last, const Offset(50, 50));
    });

    test('insertMiddlePoint adds a point at the given index', () {
      link.insertMiddlePoint(const Offset(50, 50), 1);
      expect(link.linkPoints, hasLength(3));
      expect(link.linkPoints[1], const Offset(50, 50));
    });

    test('setMiddlePointPosition updates the point at index', () {
      link
        ..insertMiddlePoint(const Offset(50, 50), 1)
        ..setMiddlePointPosition(const Offset(75, 75), 1);
      expect(link.linkPoints[1], const Offset(75, 75));
    });

    test('moveMiddlePoint translates the point at index', () {
      link
        ..insertMiddlePoint(const Offset(50, 50), 1)
        ..moveMiddlePoint(const Offset(10, -5), 1);
      expect(link.linkPoints[1], const Offset(60, 45));
    });

    test('removeMiddlePoint removes the point at index', () {
      link
        ..insertMiddlePoint(const Offset(30, 30), 1)
        ..insertMiddlePoint(const Offset(60, 60), 2);
      expect(link.linkPoints, hasLength(4));

      link.removeMiddlePoint(1);
      expect(link.linkPoints, hasLength(3));
      expect(link.linkPoints[1], const Offset(60, 60));
    });

    test('moveAllMiddlePoints translates all middle points', () {
      link
        ..insertMiddlePoint(const Offset(30, 30), 1)
        ..insertMiddlePoint(const Offset(60, 60), 2)
        ..moveAllMiddlePoints(const Offset(10, 10));

      // First and last should be unchanged
      expect(link.linkPoints.first, Offset.zero);
      expect(link.linkPoints.last, const Offset(100, 100));
      // Middle points should be translated
      expect(link.linkPoints[1], const Offset(40, 40));
      expect(link.linkPoints[2], const Offset(70, 70));
    });

    test('moveAllMiddlePoints notifies listeners', () {
      link
        ..insertMiddlePoint(const Offset(50, 50), 1)
        ..addListener(() {});
      var notified = false;
      link
        ..addListener(() => notified = true)
        ..moveAllMiddlePoints(const Offset(1, 1));
      expect(notified, isTrue);
    });

    test('showJoints and hideJoints toggle visibility', () {
      expect(link.areJointsVisible, isFalse);
      link.showJoints();
      expect(link.areJointsVisible, isTrue);
      link.hideJoints();
      expect(link.areJointsVisible, isFalse);
    });

    test('notifies listeners on setStart', () {
      var notified = false;
      link
        ..addListener(() => notified = true)
        ..setStart(const Offset(1, 1));
      expect(notified, isTrue);
    });

    test('notifies listeners on insertMiddlePoint', () {
      var notified = false;
      link
        ..addListener(() => notified = true)
        ..insertMiddlePoint(const Offset(50, 50), 1);
      expect(notified, isTrue);
    });

    test('notifies listeners on showJoints', () {
      var notified = false;
      link
        ..addListener(() => notified = true)
        ..showJoints();
      expect(notified, isTrue);
    });

    test('generic link data works', () {
      final typedLink = LinkData<String>(
        id: 'l1',
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
        linkPoints: [Offset.zero, const Offset(1, 1)],
        data: 'custom',
      );
      expect(typedLink.data, 'custom');
    });
  });

  group('LinkData serialization', () {
    test('toJson and fromJson round-trip', () {
      final original = LinkData<void>(
        id: 'l1',
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
        linkPoints: [
          const Offset(10, 20),
          const Offset(50, 50),
          const Offset(100, 200),
        ],
        linkStyle: const LinkStyle(
          arrowType: ArrowType.pointedArrow,
          lineType: LineType.dashed,
          lineWidth: 2,
          color: Colors.red,
        ),
      );

      final json = original.toJson();
      final restored = LinkData<void>.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.sourceComponentId, original.sourceComponentId);
      expect(restored.targetComponentId, original.targetComponentId);
      expect(restored.linkPoints, hasLength(3));
      expect(restored.linkPoints[0], const Offset(10, 20));
      expect(restored.linkPoints[1], const Offset(50, 50));
      expect(restored.linkPoints[2], const Offset(100, 200));
      expect(restored.linkStyle.arrowType, ArrowType.pointedArrow);
      expect(restored.linkStyle.lineType, LineType.dashed);
      expect(restored.linkStyle.lineWidth, 2);
    });

    test('round-trip with custom data codec', () {
      final original = LinkData<Map<String, int>>(
        id: 'l1',
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
        linkPoints: [Offset.zero, const Offset(1, 1)],
        data: {'weight': 5},
      );

      final json = original.toJson(encodeData: (d) => d);
      final restored = LinkData<Map<String, int>>.fromJson(
        json,
        decodeData: (j) => j.cast<String, int>(),
      );

      expect(restored.data, {'weight': 5});
    });

    test('round-trip without custom data omits dynamic_data', () {
      final link = LinkData<void>(
        id: 'l1',
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
        linkPoints: [Offset.zero, const Offset(1, 1)],
      );

      final json = link.toJson();
      expect(json['dynamic_data'], isNull);

      // Verify deserialization succeeds without data
      final restored = LinkData<void>.fromJson(json);
      expect(restored.id, 'l1');
    });
  });
}

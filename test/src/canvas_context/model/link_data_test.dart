import 'package:diagram_editor/src/canvas_context/model/link_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Tests can be run only all at once, not individually !!!
  group('Link data tests', () {
    var linkData = LinkData(
      id: 'id',
      sourceComponentId: 'sourceComponentId',
      targetComponentId: 'targetComponentId',
      linkPoints: [
        const Offset(0, 0),
        const Offset(100, 0),
      ],
    );

    test('Init linkData', () {
      expect(linkData.linkPoints.length, 2);
      expect(linkData.linkPoints, [
        const Offset(0, 0),
        const Offset(100, 0),
      ]);
    });

    test('Set start/end point of the link', () {
      linkData.setStart(const Offset(20, 0));
      linkData.setEnd(const Offset(120, 0));
      expect(linkData.linkPoints, [
        const Offset(20, 0),
        const Offset(120, 0),
      ]);
    });

    test('Insert middle point', () {
      linkData.insertMiddlePoint(const Offset(50, 0), 1);
      expect(linkData.linkPoints, [
        const Offset(20, 0),
        const Offset(50, 0),
        const Offset(120, 0),
      ]);
    });

    test('Set middle point position', () {
      linkData.setMiddlePointPosition(const Offset(70, 0), 1);
      expect(linkData.linkPoints, [
        const Offset(20, 0),
        const Offset(70, 0),
        const Offset(120, 0),
      ]);
    });

    test('Move middle point', () {
      linkData.moveMiddlePoint(const Offset(20, 0), 2);
      expect(linkData.linkPoints, [
        const Offset(20, 0),
        const Offset(70, 0),
        const Offset(140, 0),
      ]);
    });

    test('Update all middle points', () {
      linkData.insertMiddlePoint(const Offset(75, 0), 1);
      linkData.moveAllMiddlePoints(const Offset(10, 0));
      expect(linkData.linkPoints, [
        const Offset(20, 0),
        const Offset(85, 0),
        const Offset(80, 0),
        const Offset(140, 0),
      ]);
    });

    test('Remove middle point', () {
      linkData.removeMiddlePoint(1);
      expect(linkData.linkPoints, [
        const Offset(20, 0),
        const Offset(80, 0),
        const Offset(140, 0),
      ]);
    });
  });
}

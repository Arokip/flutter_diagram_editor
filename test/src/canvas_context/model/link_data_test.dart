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
        Offset(0, 0),
        Offset(100, 0),
      ],
    );

    test('Init linkData', () {
      expect(linkData.linkPoints.length, 2);
      expect(linkData.linkPoints, [
        Offset(0, 0),
        Offset(100, 0),
      ]);
    });

    test('Set start/end point of the link', () {
      linkData.setStart(Offset(20, 0));
      linkData.setEnd(Offset(120, 0));
      expect(linkData.linkPoints, [
        Offset(20, 0),
        Offset(120, 0),
      ]);
    });

    test('Insert middle point', () {
      linkData.insertMiddlePoint(Offset(50, 0), 1);
      expect(linkData.linkPoints, [
        Offset(20, 0),
        Offset(50, 0),
        Offset(120, 0),
      ]);
    });

    test('Set middle point position', () {
      linkData.setMiddlePointPosition(Offset(70, 0), 1);
      expect(linkData.linkPoints, [
        Offset(20, 0),
        Offset(70, 0),
        Offset(120, 0),
      ]);
    });

    test('Move middle point', () {
      linkData.moveMiddlePoint(Offset(20, 0), 2);
      expect(linkData.linkPoints, [
        Offset(20, 0),
        Offset(70, 0),
        Offset(140, 0),
      ]);
    });

    test('Update all middle points', () {
      linkData.insertMiddlePoint(Offset(75, 0), 1);
      linkData.moveAllMiddlePoints(Offset(10, 0));
      expect(linkData.linkPoints, [
        Offset(20, 0),
        Offset(85, 0),
        Offset(80, 0),
        Offset(140, 0),
      ]);
    });

    test('Remove middle point', () {
      linkData.removeMiddlePoint(1);
      expect(linkData.linkPoints, [
        Offset(20, 0),
        Offset(80, 0),
        Offset(140, 0),
      ]);
    });
  });
}

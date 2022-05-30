import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:diagram_editor/src/canvas_context/model/connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Component data tests', () {
    test(
        'Given ComponentData with two connections When one connection is removed Then component contains only the second connection.',
        () {
      var componentData = ComponentData();
      componentData.addConnection(ConnectionIn(
          otherComponentId: 'componentId1', connectionId: 'connectionId1'));
      componentData.addConnection(ConnectionIn(
          otherComponentId: 'componentId2', connectionId: 'connectionId2'));

      expect(componentData.connections.length, 2);

      componentData.removeConnection('connectionId1');

      expect(componentData.connections.length, 1);
      expect(componentData.connections.single.connectionId, 'connectionId2');
    });

    test('Point on a component test', () {
      var componentData = ComponentData(size: Size(100, 100));

      var alignment1 = Alignment(0, 0);
      var alignment2 = Alignment(1, 0);
      var alignment3 = Alignment(-1, -1);
      var alignment4 = Alignment(-0.5, 0.5);

      var point1 = componentData.getPointOnComponent(alignment1);
      var point2 = componentData.getPointOnComponent(alignment2);
      var point3 = componentData.getPointOnComponent(alignment3);
      var point4 = componentData.getPointOnComponent(alignment4);

      expect(point1, Offset(50, 50));
      expect(point2, Offset(100, 50));
      expect(point3, Offset(0, 0));
      expect(point4, Offset(25, 75));
    });

    test('Resize component test', () {
      var componentData = ComponentData(size: Size(100, 100));

      componentData.resizeDelta(Offset(10, -10));

      expect(componentData.size, Size(110, 90));

      componentData.resizeDelta(Offset(-110, -1000));

      expect(componentData.size, componentData.minSize);
    });
  });
}

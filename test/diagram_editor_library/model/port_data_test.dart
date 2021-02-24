import 'package:flutter_diagram_editor/diagram_editor_library/model/port_connection.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Port data tests', () {
    var portData = PortData(
      id: '0',
      portType: 'A',
    );

    var connectionIn = PortConnectionIn(
      linkId: 'linkId',
      componentId: 'componentId',
      portId: '0',
    );

    test('Init portData', () {
      expect(portData.connections.length, 0);
    });

    test('Add port connection', () {
      portData.addConnection(connectionIn);
      expect(portData.connections.length, 1);
      expect(portData.containsConnection('linkId'), true);
    });

    test('Remove and remove port connection', () {
      portData.removeConnection('linkId');
      expect(portData.connections.length, 0);
    });
  });
}

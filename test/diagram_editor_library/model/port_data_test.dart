import 'package:flutter_diagram_editor/diagram_editor_library/model/port_connection.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Port data tests', () {
    var portDataA = PortData(
      portType: 'A',
    );

    var connectionIn = PortConnectionIn(
      linkId: 'linkId',
      componentId: 'componentId',
      portId: 0,
    );

    test('Add and remove port connection', () {
      expect(portDataA.connections.length, 0);
      portDataA.addConnection(connectionIn);
      expect(portDataA.connections.length, 1);
      portDataA.removeConnection('linkId');
      expect(portDataA.connections.length, 0);
    });
  });
}

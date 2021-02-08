import 'package:flutter_diagram_editor/diagram_editor_library/model/port_connection.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Port rules tests', () {
    test('Port types allowed to connect', () {
      final PortRules portRules = PortRules();
      portRules.addRule('A', 'B');

      expect(portRules.portTypesAllowToConnect('A', 'B'), true);
      expect(portRules.portTypesAllowToConnect('B', 'A'), false);
      expect(portRules.portTypesAllowToConnect('A', 'A'), false);
      expect(portRules.portTypesAllowToConnect('B', 'B'), false);
      expect(portRules.portTypesAllowToConnect('C', 'D'), false);
    });

    test('Add more rules', () {
      final PortRules portRules = PortRules();

      portRules.addRules('A', ['A', 'B', 'C']);
      portRules.addRules('B', ['A', 'B', 'C']);
      portRules.addRules('C', ['C']);

      expect(portRules.portTypesAllowToConnect('A', 'A'), true);
      expect(portRules.portTypesAllowToConnect('A', 'B'), true);
      expect(portRules.portTypesAllowToConnect('A', 'C'), true);

      expect(portRules.portTypesAllowToConnect('B', 'A'), true);
      expect(portRules.portTypesAllowToConnect('B', 'B'), true);
      expect(portRules.portTypesAllowToConnect('B', 'C'), true);

      expect(portRules.portTypesAllowToConnect('C', 'A'), false);
      expect(portRules.portTypesAllowToConnect('C', 'B'), false);
      expect(portRules.portTypesAllowToConnect('C', 'C'), true);
    });

    test('Are ports already connected', () {
      final PortRules portRules = PortRules();
      var portOut = PortData(
        portType: 'A',
      );
      var portIn = PortData(
        portType: 'B',
      );
      portOut.setId(0);
      portOut.setComponentId('componentIdA');
      portIn.setId(1);
      portIn.setComponentId('componentIdB');

      expect(portRules.arePortsConnected(portIn, portOut), false);

      portOut.addConnection(
        PortConnectionOut(
          linkId: 'linkId',
          componentId: 'componentIdB',
          portId: portIn.id,
        ),
      );
      portIn.addConnection(
        PortConnectionIn(
          linkId: 'linkId',
          componentId: 'componentIdA',
          portId: portOut.id,
        ),
      );
      expect(portRules.arePortsConnected(portOut, portIn), true);
    });

    test('Max connection limit', () {
      final PortRules portRules = PortRules();

      var port = PortData(
        portType: 'A',
      );
      port.setId(0);
      port.setComponentId('component0');

      portRules.setMaxConnectionCount('A', 2);

      expect(port.connections.length, 0);
      expect(portRules.hasLessThanMaxConnections(port), true);

      port.addConnection(
        PortConnectionOut(
          linkId: 'link1',
          componentId: 'component1',
          portId: 1,
        ),
      );

      expect(portRules.hasLessThanMaxConnections(port), true);

      port.addConnection(
        PortConnectionOut(
          linkId: 'link2',
          componentId: 'component2',
          portId: 2,
        ),
      );

      expect(portRules.hasLessThanMaxConnections(port), false);
    });
  });

  test('Can connect ports on the same component', () {
    final PortRules portRules = PortRules();
    var portA = PortData(
      portType: 'A',
    );
    var portB = PortData(
      portType: 'B',
    );
    var portC = PortData(
      portType: 'C',
    );
    portA.setId(0);
    portA.setComponentId('component');
    portB.setId(1);
    portB.setComponentId('component');
    portC.setId(0);
    portC.setComponentId('different');

    expect(portRules.canConnectIfSameComponent(portA, portB), false);

    expect(portRules.canConnectIfSameComponent(portA, portC), true);

    portRules.canConnectSameComponent = true;

    expect(portRules.canConnectIfSameComponent(portA, portB), true);

    expect(portRules.canConnectIfSameComponent(portA, portC), true);
  });
}

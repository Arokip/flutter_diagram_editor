import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_connection.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Canvas model tests', () {
    ComponentData getTestComponentData(String portType) {
      return ComponentData(
        componentBodyName: 'test_body',
        portList: [
          PortData(
            id: '0',
            portType: portType,
          )
        ],
      );
    }

    test('Given new canvas When no action Then canvas contains no components',
        () {
      CanvasModel model = CanvasModel();

      expect(model.componentDataMap.length, 0);
    });

    test(
        'Given new canvas When added one component Then canvas contains one component',
        () {
      CanvasModel model = CanvasModel();

      model.addComponent(getTestComponentData('A'));

      expect(model.componentDataMap.length, 1);
    });

    test(
        'Given canvas with two components with one port each When the two ports are connected Then one link exists and the connections correspond',
        () {
      CanvasModel model = CanvasModel();

      model.portRules.addRule('A', 'B');

      var componentDataA = getTestComponentData('A');
      var componentDataB = getTestComponentData('B');

      model.addComponent(componentDataA);
      model.addComponent(componentDataB);

      model.tryToConnectTwoPorts(
          componentDataA.ports.values.first, componentDataB.ports.values.first);

      expect(model.selectedItem, model.deselectItem);
      expect(model.linkDataMap.length, 1);

      var link = model.linkDataMap.values.first;
      var connectionsA = componentDataA.ports.values.first.connections;
      var connectionsB = componentDataB.ports.values.first.connections;
      expect(connectionsA.length, 1);
      expect(connectionsB.length, 1);

      expect(connectionsA.first.connectionId, link.id);
      expect(connectionsB.first.connectionId, link.id);

      expect(connectionsA.first is PortConnectionOut, true);
      expect(connectionsB.first is PortConnectionIn, true);
    });

    test(
        'Given canvas with two components with one port each When trying to connect port against port rules Then no link and no connections are created',
        () {
      CanvasModel model = CanvasModel();

      model.portRules.addRule('A', 'C');

      var componentDataA = getTestComponentData('A');
      var componentDataB = getTestComponentData('B');

      model.addComponent(componentDataA);
      model.addComponent(componentDataB);

      model.tryToConnectTwoPorts(
          componentDataA.ports.values.first, componentDataB.ports.values.first);

      expect(model.linkDataMap.length, 0);

      var connectionsA = componentDataA.ports.values.first.connections;
      var connectionsB = componentDataB.ports.values.first.connections;
      expect(connectionsA.length, 0);
      expect(connectionsB.length, 0);
    });

    test(
        'Given canvas with two connected components When the link is removed Then no links exist and ports have no connections',
        () {
      CanvasModel model = CanvasModel();

      model.portRules.addRule('A', 'B');

      var componentDataA = getTestComponentData('A');
      var componentDataB = getTestComponentData('B');

      model.addComponent(componentDataA);
      model.addComponent(componentDataB);

      model.tryToConnectTwoPorts(
          componentDataA.ports.values.first, componentDataB.ports.values.first);

      var link = model.linkDataMap.values.first;

      model.removeLink(link);

      expect(model.linkDataMap.length, 0);

      var connectionsA = componentDataA.ports.values.first.connections;
      var connectionsB = componentDataB.ports.values.first.connections;

      expect(connectionsA.length, 0);
      expect(connectionsB.length, 0);
    });

    test(
        'Given canvas with two connected components When the connection is removed on one component Then no links exist and ports have no connections',
        () {
      CanvasModel model = CanvasModel();

      model.portRules.addRule('A', 'B');

      var componentDataA = getTestComponentData('A');
      var componentDataB = getTestComponentData('B');

      model.addComponent(componentDataA);
      model.addComponent(componentDataB);

      model.tryToConnectTwoPorts(
          componentDataA.ports.values.first, componentDataB.ports.values.first);

      model.removeComponentConnections(componentDataA.id);

      expect(model.linkDataMap.length, 0);

      var connectionsA = componentDataA.ports.values.first.connections;
      var connectionsB = componentDataB.ports.values.first.connections;

      expect(connectionsA.length, 0);
      expect(connectionsB.length, 0);
    });

    test(
        'Given canvas with one component When the component is duplicated Then canvas contains two components with correct position',
        () {
      CanvasModel model = CanvasModel();

      var componentDataA = getTestComponentData('A');
      var offset = Offset(40, 80);

      model.addComponent(componentDataA);

      model.duplicateComponent(componentDataA.id, offset);

      expect(model.componentDataMap.values.length, 2);

      var componentDuplicate = model.componentDataMap.values
          .where((element) => element.id != componentDataA.id)
          .first;

      expect(componentDuplicate.ports.length, 1);

      expect(componentDuplicate.ports.values.first.componentId,
          componentDuplicate.id);

      expect(componentDuplicate.position, componentDataA.position + offset);
    });

    test(
        'Given canvas with one component When the component is duplicated below Then canvas contains two components with correct position',
        () {
      CanvasModel model = CanvasModel();

      var componentDataA = getTestComponentData('A');
      var offset = Offset(40, 80);

      model.addComponent(componentDataA);

      model.duplicateComponentBelow(componentDataA.id, offset);

      expect(model.componentDataMap.values.length, 2);

      var componentDuplicate = model.componentDataMap.values
          .where((element) => element.id != componentDataA.id)
          .first;

      expect(componentDuplicate.ports.length, 1);

      expect(componentDuplicate.ports.values.first.componentId,
          componentDuplicate.id);

      expect(
        componentDuplicate.position,
        componentDataA.position +
            Offset(0, componentDataA.size.height) +
            offset,
      );
    });

    test(
        'Given canvas with one component When the component is duplicated next to it Then canvas contains two components with correct position',
        () {
      CanvasModel model = CanvasModel();

      var componentDataA = getTestComponentData('A');
      var offset = Offset(40, 80);

      model.addComponent(componentDataA);

      model.duplicateComponentNextTo(componentDataA.id, offset);

      expect(model.componentDataMap.values.length, 2);

      var componentDuplicate = model.componentDataMap.values
          .where((element) => element.id != componentDataA.id)
          .first;

      expect(componentDuplicate.ports.length, 1);

      expect(componentDuplicate.ports.values.first.componentId,
          componentDuplicate.id);

      expect(
        componentDuplicate.position,
        componentDataA.position + Offset(componentDataA.size.width, 0) + offset,
      );
    });
  });
}

import 'package:diagram_editor/diagram_editor.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base/policy_set.dart';
import 'package:diagram_editor/src/canvas_context/canvas_model.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Canvas model tests', () {
    test('Given new canvas When no action Then canvas contains no components',
        () {
      PolicySet policySet = PolicySet();
      var model = CanvasModel(policySet);

      expect(model.components.isEmpty, true);
    });

    test(
        'Given new canvas When added one component Then canvas contains one component',
        () {
      PolicySet policySet = PolicySet();
      var model = CanvasModel(policySet);
      ComponentData componentData = ComponentData();

      model.addComponent(componentData);

      expect(model.components.length, 1);
    });

    test(
        'Given canvas with one component When the component is removed Then canvas contains no components',
        () {
      PolicySet policySet = PolicySet();
      var model = CanvasModel(policySet);
      ComponentData componentData = ComponentData();

      String componentId = model.addComponent(componentData);

      model.removeComponent(componentId);

      expect(model.components.isEmpty, true);
    });

    test(
        'Given canvas with two components When the components are connected Then one link exists and the connections correspond',
        () {
      PolicySet policySet = PolicySet();
      var model = CanvasModel(policySet);

      ComponentData componentDataA = ComponentData();
      ComponentData componentDataB = ComponentData();

      model.addComponent(componentDataA);
      model.addComponent(componentDataB);

      String linkId = model.connectTwoComponents(
          componentDataA.id, componentDataB.id, LinkStyle(), null);

      expect(model.links.length, 1);

      var connectionsA = componentDataA.connections;
      var connectionsB = componentDataB.connections;
      expect(connectionsA.length, 1);
      expect(connectionsB.length, 1);

      expect(connectionsA.single.connectionId, linkId);
      expect(connectionsB.single.connectionId, linkId);

      expect(connectionsA.single is ConnectionOut, true);
      expect(connectionsB.single is ConnectionIn, true);

      expect(model.getLink(linkId).id, linkId);
    });

    test(
        'Given canvas with two connected components When the existing link is removed Then no links exist and components have no connections',
        () {
      PolicySet policySet = PolicySet();
      var model = CanvasModel(policySet);

      ComponentData componentDataA = ComponentData();
      ComponentData componentDataB = ComponentData();

      model.addComponent(componentDataA);
      model.addComponent(componentDataB);

      String linkId = model.connectTwoComponents(
          componentDataA.id, componentDataB.id, LinkStyle(), null);

      model.removeLink(linkId);

      expect(model.links.length, 0);

      var connectionsA = componentDataA.connections;
      var connectionsB = componentDataB.connections;

      expect(connectionsA.length, 0);
      expect(connectionsB.length, 0);
    });

    test(
        'Given canvas with two components connected to third one When the connection is removed on the third component Then no links exist and components have no connections',
        () {
      PolicySet policySet = PolicySet();
      var model = CanvasModel(policySet);

      ComponentData componentDataA = ComponentData();
      ComponentData componentDataB = ComponentData();
      ComponentData componentDataC = ComponentData();

      model.addComponent(componentDataA);
      model.addComponent(componentDataB);
      model.addComponent(componentDataC);

      model.connectTwoComponents(
          componentDataA.id, componentDataC.id, LinkStyle(), null);
      model.connectTwoComponents(
          componentDataC.id, componentDataB.id, LinkStyle(), null);

      model.removeComponentConnections(componentDataC.id);

      expect(model.links.length, 0);

      expect(componentDataA.connections.length, 0);
      expect(componentDataB.connections.length, 0);
      expect(componentDataC.connections.length, 0);
    });
  });
}

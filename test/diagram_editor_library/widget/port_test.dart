import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_body.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/custom_component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/canvas.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/port.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/port_highlight.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  // Tests can be run only all at once, not individually !!!
  group('Manipulating one component on canvas', () {
    CanvasModel model = CanvasModel();

    var material = MaterialApp(
      home: ChangeNotifierProvider<CanvasModel>.value(
          value: model,
          child: Container(
            width: 200,
            height: 200,
            child: DiagramEditorCanvas(),
          )),
    );

    model.addNewComponentBody(
      "test_body",
      ComponentBody(
        menuComponentBody: Container(),
        componentBody: Text('test_component'),
        fromJsonCustomData: (json) => EmptyCustomComponentData.fromJson(json),
      ),
    );

    model.portRules.addRule('A', 'A');

    var firstComponentData = ComponentData(
      componentBodyName: 'test_body',
      size: Size(40, 40),
      position: Offset.zero,
      portList: [
        PortData(
          portType: 'A',
        )
      ],
    );

    var secondComponentData = ComponentData(
      componentBodyName: 'test_body',
      size: Size(40, 40),
      position: Offset(40, 0),
      portList: [
        PortData(
          portType: 'A',
        )
      ],
    );

    testWidgets(
        'Given component with one port When added to canvas Then exactly one port exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);
      print('first test');

      model.addComponentToMap(firstComponentData);

      await tester.pump();

      expect(find.byType(Port), findsOneWidget);
    });

    testWidgets(
        'Given two ports When connected Then connections have correct ids',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      model.addComponentToMap(secondComponentData);

      await tester.pump();

      expect(find.byType(Port), findsNWidgets(2));

      await tester.tap(find.byType(Port).first);
      await tester.tap(find.byType(Port).last);

      await tester.pump();

      var firstComponent = model.componentDataMap.values.first;
      var secondComponent = model.componentDataMap.values.last;

      var firstPort = firstComponent.ports.values.first;
      var secondPort = secondComponent.ports.values.last;

      expect(firstPort.connections.length, 1);
      expect(secondPort.connections.length, 1);

      expect(
          firstPort.connections.single.componentId == secondComponent.id, true);
      expect(
          secondPort.connections.single.componentId == firstComponent.id, true);

      expect(firstPort.connections.single.portId == secondPort.id, true);
      expect(secondPort.connections.single.portId == firstPort.id, true);
    });

    testWidgets(
        'Given two ports and no connections When one port is tapped Then two highlights are shown',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      model.removeAllConnections();

      await tester.tap(find.byType(Port).first);

      await tester.pump();

      expect(find.byType(PortHighlight), findsNWidgets(2));
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_body.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/custom_component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/canvas.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/component.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/link.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/port.dart';
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
        'Given two components with a port in their center When ports are connected Then link is created',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      model.addComponentToMap(firstComponentData);
      model.addComponentToMap(secondComponentData);

      await tester.pump();

      expect(find.byType(Port), findsNWidgets(2));

      await tester.tap(find.byType(Port).first);
      await tester.tap(find.byType(Port).last);

      await tester.pump();

      expect(find.byType(Link), findsOneWidget);
    });
  });
}

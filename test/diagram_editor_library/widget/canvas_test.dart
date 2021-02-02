import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_body.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/custom_component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/canvas.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/component.dart';
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

    var componentData = ComponentData(
      componentBodyName: 'test_body',
      portList: [
        PortData(
          portType: 'A',
        )
      ],
    );

    testWidgets(
        'Given new canvas When no action Then canvas contains no components',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);
      expect(find.byType(Component), findsNothing);
    });

    testWidgets(
        'Given canvas with no components When component is added Then canvas contains that one component',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      model.addComponentToMap(componentData);

      await tester.pump();
      expect(find.byType(Component), findsOneWidget);
      expect(find.text('test_component'), findsOneWidget);
    });

    testWidgets(
        'Given canvas with one component When component is removed Then canvas contains no components',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      expect(find.byType(Component), findsOneWidget);
      expect(find.text('test_component'), findsOneWidget);

      model.removeComponentFromList(componentData.id);

      await tester.pump();
      expect(find.byType(Component), findsNothing);
      expect(find.text('test_component'), findsNothing);
    });

    testWidgets(
        'Given canvas with one component When component is duplicated Then canvas contains two components with correct position',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      model.addComponentToMap(componentData);
      model.duplicateComponent(componentData.id, Offset(100, 100));

      await tester.pump();

      var secondComponent = model.componentDataMap.values
          .singleWhere((data) => data.id != componentData.id);

      expect(find.byType(Component), findsNWidgets(2));
      expect(model.componentDataMap.values.length, 2);
      expect(secondComponent.position, Offset(100, 100));
    });

    testWidgets(
        'Given canvas with two components When canvas is translated Then canvas still contains two components',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      model.updateCanvasPosition(Offset(10, 0));

      await tester.pump();

      expect(find.byType(Component), findsNWidgets(2));
    });

    testWidgets(
        'Given canvas with two components When canvas is scaled Then canvas still contains two components',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      model.updateCanvasScale(1.5);

      await tester.pump();

      expect(find.byType(Component), findsNWidgets(2));
    });
  });
}

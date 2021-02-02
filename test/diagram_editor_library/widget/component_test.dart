import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_body.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/custom_component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/canvas.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/component.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/widget/component_highlight.dart';
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

    var firstComponentData = ComponentData(
      componentBodyName: 'test_body',
      size: Size(40, 40),
      position: Offset.zero,
    );

    var secondComponentData = ComponentData(
      componentBodyName: 'test_body',
      size: Size(40, 40),
      position: Offset(40, 0),
    );

    testWidgets(
        'Given two components When one is translated Then there are still two components',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      model.addComponentToMap(firstComponentData);
      model.addComponentToMap(secondComponentData);

      await tester.pump();

      expect(find.byType(Component), findsNWidgets(2));

      secondComponentData.updateComponentDataPosition(Offset(10, 0));

      await tester.pump();

      expect(find.byType(Component), findsNWidgets(2));
    });

    testWidgets(
        'Given two components When one is tapped Then one component highlight is shown',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      expect(find.byType(Component), findsNWidgets(2));

      await tester.tap(find.byType(Component).first);

      await tester.pump();

      expect(find.byType(ComponentHighlight), findsOneWidget);
    });

    testWidgets(
        'Given two components, one of them highlighted When the another is tapped Then one component highlight is shown',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      expect(find.byType(ComponentHighlight), findsOneWidget);

      await tester.tap(find.byType(Component).last);

      await tester.pump();

      expect(find.byType(ComponentHighlight), findsOneWidget);
    });

    testWidgets(
        'Given two components When highlighted component is translated Then one component highlight is shown',
        (WidgetTester tester) async {
      await tester.pumpWidget(material);

      expect(find.byType(ComponentHighlight), findsOneWidget);

      secondComponentData.updateComponentDataPosition(Offset(10, 0));

      await tester.pump();

      expect(find.byType(ComponentHighlight), findsOneWidget);
    });
  });
}

import 'package:diagram_editor/src/abstraction_layer/policy/base/policy_set.dart';
import 'package:diagram_editor/src/canvas_context/diagram_editor_context.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:diagram_editor/src/widget/component.dart';
import 'package:diagram_editor/src/widget/editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Tests can be run only all at once, not individually !!!
  group('Component widget tests', () {
    PolicySet policySet = PolicySet();

    var editor = MaterialApp(
      home: DiagramEditor(
        diagramEditorContext: DiagramEditorContext(
          policySet: policySet,
        ),
      ),
    );

    var componentData = ComponentData(
      size: const Size(40, 40),
      position: const Offset(10, 10),
    );

    testWidgets('Given one component When the component is moved Then there is still one component',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      policySet.canvasWriter.model.addComponent(componentData);

      await tester.pump();

      expect(find.byType(Component), findsOneWidget);

      componentData.move(const Offset(10, 0));

      await tester.pump();

      expect(find.byType(Component), findsOneWidget);
    });

    testWidgets('Given one component When new position is set to the component Then there is still one component',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      expect(find.byType(Component), findsOneWidget);

      componentData.setPosition(const Offset(0, 10));

      await tester.pump();

      expect(find.byType(Component), findsOneWidget);
    });

    testWidgets('Given one component When the component is resized Then there is still one component',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      expect(find.byType(Component), findsOneWidget);

      componentData.resizeDelta(const Offset(10, 10));

      await tester.pump();

      expect(find.byType(Component), findsOneWidget);
    });
  });
}

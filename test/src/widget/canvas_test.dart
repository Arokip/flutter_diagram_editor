import 'package:diagram_editor/diagram_editor.dart';
import 'package:diagram_editor/src/widget/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Tests can be run only all at once, not individually !!!
  group('Canvas tests', () {
    PolicySet policySet = PolicySet();

    var editor = MaterialApp(
      home: DiagramEditor(
        diagramEditorContext: DiagramEditorContext(
          policySet: policySet,
        ),
      ),
    );

    ComponentData componentData = ComponentData();
    ComponentData componentData2 = ComponentData();

    testWidgets('Given new canvas When no action Then canvas contains no components', (WidgetTester tester) async {
      await tester.pumpWidget(editor);
      expect(find.byType(Component), findsNothing);
    });

    testWidgets('Given canvas with no components When component is added Then canvas contains that one component',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      policySet.canvasWriter.model.addComponent(componentData);

      await tester.pump();
      expect(find.byType(Component), findsOneWidget);
    });

    testWidgets('Given canvas with one component When component is removed Then canvas contains no components',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      expect(find.byType(Component), findsOneWidget);

      policySet.canvasWriter.model.removeComponent(componentData.id);

      await tester.pump();
      expect(find.byType(Component), findsNothing);
    });

    testWidgets(
        'Given canvas with one component with a child When component is removed with children Then canvas contains no components',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      String id1 = policySet.canvasWriter.model.addComponent(componentData);
      String id2 = policySet.canvasWriter.model.addComponent(componentData2);
      policySet.canvasWriter.model.setComponentParent(id2, id1);

      await tester.pump();

      expect(find.byType(Component), findsNWidgets(2));

      policySet.canvasWriter.model.removeComponentWithChildren(id1);

      await tester.pump();
      expect(find.byType(Component), findsNothing);
    });

    testWidgets(
        'Given canvas with one component When position is set to canvas Then canvas still contains one component',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      policySet.canvasWriter.model.addComponent(componentData);
      await tester.pump();

      policySet.canvasWriter.state.setPosition(const Offset(10, 0));

      await tester.pump();

      expect(find.byType(Component), findsOneWidget);
    });

    testWidgets(
        'Given canvas with one component When canvas position is updated Then canvas still contains one component',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      policySet.canvasWriter.state.setPosition(const Offset(10, 0));

      await tester.pump();

      expect(find.byType(Component), findsOneWidget);
    });

    testWidgets('Given canvas with one component When scale is set to canvas Then canvas still contains one component',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      policySet.canvasWriter.state.setScale(1.5);

      await tester.pump();

      expect(find.byType(Component), findsOneWidget);
    });

    testWidgets('Given canvas with one component When canvas scale is updated Then canvas still contains one component',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      policySet.canvasWriter.state.updateScale(1.5);

      await tester.pump();

      expect(find.byType(Component), findsOneWidget);
    });
  });
}

import 'package:diagram_editor/src/abstraction_layer/policy/base/policy_set.dart';
import 'package:diagram_editor/src/canvas_context/diagram_editor_context.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:diagram_editor/src/widget/component.dart';
import 'package:diagram_editor/src/widget/editor.dart';
import 'package:diagram_editor/src/widget/link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Tests can be run only all at once, not individually !!!
  group('Link widget tests', () {
    PolicySet policySet = PolicySet();

    late String linkId;

    var editor = MaterialApp(
      home: DiagramEditor(
        diagramEditorContext: DiagramEditorContext(
          policySet: policySet,
        ),
      ),
    );

    var componentData1 = ComponentData(
      size: const Size(40, 40),
      position: const Offset(20, 0),
    );

    var componentData2 = ComponentData(
      size: const Size(40, 40),
      position: const Offset(120, 0),
    );

    testWidgets('Given two components When components are connected Then a link is created',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      policySet.canvasWriter.model.addComponent(componentData1);
      policySet.canvasWriter.model.addComponent(componentData2);

      await tester.pump();

      expect(find.byType(Component), findsNWidgets(2));

      linkId = policySet.canvasWriter.model.connectTwoComponents(
        sourceComponentId: componentData1.id,
        targetComponentId: componentData2.id,
      );

      await tester.pump();

      expect(find.byType(Link), findsOneWidget);
    });

    testWidgets(
        'Given two connected components When link middle point is added Then there is still one link and two components',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      expect(find.byType(Component), findsNWidgets(2));
      expect(find.byType(Link), findsOneWidget);

      policySet.canvasWriter.model.insertLinkMiddlePoint(linkId, const Offset(20, 20), 1);

      await tester.pump();

      expect(find.byType(Component), findsNWidgets(2));
      expect(find.byType(Link), findsOneWidget);
    });

    testWidgets(
        'Given two connected components with a link with middle point When link middle point is moved Then there is still one link and two components',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      expect(find.byType(Component), findsNWidgets(2));
      expect(find.byType(Link), findsOneWidget);

      policySet.canvasWriter.model.moveLinkMiddlePoint(linkId, const Offset(20, 20), 1);

      await tester.pump();

      expect(find.byType(Component), findsNWidgets(2));
      expect(find.byType(Link), findsOneWidget);
    });

    testWidgets(
        'Given two connected components with a link with middle point When link middle point is removed Then there is still one link and two components',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      expect(find.byType(Component), findsNWidgets(2));
      expect(find.byType(Link), findsOneWidget);

      policySet.canvasWriter.model.removeLinkMiddlePoint(linkId, 1);

      await tester.pump();

      expect(find.byType(Component), findsNWidgets(2));
      expect(find.byType(Link), findsOneWidget);
    });

    testWidgets('Given two connected components When the link is removed Then there is no link and two components',
        (WidgetTester tester) async {
      await tester.pumpWidget(editor);

      expect(find.byType(Component), findsNWidgets(2));

      policySet.canvasWriter.model.removeLink(linkId);

      await tester.pump();

      expect(find.byType(Link), findsNothing);
      expect(find.byType(Component), findsNWidgets(2));
    });
  });
}

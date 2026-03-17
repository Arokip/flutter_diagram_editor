import 'package:diagram_editor/src/controller/diagram_controller.dart';
import 'package:diagram_editor/src/model/component_data.dart';
import 'package:diagram_editor/src/widget/component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ComponentWidget', () {
    testWidgets('positions component based on controller state', (
      tester,
    ) async {
      final controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'c1',
            position: const Offset(50, 100),
            size: const Size(80, 60),
          ),
        );
      final componentData = controller.getComponent('c1');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 500,
              height: 500,
              child: Stack(
                children: [
                  ComponentWidget<void, void>(
                    controller: controller,
                    componentData: componentData,
                    componentBuilder: (context, data) {
                      return Container(color: Colors.blue);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // At scale=1, position=(0,0), the component should be at (50, 100)
      // The outer Positioned is the one with component placement
      final positioned = tester.widget<Positioned>(
        find.byType(Positioned).first,
      );
      expect(positioned.left, 50);
      expect(positioned.top, 100);
      expect(positioned.width, 80);
      expect(positioned.height, 60);
    });

    testWidgets('calls componentBuilder with correct data', (tester) async {
      final controller = DiagramController<String, void>()
        ..addComponent(
          ComponentData<String>(
            id: 'c1',
            position: const Offset(10, 10),
            size: const Size(100, 100),
            data: 'hello',
          ),
        );
      final componentData = controller.getComponent('c1');

      String? receivedData;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 500,
              height: 500,
              child: Stack(
                children: [
                  ComponentWidget<String, void>(
                    controller: controller,
                    componentData: componentData,
                    componentBuilder: (context, data) {
                      receivedData = data.data;
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(receivedData, 'hello');
    });

    testWidgets('onComponentTap fires with id', (tester) async {
      final controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'c1',
            size: const Size(200, 200),
          ),
        );
      final componentData = controller.getComponent('c1');
      String? tappedId;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 500,
              height: 500,
              child: Stack(
                children: [
                  ComponentWidget<void, void>(
                    controller: controller,
                    componentData: componentData,
                    componentBuilder: (context, data) {
                      return Container(color: Colors.blue);
                    },
                    onComponentTap: (id) {
                      tappedId = id;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.tapAt(const Offset(50, 50));
      await tester.pumpAndSettle();

      expect(tappedId, 'c1');
    });

    testWidgets('renders overlay when builder provided', (tester) async {
      final controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'c1',
            size: const Size(100, 100),
          ),
        );
      final componentData = controller.getComponent('c1');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 500,
              height: 500,
              child: Stack(
                children: [
                  ComponentWidget<void, void>(
                    controller: controller,
                    componentData: componentData,
                    componentBuilder: (context, data) {
                      return Container(color: Colors.blue);
                    },
                    componentOverlayBuilder: (context, data) {
                      return const Text('overlay');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('overlay'), findsOneWidget);
    });
  });
}

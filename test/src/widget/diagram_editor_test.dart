import 'package:diagram_editor/src/controller/canvas_config.dart';
import 'package:diagram_editor/src/controller/diagram_controller.dart';
import 'package:diagram_editor/src/model/component_data.dart';
import 'package:diagram_editor/src/widget/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiagramEditor', () {
    testWidgets('renders with empty controller', (tester) async {
      final controller = DiagramController<void, void>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DiagramEditor<void, void>(
              controller: controller,
              componentBuilder: (context, data) => const SizedBox(),
            ),
          ),
        ),
      );

      expect(find.byType(DiagramEditor<void, void>), findsOneWidget);
    });

    testWidgets('displays background color from config', (tester) async {
      final controller = DiagramController<void, void>(
        canvasConfig: const CanvasConfig(backgroundColor: Colors.red),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DiagramEditor<void, void>(
              controller: controller,
              componentBuilder: (context, data) => const SizedBox(),
            ),
          ),
        ),
      );

      final coloredBoxes = tester.widgetList<ColoredBox>(
        find.byType(ColoredBox),
      );
      final hasRed = coloredBoxes.any((cb) => cb.color == Colors.red);
      expect(hasRed, isTrue);
    });

    testWidgets('renders component from builder', (tester) async {
      final controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'c1',
            position: const Offset(10, 10),
            size: const Size(100, 50),
          ),
        );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 500,
              height: 500,
              child: DiagramEditor<void, void>(
                controller: controller,
                componentBuilder: (context, data) {
                  return const Text('component');
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('component'), findsOneWidget);
    });

    testWidgets('rebuilds when controller notifies', (tester) async {
      final controller = DiagramController<void, void>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 500,
              height: 500,
              child: DiagramEditor<void, void>(
                controller: controller,
                componentBuilder: (context, data) {
                  return const Text('node');
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('node'), findsNothing);

      controller.addComponent(
        ComponentData<void>(
          id: 'c1',
          position: const Offset(10, 10),
          size: const Size(100, 50),
        ),
      );

      await tester.pump();

      expect(find.text('node'), findsOneWidget);
    });

    testWidgets('onCanvasTapUp fires', (tester) async {
      final controller = DiagramController<void, void>();
      var tapFired = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 500,
              height: 500,
              child: DiagramEditor<void, void>(
                controller: controller,
                componentBuilder: (context, data) => const SizedBox(),
                onCanvasTapUp: (_) {
                  tapFired = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tapAt(const Offset(250, 250));
      await tester.pumpAndSettle();

      expect(tapFired, isTrue);
    });

    testWidgets('onInit is called once', (tester) async {
      final controller = DiagramController<void, void>();
      var initCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DiagramEditor<void, void>(
              controller: controller,
              componentBuilder: (context, data) => const SizedBox(),
              onInit: () {
                initCount++;
              },
            ),
          ),
        ),
      );

      expect(initCount, 1);
    });

    testWidgets('onComponentTap fires with correct id', (tester) async {
      final controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'c1',
            size: const Size(200, 200),
          ),
        );
      String? tappedId;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 500,
              height: 500,
              child: DiagramEditor<void, void>(
                controller: controller,
                componentBuilder: (context, data) {
                  return Container(color: Colors.blue);
                },
                onComponentTap: (id) {
                  tappedId = id;
                },
              ),
            ),
          ),
        ),
      );

      // Tap within the component area
      await tester.tapAt(const Offset(50, 50));
      await tester.pumpAndSettle();

      expect(tappedId, 'c1');
    });

    testWidgets('multiple components rendered in z-order', (tester) async {
      final controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'bottom',
            position: const Offset(10, 10),
            size: const Size(100, 100),
          ),
        )
        ..addComponent(
          ComponentData<void>(
            id: 'top',
            position: const Offset(20, 20),
            size: const Size(100, 100),
          ),
        )
        ..setComponentZOrder('bottom', 1)
        ..setComponentZOrder('top', 2);

      final builtIds = <String>[];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 500,
              height: 500,
              child: DiagramEditor<void, void>(
                controller: controller,
                componentBuilder: (context, data) {
                  builtIds.add(data.id);
                  return Container(color: Colors.blue);
                },
              ),
            ),
          ),
        ),
      );

      // Both components should be rendered
      expect(builtIds, hasLength(2));
      // Bottom z-order first (sorted ascending)
      expect(builtIds.first, 'bottom');
      expect(builtIds.last, 'top');
    });

    testWidgets(
      'disabling default pan/zoom does not create animation controller',
      (tester) async {
        final controller = DiagramController<void, void>();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramEditor<void, void>(
                controller: controller,
                componentBuilder: (context, data) => const SizedBox(),
                enableDefaultPanZoom: false,
              ),
            ),
          ),
        );

        expect(controller.animationController, isNull);
      },
    );
  });
}

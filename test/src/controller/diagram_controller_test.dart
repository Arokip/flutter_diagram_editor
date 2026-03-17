import 'package:diagram_editor/src/controller/canvas_config.dart';
import 'package:diagram_editor/src/controller/diagram_controller.dart';
import 'package:diagram_editor/src/model/component_data.dart';
import 'package:diagram_editor/src/model/connection.dart';
import 'package:diagram_editor/src/model/link_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiagramController - components', () {
    late DiagramController<void, void> controller;

    setUp(() {
      controller = DiagramController<void, void>();
    });

    test('addComponent adds and returns id', () {
      final id = controller.addComponent(
        ComponentData<void>(id: 'c1'),
      );
      expect(id, 'c1');
      expect(controller.componentExists('c1'), isTrue);
    });

    test('removeComponent removes component', () {
      controller
        ..addComponent(ComponentData<void>(id: 'c1'))
        ..removeComponent('c1');
      expect(controller.componentExists('c1'), isFalse);
    });

    test('removeAllComponents clears everything', () {
      controller
        ..addComponent(ComponentData<void>(id: 'c1'))
        ..addComponent(ComponentData<void>(id: 'c2'))
        ..removeAllComponents();
      expect(controller.components, isEmpty);
    });

    test('getComponent returns correct component', () {
      controller.addComponent(
        ComponentData<void>(
          id: 'c1',
          position: const Offset(10, 20),
        ),
      );
      final component = controller.getComponent('c1');
      expect(component.position, const Offset(10, 20));
    });

    test('moveComponent translates by offset / scale', () {
      controller
        ..addComponent(
          ComponentData<void>(
            id: 'c1',
            position: const Offset(10, 20),
          ),
        )
        ..moveComponent('c1', const Offset(5, 10));
      expect(
        controller.getComponent('c1').position,
        const Offset(15, 30),
      );
    });

    test('componentsSorted returns z-ordered list', () {
      controller
        ..addComponent(ComponentData<void>(id: 'c1'))
        ..addComponent(ComponentData<void>(id: 'c2'));
      controller.getComponent('c1').zOrder = 5;
      controller.getComponent('c2').zOrder = 1;

      final sorted = controller.componentsSorted;
      expect(sorted.first.id, 'c2');
      expect(sorted.last.id, 'c1');
    });
  });

  group('DiagramController - z-order', () {
    late DiagramController<void, void> controller;

    setUp(() {
      controller = DiagramController<void, void>()
        ..addComponent(ComponentData<void>(id: 'c1'))
        ..addComponent(ComponentData<void>(id: 'c2'))
        ..setComponentZOrder('c1', 1)
        ..setComponentZOrder('c2', 2);
    });

    test('bringToFront sets highest z-order + 1', () {
      controller.bringToFront('c1');
      expect(
        controller.getComponent('c1').zOrder,
        greaterThan(controller.getComponent('c2').zOrder),
      );
    });

    test('sendToBack sets lowest z-order - 1', () {
      controller.sendToBack('c2');
      expect(
        controller.getComponent('c2').zOrder,
        lessThan(controller.getComponent('c1').zOrder),
      );
    });
  });

  group('DiagramController - parent-child', () {
    late DiagramController<void, void> controller;

    setUp(() {
      controller = DiagramController<void, void>()
        ..addComponent(ComponentData<void>(id: 'parent'))
        ..addComponent(ComponentData<void>(id: 'child'));
    });

    test('setComponentParent establishes relationship', () {
      controller.setComponentParent('child', 'parent');
      expect(controller.getComponent('child').parentId, 'parent');
      expect(
        controller.getComponent('parent').childrenIds,
        contains('child'),
      );
    });

    test('removeComponentParent clears relationship', () {
      controller
        ..setComponentParent('child', 'parent')
        ..removeComponentParent('child');
      expect(controller.getComponent('child').parentId, isNull);
      expect(controller.getComponent('parent').childrenIds, isEmpty);
    });

    test('prevents parent-child loop', () {
      controller
        ..setComponentParent('child', 'parent')
        // Attempting to set parent as child of child should fail silently
        ..setComponentParent('parent', 'child');
      expect(controller.getComponent('parent').parentId, isNull);
    });
  });

  group('DiagramController - links', () {
    late DiagramController<void, void> controller;

    setUp(() {
      controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'c1',
            size: const Size(100, 100),
          ),
        )
        ..addComponent(
          ComponentData<void>(
            id: 'c2',
            position: const Offset(200, 200),
            size: const Size(100, 100),
          ),
        );
    });

    test('connect creates a link', () {
      final linkId = controller.connect(
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
      );
      expect(controller.linkExists(linkId), isTrue);
      expect(controller.getLink(linkId).sourceComponentId, 'c1');
      expect(controller.getLink(linkId).targetComponentId, 'c2');
    });

    test('connect adds connections to components', () {
      controller.connect(
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
      );
      expect(controller.getComponent('c1').connections, hasLength(1));
      expect(controller.getComponent('c2').connections, hasLength(1));
      expect(
        controller.getComponent('c1').connections.first,
        isA<OutgoingConnection>(),
      );
      expect(
        controller.getComponent('c2').connections.first,
        isA<IncomingConnection>(),
      );
    });

    test('removeLink removes link and connections', () {
      final linkId = controller.connect(
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
      );
      controller.removeLink(linkId);
      expect(controller.linkExists(linkId), isFalse);
      expect(controller.getComponent('c1').connections, isEmpty);
      expect(controller.getComponent('c2').connections, isEmpty);
    });

    test('removeComponent removes associated links', () {
      controller
        ..connect(
          sourceComponentId: 'c1',
          targetComponentId: 'c2',
        )
        ..removeComponent('c1');
      expect(controller.links, isEmpty);
    });

    test('connect with custom link style', () {
      final linkId = controller.connect(
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
        linkStyle: const LinkStyle(
          arrowType: ArrowType.arrow,
          lineWidth: 3,
        ),
      );
      expect(
        controller.getLink(linkId).linkStyle.arrowType,
        ArrowType.arrow,
      );
      expect(controller.getLink(linkId).linkStyle.lineWidth, 3);
    });
  });

  group('DiagramController - canvas state', () {
    test('initial state from config', () {
      final controller = DiagramController<void, void>(
        canvasConfig: const CanvasConfig(
          initialScale: 2,
          initialPosition: Offset(10, 20),
          backgroundColor: Colors.red,
        ),
      );
      expect(controller.canvasScale, 2);
      expect(controller.canvasPosition, const Offset(10, 20));
      expect(controller.canvasColor, Colors.red);
    });

    test('setCanvasPosition and panCanvas', () {
      final controller = DiagramController<void, void>()
        ..setCanvasPosition(const Offset(50, 50));
      expect(controller.canvasPosition, const Offset(50, 50));

      controller.panCanvas(const Offset(10, -5));
      expect(controller.canvasPosition, const Offset(60, 45));
    });

    test('coordinate transforms', () {
      final controller = DiagramController<void, void>()
        ..setCanvasPosition(const Offset(100, 100));

      final canvasPos = controller.fromCanvasCoordinates(
        const Offset(150, 200),
      );
      expect(canvasPos, const Offset(50, 100));

      final screenPos = controller.toCanvasCoordinates(
        const Offset(50, 100),
      );
      expect(screenPos, const Offset(150, 200));
    });

    test('resetCanvasView resets to defaults', () {
      final controller = DiagramController<void, void>()
        ..setCanvasPosition(const Offset(100, 100))
        ..canvasScale = 3
        ..resetCanvasView();
      expect(controller.canvasPosition, Offset.zero);
      expect(controller.canvasScale, 1);
    });
  });

  group('DiagramController - serialization', () {
    test('serialize and deserialize round-trip', () {
      final controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'c1',
            position: const Offset(10, 20),
          ),
        )
        ..addComponent(
          ComponentData<void>(
            id: 'c2',
            position: const Offset(100, 200),
            size: const Size(100, 100),
          ),
        )
        ..connect(
          sourceComponentId: 'c1',
          targetComponentId: 'c2',
        );

      final json = controller.serialize();

      final controller2 = DiagramController<void, void>()..deserialize(json);

      expect(controller2.components, hasLength(2));
      expect(controller2.links, hasLength(1));
      expect(
        controller2.getComponent('c1').position,
        const Offset(10, 20),
      );
    });
  });

  group('DiagramController - link joints', () {
    late DiagramController<void, void> controller;
    late String linkId;

    setUp(() {
      controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'c1',
            size: const Size(100, 100),
          ),
        )
        ..addComponent(
          ComponentData<void>(
            id: 'c2',
            position: const Offset(200, 0),
            size: const Size(100, 100),
          ),
        );
      linkId = controller.connect(
        sourceComponentId: 'c1',
        targetComponentId: 'c2',
      );
    });

    test('showLinkJoints and hideLinkJoints', () {
      controller.showLinkJoints(linkId);
      expect(controller.getLink(linkId).areJointsVisible, isTrue);

      controller.hideLinkJoints(linkId);
      expect(controller.getLink(linkId).areJointsVisible, isFalse);
    });

    test('hideAllLinkJoints hides all', () {
      controller
        ..showLinkJoints(linkId)
        ..hideAllLinkJoints();
      expect(controller.getLink(linkId).areJointsVisible, isFalse);
    });

    test('insertLinkJoint adds a middle point', () {
      controller.insertLinkJoint(linkId, const Offset(150, 50), 1);
      expect(controller.getLink(linkId).linkPoints, hasLength(3));
    });
  });

  group('DiagramController - componentsSorted caching', () {
    test('returns same list instance when no changes', () {
      final controller = DiagramController<void, void>()
        ..addComponent(ComponentData<void>(id: 'c1'))
        ..addComponent(ComponentData<void>(id: 'c2'));

      final sorted1 = controller.componentsSorted;
      final sorted2 = controller.componentsSorted;
      expect(identical(sorted1, sorted2), isTrue);
    });

    test('invalidates cache after addComponent', () {
      final controller = DiagramController<void, void>()
        ..addComponent(ComponentData<void>(id: 'c1'));

      final sorted1 = controller.componentsSorted;
      controller.addComponent(ComponentData<void>(id: 'c2'));
      final sorted2 = controller.componentsSorted;

      expect(identical(sorted1, sorted2), isFalse);
      expect(sorted2, hasLength(2));
    });

    test('invalidates cache after removeComponent', () {
      final controller = DiagramController<void, void>()
        ..addComponent(ComponentData<void>(id: 'c1'))
        ..addComponent(ComponentData<void>(id: 'c2'));

      final sorted1 = controller.componentsSorted;
      controller.removeComponent('c1');
      final sorted2 = controller.componentsSorted;

      expect(identical(sorted1, sorted2), isFalse);
      expect(sorted2, hasLength(1));
    });

    test('invalidates cache after setComponentZOrder', () {
      final controller = DiagramController<void, void>()
        ..addComponent(ComponentData<void>(id: 'c1'))
        ..addComponent(ComponentData<void>(id: 'c2'));

      final sorted1 = controller.componentsSorted;
      controller.setComponentZOrder('c1', 10);
      final sorted2 = controller.componentsSorted;

      expect(identical(sorted1, sorted2), isFalse);
    });
  });

  group('DiagramController - coordinate transforms with scale', () {
    test('fromCanvasCoordinates at scale 2', () {
      final controller = DiagramController<void, void>(
        canvasConfig: const CanvasConfig(initialScale: 2),
      )..setCanvasPosition(const Offset(100, 100));

      final result = controller.fromCanvasCoordinates(const Offset(200, 300));
      expect(result, const Offset(50, 100));
    });

    test('toCanvasCoordinates at scale 2', () {
      final controller = DiagramController<void, void>(
        canvasConfig: const CanvasConfig(initialScale: 2),
      )..setCanvasPosition(const Offset(100, 100));

      final result = controller.toCanvasCoordinates(const Offset(50, 100));
      expect(result, const Offset(200, 300));
    });

    test('round-trip coordinate transform preserves position', () {
      final controller = DiagramController<void, void>(
        canvasConfig: const CanvasConfig(
          initialScale: 1.5,
          initialPosition: Offset(30, 40),
        ),
      );

      const original = Offset(100, 200);
      final canvas = controller.fromCanvasCoordinates(original);
      final restored = controller.toCanvasCoordinates(canvas);

      expect(restored.dx, closeTo(original.dx, 0.001));
      expect(restored.dy, closeTo(original.dy, 0.001));
    });
  });

  group('DiagramController - removeComponentWithChildren', () {
    test('removes component and all descendants', () {
      final controller = DiagramController<void, void>()
        ..addComponent(ComponentData<void>(id: 'root'))
        ..addComponent(ComponentData<void>(id: 'child'))
        ..addComponent(ComponentData<void>(id: 'grandchild'))
        ..setComponentParent('child', 'root')
        ..setComponentParent('grandchild', 'child')
        ..removeComponentWithChildren('root');

      expect(controller.componentExists('root'), isFalse);
      expect(controller.componentExists('child'), isFalse);
      expect(controller.componentExists('grandchild'), isFalse);
    });

    test('does not remove unrelated components', () {
      final controller = DiagramController<void, void>()
        ..addComponent(ComponentData<void>(id: 'root'))
        ..addComponent(ComponentData<void>(id: 'child'))
        ..addComponent(ComponentData<void>(id: 'unrelated'))
        ..setComponentParent('child', 'root')
        ..removeComponentWithChildren('root');

      expect(controller.componentExists('unrelated'), isTrue);
    });
  });

  group('DiagramController - moveComponentWithChildren', () {
    test('moves component and children together', () {
      final controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'parent',
            position: const Offset(10, 10),
          ),
        )
        ..addComponent(
          ComponentData<void>(
            id: 'child',
            position: const Offset(50, 50),
          ),
        )
        ..setComponentParent('child', 'parent')
        ..moveComponentWithChildren('parent', const Offset(20, 20));

      expect(
        controller.getComponent('parent').position,
        const Offset(30, 30),
      );
      expect(
        controller.getComponent('child').position,
        const Offset(70, 70),
      );
    });
  });

  group('DiagramController - edge cases', () {
    test('removeAllLinks clears all links from all components', () {
      final controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'c1',
            size: const Size(100, 100),
          ),
        )
        ..addComponent(
          ComponentData<void>(
            id: 'c2',
            position: const Offset(200, 0),
            size: const Size(100, 100),
          ),
        )
        ..connect(sourceComponentId: 'c1', targetComponentId: 'c2')
        ..connect(sourceComponentId: 'c2', targetComponentId: 'c1');

      expect(controller.links, hasLength(2));

      controller.removeAllLinks();

      expect(controller.links, isEmpty);
      expect(controller.getComponent('c1').connections, isEmpty);
      expect(controller.getComponent('c2').connections, isEmpty);
    });

    test('canvasColor setter notifies listeners', () {
      final controller = DiagramController<void, void>();
      var notified = false;
      controller
        ..addListener(() => notified = true)
        ..canvasColor = Colors.blue;
      expect(notified, isTrue);
      expect(controller.canvasColor, Colors.blue);
    });

    test('resetCanvasView notifies listeners', () {
      final controller = DiagramController<void, void>()
        ..setCanvasPosition(const Offset(100, 100));
      var notified = false;
      controller
        ..addListener(() => notified = true)
        ..resetCanvasView();
      expect(notified, isTrue);
    });

    test('zoomCanvas multiplies scale', () {
      final controller = DiagramController<void, void>()..zoomCanvas(2);
      expect(controller.canvasScale, 2);
      controller.zoomCanvas(0.5);
      expect(controller.canvasScale, 1);
    });

    test('connect notifies listeners', () {
      final controller = DiagramController<void, void>()
        ..addComponent(
          ComponentData<void>(
            id: 'c1',
            size: const Size(100, 100),
          ),
        )
        ..addComponent(
          ComponentData<void>(
            id: 'c2',
            position: const Offset(200, 0),
            size: const Size(100, 100),
          ),
        );

      var notifyCount = 0;
      controller
        ..addListener(() => notifyCount++)
        ..connect(sourceComponentId: 'c1', targetComponentId: 'c2');
      expect(notifyCount, greaterThan(0));
    });
  });
}

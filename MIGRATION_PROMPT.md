# Migration Guide: diagram_editor v0.2.x to v1.0.0

This guide maps every old API surface to its new equivalent. Use it to mechanically migrate any codebase from the policy-based architecture to the controller-based architecture.

## Architecture Overview

| Concept | Old (v0.2.x) | New (v1.0.0) |
|---------|-------------|-------------|
| Central class | `PolicySet` + `DiagramEditorContext` | `DiagramController<C, L>` |
| State management | `provider` package | Built-in `ChangeNotifier` + `ListenableBuilder` |
| Behavior definition | 10 mixin policies on `PolicySet` | Callbacks on `DiagramEditor` widget |
| Component access | `canvasReader.model.getComponent(id)` | `controller.getComponent(id)` |
| Component mutation | `canvasWriter.model.addComponent(data)` | `controller.addComponent(data)` |
| Canvas state read | `canvasReader.state.getCanvasPosition()` | `controller.canvasPosition` |
| Canvas state write | `canvasWriter.state.setCanvasColor(c)` | `controller.canvasColor = c` |
| Custom data | `dynamic data` with manual casting | Generic `<C, L>` type parameters |
| Serialization | `canvasWriter.model.deserializeDiagram(json)` | `controller.deserialize(json)` |
| Connection types | `ConnectionOut` / `ConnectionIn` (abstract class) | `OutgoingConnection` / `IncomingConnection` (sealed class) |
| Connection field | `connection.connectionId` | `connection.linkId` |
| Connection serialization | `'type': 0` / `'type': 1` (integers) | `'direction': 'out'` / `'direction': 'in'` (strings) |
| Link creation | `connectTwoComponents(...)` | `controller.connect(...)` |
| Link endpoint strategy | `LinkAttachmentRectPolicy` mixin | `LinkAttachment.rectangular()` function |
| Component design | `ComponentDesignPolicy.showComponentBody()` | `componentBuilder` callback on widget |
| Canvas widgets | `CanvasWidgetsPolicy.showCustomWidgetsOnCanvasBackground()` | `backgroundBuilder` callback on widget |
| Component overlays | `ComponentWidgetsPolicy.showCustomWidgetWithComponentData()` | `componentOverlayBuilder` callback on widget |
| Link widgets | `LinkWidgetsPolicy.showWidgetsWithLinkData()` | `linkWidgetBuilder` callback on widget |
| Init hook | `InitPolicy.initializeDiagramEditor()` | `onInit` callback on widget or constructor config |
| Shared diagram | `DiagramEditorContext.withSharedModel(oldContext)` | Pass same `DiagramController` to multiple widgets |

---

## 1. pubspec.yaml

Remove the `provider` dependency. It is no longer used.

```yaml
# OLD
dependencies:
  diagram_editor: ^0.2.3
  provider: ^6.1.2

# NEW
dependencies:
  diagram_editor: ^1.0.0
  # provider removed
```

---

## 2. PolicySet Elimination

The old API required a class extending `PolicySet` with up to 10 behavior mixins. The new API replaces this entirely with `DiagramController` + widget callbacks.

### Old pattern (delete all of this):

```dart
class MyPolicySet extends PolicySet
    with
        MyInitPolicy,
        MyCanvasPolicy,
        MyComponentPolicy,
        MyComponentDesignPolicy,
        MyLinkPolicy,
        CustomStatePolicy,
        CanvasControlPolicy,       // built-in pan/zoom
        LinkControlPolicy,         // built-in link joint creation
        LinkJointControlPolicy,    // built-in joint deletion
        LinkAttachmentRectPolicy   // link endpoint alignment
{}
```

### New equivalent:

```dart
// Create controller (replaces PolicySet + DiagramEditorContext)
final controller = DiagramController<MyComponentData, void>(
  canvasConfig: const CanvasConfig(
    backgroundColor: Colors.grey,
  ),
  componentDataCodec: JsonCodec<MyComponentData>(
    encode: (d) => d.toJson(),
    decode: MyComponentData.fromJson,
  ),
);

// Use widget with callbacks (replaces all policy mixins)
DiagramEditor<MyComponentData, void>(
  controller: controller,
  componentBuilder: (context, component) => /* ... */,  // replaces ComponentDesignPolicy
  onCanvasTapUp: (details) { /* ... */ },               // replaces CanvasPolicy
  onComponentTap: (id) { /* ... */ },                   // replaces ComponentPolicy
  onComponentScaleUpdate: (id, details) { /* ... */ },  // replaces ComponentPolicy
  onLinkTapUp: (id, details) { /* ... */ },             // replaces LinkPolicy
  // CanvasControlPolicy, LinkControlPolicy, LinkJointControlPolicy
  // are now built-in defaults (enabled by default, disable with flags)
)
```

---

## 3. DiagramEditorContext to DiagramController

### Old:

```dart
final policySet = MyPolicySet();
final context = DiagramEditorContext(policySet: policySet);

// Widget:
DiagramEditor(diagramEditorContext: context)
```

### New:

```dart
final controller = DiagramController<C, L>(
  canvasConfig: const CanvasConfig(...),
  componentDataCodec: JsonCodec<C>(...),  // optional
  linkDataCodec: JsonCodec<L>(...),       // optional
  linkEndpointAligner: LinkAttachment.rectangular(), // optional, this is the default
);

// Widget:
DiagramEditor<C, L>(
  controller: controller,
  componentBuilder: (context, component) => /* ... */,
)
```

### Shared model (multiple editors):

```dart
// OLD
final context2 = DiagramEditorContext.withSharedModel(context1, policySet: policySet2);
final context3 = DiagramEditorContext.withSharedState(context1, policySet: policySet3);
final context4 = DiagramEditorContext.withSharedModelAndState(context1, policySet: policySet4);

// NEW - just pass the same controller to multiple widgets
DiagramEditor(controller: sharedController, componentBuilder: builder1)
DiagramEditor(controller: sharedController, componentBuilder: builder2)
```

---

## 4. Policy Method to Callback Mapping

Every policy mixin method has a direct callback equivalent on the `DiagramEditor` widget.

### CanvasPolicy

| Old mixin method | New widget callback |
|-------------------|---------------------|
| `onCanvasTap()` | `onCanvasTap: () {}` |
| `onCanvasTapDown(TapDownDetails)` | `onCanvasTapDown: (details) {}` |
| `onCanvasTapUp(TapUpDetails)` | `onCanvasTapUp: (details) {}` |
| `onCanvasTapCancel()` | _(removed, not supported by GestureDetector reliably)_ |
| `onCanvasLongPress()` | `onCanvasLongPress: () {}` |
| `onCanvasLongPressStart(LongPressStartDetails)` | `onCanvasLongPressStart: (details) {}` |
| `onCanvasLongPressMoveUpdate(LongPressMoveUpdateDetails)` | `onCanvasLongPressMoveUpdate: (details) {}` |
| `onCanvasLongPressEnd(LongPressEndDetails)` | `onCanvasLongPressEnd: (details) {}` |
| `onCanvasLongPressUp()` | `onCanvasLongPressUp: () {}` |
| `onCanvasScaleStart(ScaleStartDetails)` | `onCanvasScaleStart: (details) {}` |
| `onCanvasScaleUpdate(ScaleUpdateDetails)` | `onCanvasScaleUpdate: (details) {}` |
| `onCanvasScaleEnd(ScaleEndDetails)` | `onCanvasScaleEnd: (details) {}` |
| `onCanvasPointerSignal(PointerSignalEvent)` | `onCanvasPointerSignal: (event) {}` |
| `get showLinksOnTopOfComponents => true` | `linksOnTop: true` |

### ComponentPolicy

| Old mixin method | New widget callback |
|-------------------|---------------------|
| `onComponentTap(String id)` | `onComponentTap: (id) {}` |
| `onComponentTapDown(String id, TapDownDetails)` | `onComponentTapDown: (id, details) {}` |
| `onComponentTapUp(String id, TapUpDetails)` | `onComponentTapUp: (id, details) {}` |
| `onComponentTapCancel(String id)` | _(removed)_ |
| `onComponentLongPress(String id)` | `onComponentLongPress: (id) {}` |
| `onComponentLongPressStart(String id, LongPressStartDetails)` | `onComponentLongPressStart: (id, details) {}` |
| `onComponentLongPressMoveUpdate(String id, LongPressMoveUpdateDetails)` | `onComponentLongPressMoveUpdate: (id, details) {}` |
| `onComponentLongPressEnd(String id, LongPressEndDetails)` | `onComponentLongPressEnd: (id, details) {}` |
| `onComponentLongPressUp(String id)` | `onComponentLongPressUp: (id) {}` |
| `onComponentScaleStart(String id, ScaleStartDetails)` | `onComponentScaleStart: (id, details) {}` |
| `onComponentScaleUpdate(String id, ScaleUpdateDetails)` | `onComponentScaleUpdate: (id, details) {}` |
| `onComponentScaleEnd(String id, ScaleEndDetails)` | `onComponentScaleEnd: (id, details) {}` |
| `onComponentPointerSignal(String id, PointerSignalEvent)` | `onComponentPointerSignal: (id, event) {}` |

### LinkPolicy

| Old mixin method | New widget callback |
|-------------------|---------------------|
| `onLinkTap(String id)` | `onLinkTap: (id) {}` |
| `onLinkTapDown(String id, TapDownDetails)` | `onLinkTapDown: (id, details) {}` |
| `onLinkTapUp(String id, TapUpDetails)` | `onLinkTapUp: (id, details) {}` |
| `onLinkTapCancel(String id)` | _(removed)_ |
| `onLinkLongPress(String id)` | `onLinkLongPress: (id) {}` |
| `onLinkLongPressStart(String id, LongPressStartDetails)` | `onLinkLongPressStart: (id, details) {}` |
| `onLinkLongPressMoveUpdate(String id, LongPressMoveUpdateDetails)` | `onLinkLongPressMoveUpdate: (id, details) {}` |
| `onLinkLongPressEnd(String id, LongPressEndDetails)` | `onLinkLongPressEnd: (id, details) {}` |
| `onLinkLongPressUp(String id)` | `onLinkLongPressUp: (id) {}` |
| `onLinkScaleStart(String id, ScaleStartDetails)` | `onLinkScaleStart: (id, details) {}` |
| `onLinkScaleUpdate(String id, ScaleUpdateDetails)` | `onLinkScaleUpdate: (id, details) {}` |
| `onLinkScaleEnd(String id, ScaleEndDetails)` | `onLinkScaleEnd: (id, details) {}` |
| `onLinkPointerSignal(String id, PointerSignalEvent)` | `onLinkPointerSignal: (id, event) {}` |

### LinkJointPolicy

| Old mixin method | New widget callback |
|-------------------|---------------------|
| `onLinkJointTap(int index, String linkId)` | `onLinkJointTap: (index, linkId) {}` |
| `onLinkJointTapDown(int index, String linkId, TapDownDetails)` | _(removed)_ |
| `onLinkJointTapUp(int index, String linkId, TapUpDetails)` | _(removed)_ |
| `onLinkJointTapCancel(int index, String linkId)` | _(removed)_ |
| `onLinkJointLongPress(int index, String linkId)` | `onLinkJointLongPress: (index, linkId) {}` |
| `onLinkJointLongPressStart(int index, String linkId, LongPressStartDetails)` | `onLinkJointLongPressStart: (index, linkId, details) {}` |
| `onLinkJointLongPressMoveUpdate(int index, String linkId, LongPressMoveUpdateDetails)` | `onLinkJointLongPressMoveUpdate: (index, linkId, details) {}` |
| `onLinkJointLongPressEnd(int index, String linkId, LongPressEndDetails)` | `onLinkJointLongPressEnd: (index, linkId, details) {}` |
| `onLinkJointLongPressUp(int index, String linkId)` | `onLinkJointLongPressUp: (index, linkId) {}` |
| `onLinkJointScaleStart(int index, String linkId, ScaleStartDetails)` | `onLinkJointScaleStart: (index, linkId, details) {}` |
| `onLinkJointScaleUpdate(int index, String linkId, ScaleUpdateDetails)` | `onLinkJointScaleUpdate: (index, linkId, details) {}` |
| `onLinkJointScaleEnd(int index, String linkId, ScaleEndDetails)` | `onLinkJointScaleEnd: (index, linkId, details) {}` |

---

## 5. Widget Builder Policies

### ComponentDesignPolicy

```dart
// OLD
mixin MyComponentDesignPolicy implements ComponentDesignPolicy {
  @override
  Widget? showComponentBody(ComponentData componentData) {
    final data = componentData.data as MyComponentData; // unsafe cast
    return Container(color: data.color, child: Text('node'));
  }
}

// NEW
DiagramEditor<MyComponentData, void>(
  componentBuilder: (context, component) {
    final data = component.data; // type-safe, MyComponentData?
    return Container(color: data?.color, child: const Text('node'));
  },
)
```

### CanvasWidgetsPolicy

```dart
// OLD
mixin MyCanvasWidgets implements CanvasWidgetsPolicy {
  @override
  List<Widget> showCustomWidgetsOnCanvasBackground(BuildContext context) {
    return [/* background widgets */];
  }
  @override
  List<Widget> showCustomWidgetsOnCanvasForeground(BuildContext context) {
    return [/* foreground widgets */];
  }
}

// NEW
DiagramEditor(
  backgroundBuilder: (context) => [/* background widgets */],
  foregroundBuilder: (context) => [/* foreground widgets */],
)
```

### ComponentWidgetsPolicy

```dart
// OLD
mixin MyComponentWidgets implements ComponentWidgetsPolicy {
  @override
  Widget showCustomWidgetWithComponentData(BuildContext context, ComponentData data) {
    return /* overlay widget */;
  }
  @override
  Widget showCustomWidgetWithComponentDataUnder(BuildContext context, ComponentData data) {
    return /* underlay widget */;
  }
  @override
  Widget showCustomWidgetWithComponentDataOver(BuildContext context, ComponentData data) {
    return /* top overlay widget */;
  }
}

// NEW
DiagramEditor(
  componentOverlayBuilder: (context, component) => /* overlay widget */,
  componentUnderlayBuilder: (context, component) => /* underlay widget */,
)
```

### LinkWidgetsPolicy

```dart
// OLD
mixin MyLinkWidgets implements LinkWidgetsPolicy {
  @override
  List<Widget> showWidgetsWithLinkData(BuildContext context, LinkData linkData) {
    return [/* link widgets */];
  }
}

// NEW
DiagramEditor(
  linkWidgetBuilder: (context, linkData) => /* link widget */,
)
```

---

## 6. InitPolicy

```dart
// OLD
mixin MyInitPolicy implements InitPolicy {
  @override
  void initializeDiagramEditor() {
    canvasWriter.state.setCanvasColor(Colors.grey);
    canvasWriter.model.addComponent(ComponentData(
      position: Offset(100, 100),
      size: Size(80, 80),
      data: MyData(),
    ));
  }
}

// NEW - Option A: Use CanvasConfig for static properties
final controller = DiagramController<MyData, void>(
  canvasConfig: const CanvasConfig(backgroundColor: Colors.grey),
);

// NEW - Option B: Use onInit callback for dynamic initialization
DiagramEditor(
  controller: controller,
  onInit: () {
    controller.addComponent(ComponentData<MyData>(
      position: const Offset(100, 100),
      size: const Size(80, 80),
      data: MyData(),
    ));
  },
)
```

---

## 7. Built-in Default Behaviors

The old API had 3 default policy mixins. The new API includes these as built-in defaults, controllable via flags.

| Old mixin | New flag | Default |
|-----------|----------|---------|
| `CanvasControlPolicy` | `enableDefaultPanZoom: true` | Enabled |
| `LinkControlPolicy` | `enableDefaultLinkControl: true` | Enabled |
| `LinkJointControlPolicy` | `enableDefaultJointControl: true` | Enabled |

The old `CanvasMovePolicy` (pan only, no zoom) is replaced by:
```dart
CanvasConfig(enableZoom: false) // pan still works, zoom disabled
```

If you override a canvas gesture callback (e.g. `onCanvasScaleUpdate`), the default behavior still runs first, then your callback runs. To fully replace default behavior, set the flag to `false`:

```dart
DiagramEditor(
  enableDefaultPanZoom: false,
  onCanvasScaleUpdate: (details) {
    // your custom pan/zoom logic
  },
)
```

### Default behavior extension methods (for custom composition):

```dart
// Pan/zoom
controller.handleCanvasScaleStart(details);
controller.handleCanvasScaleUpdate(details);
controller.handleCanvasScaleEnd(details);
controller.handleCanvasPointerSignal(event);
controller.keepScaleInBounds(scale, currentScale);

// Link control
controller.handleLinkTapUp(linkId, details);
int? segmentIndex = controller.handleLinkScaleStart(linkId, details);
controller.handleLinkScaleUpdate(linkId, details, segmentIndex);
int? segmentIndex = controller.handleLinkLongPressStart(linkId, details);
controller.handleLinkLongPressMoveUpdate(linkId, details, segmentIndex);

// Joint control
controller.handleJointLongPress(jointIndex, linkId);
controller.handleJointScaleUpdate(jointIndex, linkId, details);
```

---

## 8. Reader/Writer to Controller Method Mapping

### canvasReader.model → controller

| Old | New |
|-----|-----|
| `canvasReader.model.getComponent(id)` | `controller.getComponent(id)` |
| `canvasReader.model.getComponentData(id)` | `controller.getComponent(id)` |
| `canvasReader.model.getAllComponents()` | `controller.components` |
| `canvasReader.model.getLink(id)` | `controller.getLink(id)` |
| `canvasReader.model.getAllLinks()` | `controller.links` |
| `canvasReader.model.componentExists(id)` | `controller.componentExists(id)` |
| `canvasReader.model.linkExists(id)` | `controller.linkExists(id)` |
| `canvasReader.model.serializeDiagram()` | `controller.serialize()` |

### canvasWriter.model → controller

| Old | New |
|-----|-----|
| `canvasWriter.model.addComponent(data)` | `controller.addComponent(data)` |
| `canvasWriter.model.removeComponent(id)` | `controller.removeComponent(id)` |
| `canvasWriter.model.removeComponentWithChildren(id)` | `controller.removeComponentWithChildren(id)` |
| `canvasWriter.model.removeAllComponents()` | `controller.removeAllComponents()` |
| `canvasWriter.model.moveComponent(id, offset)` | `controller.moveComponent(id, offset)` |
| `canvasWriter.model.moveComponentWithChildren(id, offset)` | `controller.moveComponentWithChildren(id, offset)` |
| `canvasWriter.model.setComponentPosition(id, position)` | `controller.setComponentPosition(id, position)` |
| `canvasWriter.model.resizeComponent(id, delta)` | `controller.resizeComponent(id, delta)` |
| `canvasWriter.model.setComponentSize(id, size)` | `controller.setComponentSize(id, size)` |
| `canvasWriter.model.updateComponent(id)` | `controller.updateComponent(id)` |
| `canvasWriter.model.setComponentZOrder(id, z)` | `controller.setComponentZOrder(id, z)` |
| `canvasWriter.model.moveComponentToTheFront(id)` | `controller.bringToFront(id)` |
| `canvasWriter.model.moveComponentToTheFrontWithChildren(id)` | `controller.bringToFrontWithChildren(id)` |
| `canvasWriter.model.moveComponentToTheBack(id)` | `controller.sendToBack(id)` |
| `canvasWriter.model.moveComponentToTheBackWithChildren(id)` | `controller.sendToBackWithChildren(id)` |
| `canvasWriter.model.setComponentParent(id, parentId)` | `controller.setComponentParent(id, parentId)` |
| `canvasWriter.model.removeComponentParent(id)` | `controller.removeComponentParent(id)` |
| `canvasWriter.model.connectTwoComponents(source:, target:, linkStyle:, data:)` | `controller.connect(sourceComponentId:, targetComponentId:, linkStyle:, data:)` |
| `canvasWriter.model.removeLink(id)` | `controller.removeLink(id)` |
| `canvasWriter.model.removeAllLinks()` | `controller.removeAllLinks()` |
| `canvasWriter.model.removeComponentConnections(id)` | `controller.removeComponentLinks(id)` |
| `canvasWriter.model.insertLinkMiddlePoint(linkId, pos, index)` | `controller.insertLinkJoint(linkId, pos, index)` |
| `canvasWriter.model.setLinkMiddlePointPosition(linkId, pos, index)` | `controller.setLinkJointPosition(linkId, pos, index)` |
| `canvasWriter.model.removeLinkMiddlePoint(linkId, index)` | `controller.removeLinkJoint(linkId, index)` |
| `canvasWriter.model.updateLink(id)` | `controller.updateLinkEndpoints(id)` |
| `canvasWriter.model.showLinkJoints(id)` | `controller.showLinkJoints(id)` |
| `canvasWriter.model.hideLinkJoints(id)` | `controller.hideLinkJoints(id)` |
| `canvasWriter.model.hideAllLinkJoints()` | `controller.hideAllLinkJoints()` |
| `canvasWriter.model.deserializeDiagram(json, decode...: ...)` | `controller.deserialize(json)` (codecs set on controller constructor) |

### canvasReader.state / canvasWriter.state → controller

| Old | New |
|-----|-----|
| `canvasReader.state.getCanvasPosition()` | `controller.canvasPosition` |
| `canvasReader.state.getCanvasScale()` | `controller.canvasScale` |
| `canvasReader.state.getCanvasColor()` | `controller.canvasColor` |
| `canvasReader.state.fromCanvasCoordinates(pos)` | `controller.fromCanvasCoordinates(pos)` |
| `canvasReader.state.toCanvasCoordinates(pos)` | `controller.toCanvasCoordinates(pos)` |
| `canvasWriter.state.setCanvasPosition(pos)` | `controller.setCanvasPosition(pos)` |
| `canvasWriter.state.panCanvas(offset)` | `controller.panCanvas(offset)` |
| `canvasWriter.state.setCanvasScale(scale)` | `controller.canvasScale = scale` |
| `canvasWriter.state.zoomCanvas(factor)` | `controller.zoomCanvas(factor)` |
| `canvasWriter.state.resetCanvasView()` | `controller.resetCanvasView()` |
| `canvasWriter.state.setCanvasColor(color)` | `controller.canvasColor = color` |
| `canvasWriter.state.updateCanvas()` | `controller.updateCanvas()` |

---

## 9. Custom Data: Dynamic to Generics

### Old (unsafe dynamic):

```dart
// Defining custom data
class MyNodeData {
  Color color;
  String label;
  MyNodeData({required this.color, required this.label});
}

// Setting data
final component = ComponentData(
  data: MyNodeData(color: Colors.blue, label: 'Node'),
);

// Reading data (unsafe cast)
final data = componentData.data as MyNodeData;
print(data.color); // runtime error if cast fails
```

### New (type-safe generics):

```dart
// Same data class
class MyNodeData {
  Color color;
  String label;
  MyNodeData({required this.color, required this.label});
}

// Controller typed with data class
final controller = DiagramController<MyNodeData, void>(...);

// Setting data
controller.addComponent(
  ComponentData<MyNodeData>(
    data: MyNodeData(color: Colors.blue, label: 'Node'),
  ),
);

// Reading data (type-safe, no cast needed)
final data = controller.getComponent(id).data; // MyNodeData?
print(data?.color); // compile-time safe
```

Use `void` for the type parameter when no custom data is needed:

```dart
DiagramController<void, void>()    // no custom data on components or links
DiagramController<MyNodeData, void>()  // custom data on components only
DiagramController<void, MyLinkData>()  // custom data on links only
DiagramController<MyNodeData, MyLinkData>()  // custom data on both
```

---

## 10. Serialization

### Old:

```dart
// Serialize
final json = canvasReader.model.serializeDiagram();

// Deserialize
canvasWriter.model.deserializeDiagram(
  json,
  decodeCustomComponentData: (json) => MyNodeData.fromJson(json),
  decodeCustomLinkData: (json) => MyLinkData.fromJson(json),
);
```

### New:

```dart
// Codecs are set once on the controller
final controller = DiagramController<MyNodeData, void>(
  componentDataCodec: JsonCodec<MyNodeData>(
    encode: (data) => {'color': data.color.toARGB32().toRadixString(16)},
    decode: (json) => MyNodeData(
      color: Color(int.parse(json['color'] as String, radix: 16)),
    ),
  ),
);

// Serialize
final json = controller.serialize();

// Deserialize (call removeAllComponents first to replace)
controller
  ..removeAllComponents()
  ..deserialize(json);
```

### Serialization format changes:

The JSON format has changed. Old serialized data is **not** directly compatible.

| Field | Old format | New format |
|-------|-----------|-----------|
| Connection direction | `"type": 0` (out) / `"type": 1` (in) | `"direction": "out"` / `"direction": "in"` |
| Connection id field | `"connection_id"` | `"link_id"` |
| Enum values (ArrowType, LineType) | `.index` integers | `.name` strings (e.g. `"pointedArrow"`, `"dashed"`) |
| Component custom data key | `"data"` | `"dynamic_data"` |
| Link custom data key | `"data"` | `"dynamic_data"` |
| Color | hex string | hex string (same, but now uses `Color.toARGB32()`) |

If you have persisted old-format JSON, you will need a one-time migration function to convert the format.

---

## 11. Connection Model

### Old:

```dart
// Abstract class with runtime type checking
abstract class Connection {
  final String connectionId;
  final String otherComponentId;
}
class ConnectionOut extends Connection { ... }
class ConnectionIn extends Connection { ... }

// Usage
if (connection is ConnectionOut) { ... }
```

### New:

```dart
// Dart 3 sealed class with exhaustive matching
sealed class Connection {
  final String linkId;           // renamed from connectionId
  final String otherComponentId;
}
final class OutgoingConnection extends Connection { ... }  // renamed from ConnectionOut
final class IncomingConnection extends Connection { ... }  // renamed from ConnectionIn

// Usage with exhaustive switch
switch (connection) {
  case OutgoingConnection():
    print('outgoing to ${connection.otherComponentId}');
  case IncomingConnection():
    print('incoming from ${connection.otherComponentId}');
}

// Or with is-check (still works)
if (connection is OutgoingConnection) { ... }
```

### Rename mapping:

| Old | New |
|-----|-----|
| `ConnectionOut` | `OutgoingConnection` |
| `ConnectionIn` | `IncomingConnection` |
| `connection.connectionId` | `connection.linkId` |

---

## 12. LinkAttachmentPolicy to LinkAttachment

### Old:

```dart
// Choose one mixin on PolicySet
class MyPolicySet extends PolicySet with LinkAttachmentRectPolicy {}
class MyPolicySet extends PolicySet with LinkAttachmentOvalPolicy {}
class MyPolicySet extends PolicySet with LinkAttachmentCrystalPolicy {}

// Or implement custom
mixin MyLinkAttachment implements LinkAttachmentPolicy {
  @override
  Alignment getLinkEndpointAlignment(ComponentData data, Offset targetPoint) {
    return Alignment.center;
  }
}
```

### New:

```dart
// Pass to controller constructor
final controller = DiagramController<C, L>(
  linkEndpointAligner: LinkAttachment.rectangular(), // default
);

// Or change at runtime
controller.linkEndpointAligner = LinkAttachment.oval();
controller.linkEndpointAligner = LinkAttachment.crystal();
controller.linkEndpointAligner = LinkAttachment.center();

// Custom alignment function
controller.linkEndpointAligner = (componentData, targetPoint) {
  // return Alignment for where the link should connect
  return Alignment.center;
};
```

| Old mixin | New function |
|-----------|-------------|
| `LinkAttachmentRectPolicy` | `LinkAttachment.rectangular()` |
| `LinkAttachmentOvalPolicy` | `LinkAttachment.oval()` |
| `LinkAttachmentCrystalPolicy` | `LinkAttachment.crystal()` |
| Custom `getLinkEndpointAlignment` | Custom `LinkEndpointAligner` function |

---

## 13. LinkStyle Changes

`LinkStyle` is now immutable with a `const` constructor. The enums and properties are the same.

```dart
// OLD (mutable)
final style = LinkStyle(
  arrowType: ArrowType.pointedArrow,
  lineWidth: 2,
);

// NEW (immutable, const)
const style = LinkStyle(
  arrowType: ArrowType.pointedArrow,
  lineWidth: 2,
);
```

`LinkStyle` now has `==` and `hashCode` overrides, making it usable as a map key or in `shouldRepaint` checks.

---

## 14. CanvasConfig (new)

Static canvas configuration is now declarative via `CanvasConfig`:

```dart
const config = CanvasConfig(
  initialScale: 1.0,        // starting zoom level
  initialPosition: Offset.zero,  // starting pan offset
  minScale: 0.1,            // minimum zoom
  maxScale: 8.0,            // maximum zoom
  mouseScrollSpeed: 0.8,    // mouse wheel sensitivity
  backgroundColor: Colors.white,  // canvas background
  enablePan: true,           // allow panning
  enableZoom: true,          // allow zooming (false = pan only, replaces CanvasMovePolicy)
);
```

---

## 15. File Structure

### Old (43 files):

```
lib/src/
  abstraction_layer/
    policy/base/           (11 files: CanvasPolicy, ComponentPolicy, LinkPolicy, etc.)
    policy/defaults/       (6 files: CanvasControlPolicy, LinkAttachment*Policy, etc.)
    policy/base_policy_set.dart
    rw/                    (6 files: CanvasReader, CanvasWriter, ModelReader, etc.)
  canvas_context/
    canvas_model.dart
    canvas_state.dart
    diagram_editor_context.dart
    model/                 (4 files: ComponentData, LinkData, Connection, DiagramData)
  utils/
    link_style.dart
    vector_utils.dart
    painter/               (4 files)
  widget/                  (4 files: editor, canvas, component, link)
```

### New (22 files):

```
lib/src/
  codec/
    json_codec.dart
    diagram_serializer.dart
  controller/
    diagram_controller.dart
    canvas_config.dart
    default_behaviors.dart
  model/
    component_data.dart
    link_data.dart
    connection.dart
    diagram_data.dart
    link_style.dart
  painter/
    link_painter.dart
    link_joint_painter.dart
    grid_painter.dart
    component_highlight_painter.dart
    delete_icon_painter.dart
  util/
    vector_utils.dart
    link_attachment.dart
  widget/
    diagram_editor.dart
    diagram_canvas.dart
    component_widget.dart
    link_widget.dart
```

---

## 16. Public Exports

Single import still works:

```dart
import 'package:diagram_editor/diagram_editor.dart';
```

This exports:

```dart
// Core
DiagramController<C, L>   // central state manager
DiagramEditor<C, L>       // main widget
CanvasConfig              // immutable canvas configuration

// Models
ComponentData<C>          // component with type-safe custom data
LinkData<L>               // link with type-safe custom data
Connection                // sealed: OutgoingConnection, IncomingConnection
DiagramData<C, L>         // serialization container
LinkStyle                 // immutable link visual style
ArrowType                 // enum: none, arrow, pointedArrow, circle, centerCircle, semiCircle
LineType                  // enum: solid, dashed, dotted

// Serialization
JsonCodec<T>              // encode/decode pair for custom data

// Utilities
LinkAttachment            // static methods: rectangular(), oval(), crystal(), center()
LinkEndpointAligner       // typedef for custom alignment functions
VectorUtils               // static math utilities

// Default behaviors (extension methods on DiagramController)
DefaultCanvasBehaviors    // handleCanvasScaleStart/Update/End, handleCanvasPointerSignal
DefaultLinkBehaviors      // handleLinkTapUp, handleLinkScaleStart/Update, handleLinkLongPress*
DefaultJointBehaviors     // handleJointLongPress, handleJointScaleUpdate

// Painters
GridPainter               // canvas grid background
ComponentHighlightPainter // dashed selection border
DeleteIconPainter         // X icon for deletion
```

---

## 17. Complete Before/After Example

### Before (v0.2.x):

```dart
import 'dart:math';
import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DiagramApp());

class MyNodeData {
  MyNodeData({required this.color});
  final Color color;
  bool isHighlighted = false;
}

class MyPolicySet extends PolicySet
    with
        MyInitPolicy,
        MyComponentDesignPolicy,
        MyCanvasPolicy,
        MyComponentPolicy,
        CustomPolicy,
        CanvasControlPolicy,
        LinkControlPolicy,
        LinkJointControlPolicy,
        LinkAttachmentRectPolicy {}

mixin CustomPolicy implements PolicySet {
  String? selectedComponentId;
  String serializedDiagram = '{"components": [], "links": []}';
}

mixin MyInitPolicy implements InitPolicy {
  @override
  void initializeDiagramEditor() {
    canvasWriter.state.setCanvasColor(Colors.grey[300]!);
  }
}

mixin MyComponentDesignPolicy implements ComponentDesignPolicy {
  @override
  Widget showComponentBody(ComponentData componentData) {
    final data = componentData.data as MyNodeData;
    return Container(
      decoration: BoxDecoration(
        color: data.color,
        border: Border.all(
          width: 2,
          color: data.isHighlighted ? Colors.pink : Colors.black,
        ),
      ),
      child: const Center(child: Text('component')),
    );
  }
}

mixin MyCanvasPolicy implements CanvasPolicy, CustomPolicy {
  @override
  void onCanvasTapUp(TapUpDetails details) {
    canvasWriter.model.hideAllLinkJoints();
    if (selectedComponentId != null) {
      _hideHighlight(selectedComponentId);
    } else {
      canvasWriter.model.addComponent(
        ComponentData(
          size: const Size(96, 72),
          position: canvasReader.state.fromCanvasCoordinates(details.localPosition),
          data: MyNodeData(
            color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
          ),
        ),
      );
    }
  }

  void _hideHighlight(String? id) {
    if (id != null) {
      (canvasReader.model.getComponent(id).data as MyNodeData).isHighlighted = false;
      canvasWriter.model.updateComponent(id);
      selectedComponentId = null;
    }
  }
}

mixin MyComponentPolicy implements ComponentPolicy, CustomPolicy {
  @override
  void onComponentTap(String id) {
    canvasWriter.model.hideAllLinkJoints();
    final connected = _connectComponents(selectedComponentId, id);
    _hideHighlight(selectedComponentId);
    if (!connected) _highlight(id);
  }

  @override
  void onComponentLongPress(String id) {
    _hideHighlight(selectedComponentId);
    canvasWriter.model
      ..hideAllLinkJoints()
      ..removeComponent(id);
  }

  Offset lastFocalPoint = Offset.zero;

  @override
  void onComponentScaleStart(String id, ScaleStartDetails details) {
    lastFocalPoint = details.localFocalPoint;
  }

  @override
  void onComponentScaleUpdate(String id, ScaleUpdateDetails details) {
    canvasWriter.model.moveComponent(id, details.localFocalPoint - lastFocalPoint);
    lastFocalPoint = details.localFocalPoint;
  }

  void _highlight(String id) {
    (canvasReader.model.getComponent(id).data as MyNodeData).isHighlighted = true;
    canvasWriter.model.updateComponent(id);
    selectedComponentId = id;
  }

  void _hideHighlight(String? id) {
    if (id != null) {
      (canvasReader.model.getComponent(id).data as MyNodeData).isHighlighted = false;
      canvasWriter.model.updateComponent(id);
      selectedComponentId = null;
    }
  }

  bool _connectComponents(String? sourceId, String? targetId) {
    if (sourceId == null || targetId == null || sourceId == targetId) return false;
    if (canvasReader.model.getComponent(sourceId).connections.any(
          (c) => c is ConnectionOut && c.otherComponentId == targetId,
        )) {
      return false;
    }
    canvasWriter.model.connectTwoComponents(
      sourceComponentId: sourceId,
      targetComponentId: targetId,
      linkStyle: const LinkStyle(
        arrowType: ArrowType.pointedArrow,
        lineWidth: 1.5,
        backArrowType: ArrowType.centerCircle,
      ),
    );
    return true;
  }
}

class DiagramApp extends StatefulWidget {
  const DiagramApp({super.key});
  @override
  State<DiagramApp> createState() => _DiagramAppState();
}

class _DiagramAppState extends State<DiagramApp> {
  late MyPolicySet myPolicySet;

  @override
  void initState() {
    super.initState();
    myPolicySet = MyPolicySet();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              DiagramEditor(
                diagramEditorContext: DiagramEditorContext(policySet: myPolicySet),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        myPolicySet.selectedComponentId = null;
                        myPolicySet.canvasWriter.model.removeAllComponents();
                      },
                      child: const Text('delete all'),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        myPolicySet.serializedDiagram =
                            myPolicySet.canvasReader.model.serializeDiagram();
                      },
                      child: const Text('serialize'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        myPolicySet.canvasWriter.model
                          ..removeAllComponents()
                          ..deserializeDiagram(myPolicySet.serializedDiagram);
                      },
                      child: const Text('deserialize'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### After (v1.0.0):

```dart
import 'dart:math' as math;
import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DiagramApp());

class MyNodeData {
  MyNodeData({required this.color});
  final Color color;
  bool isHighlighted = false;
}

class DiagramApp extends StatefulWidget {
  const DiagramApp({super.key});
  @override
  State<DiagramApp> createState() => _DiagramAppState();
}

class _DiagramAppState extends State<DiagramApp> {
  String? selectedComponentId;
  String serializedDiagram = '{"components": [], "links": []}';
  late Offset lastFocalPoint;

  final controller = DiagramController<MyNodeData, void>(
    canvasConfig: CanvasConfig(backgroundColor: Colors.grey.shade300),
    componentDataCodec: JsonCodec<MyNodeData>(
      encode: (d) => {'color': d.color.toARGB32().toRadixString(16)},
      decode: (j) => MyNodeData(
        color: Color(int.parse(j['color'] as String, radix: 16)),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: DiagramEditor<MyNodeData, void>(
                  controller: controller,
                  componentBuilder: (context, component) {
                    final data = component.data;
                    return Container(
                      decoration: BoxDecoration(
                        color: data?.color ?? Colors.blue,
                        border: Border.all(
                          width: 2,
                          color: (data?.isHighlighted ?? false)
                              ? Colors.pink
                              : Colors.black,
                        ),
                      ),
                      child: const Center(child: Text('component')),
                    );
                  },
                  onCanvasTapUp: (details) {
                    controller.hideAllLinkJoints();
                    if (selectedComponentId != null) {
                      _hideHighlight(selectedComponentId);
                    } else {
                      controller.addComponent(
                        ComponentData<MyNodeData>(
                          size: const Size(96, 72),
                          position: controller.fromCanvasCoordinates(
                            details.localPosition,
                          ),
                          data: MyNodeData(
                            color: Color.fromARGB(
                              255,
                              math.Random().nextInt(256),
                              math.Random().nextInt(256),
                              math.Random().nextInt(256),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  onComponentTap: (id) {
                    controller.hideAllLinkJoints();
                    final connected = _connectComponents(selectedComponentId, id);
                    _hideHighlight(selectedComponentId);
                    if (!connected) _highlight(id);
                  },
                  onComponentLongPress: (id) {
                    _hideHighlight(selectedComponentId);
                    controller
                      ..hideAllLinkJoints()
                      ..removeComponent(id);
                  },
                  onComponentScaleStart: (id, details) {
                    lastFocalPoint = details.localFocalPoint;
                  },
                  onComponentScaleUpdate: (id, details) {
                    controller.moveComponent(
                      id,
                      details.localFocalPoint - lastFocalPoint,
                    );
                    lastFocalPoint = details.localFocalPoint;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        selectedComponentId = null;
                        controller.removeAllComponents();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('delete all'),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        serializedDiagram = controller.serialize();
                      },
                      child: const Text('serialize'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        controller
                          ..removeAllComponents()
                          ..deserialize(serializedDiagram);
                      },
                      child: const Text('deserialize'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _highlight(String id) {
    controller.getComponent(id).data?.isHighlighted = true;
    controller.updateComponent(id);
    selectedComponentId = id;
  }

  void _hideHighlight(String? id) {
    if (id != null) {
      controller.getComponent(id).data?.isHighlighted = false;
      controller.updateComponent(id);
      selectedComponentId = null;
    }
  }

  bool _connectComponents(String? sourceId, String? targetId) {
    if (sourceId == null || targetId == null || sourceId == targetId) return false;
    if (controller.getComponent(sourceId).connections.any(
          (c) => c is OutgoingConnection && c.otherComponentId == targetId,
        )) {
      return false;
    }
    controller.connect(
      sourceComponentId: sourceId,
      targetComponentId: targetId,
      linkStyle: const LinkStyle(
        arrowType: ArrowType.pointedArrow,
        lineWidth: 1.5,
        backArrowType: ArrowType.centerCircle,
      ),
    );
    return true;
  }
}
```

---

## Migration Checklist

- [ ] Remove `provider` from `pubspec.yaml`
- [ ] Delete all `PolicySet` subclasses and mixin files
- [ ] Create `DiagramController<C, L>` with `CanvasConfig` and optional `JsonCodec`s
- [ ] Replace `DiagramEditorContext` with `DiagramController`
- [ ] Replace `DiagramEditor(diagramEditorContext:)` with `DiagramEditor(controller:, componentBuilder:)`
- [ ] Move `showComponentBody()` to `componentBuilder` callback
- [ ] Move `showCustomWidgetsOnCanvasBackground/Foreground` to `backgroundBuilder`/`foregroundBuilder`
- [ ] Move `showCustomWidgetWithComponentData*` to `componentOverlayBuilder`/`componentUnderlayBuilder`
- [ ] Move `showWidgetsWithLinkData` to `linkWidgetBuilder`
- [ ] Move `initializeDiagramEditor()` to `onInit` or `CanvasConfig`
- [ ] Move all gesture methods from policy mixins to widget callbacks
- [ ] Replace all `canvasWriter.model.*` calls with `controller.*`
- [ ] Replace all `canvasReader.model.*` calls with `controller.*`
- [ ] Replace all `canvasWriter.state.*` / `canvasReader.state.*` with `controller.*`
- [ ] Replace `componentData.data as MyType` casts with `component.data` (now type-safe)
- [ ] Replace `ConnectionOut` with `OutgoingConnection`
- [ ] Replace `ConnectionIn` with `IncomingConnection`
- [ ] Replace `connection.connectionId` with `connection.linkId`
- [ ] Replace `connectTwoComponents(...)` with `controller.connect(...)`
- [ ] Replace `LinkAttachment*Policy` mixin with `LinkAttachment.*()` function
- [ ] Set up `JsonCodec` for serialization (replaces `decodeCustomComponentData`/`decodeCustomLinkData` params)
- [ ] Replace `serializeDiagram()` with `controller.serialize()`
- [ ] Replace `deserializeDiagram(json, ...)` with `controller.deserialize(json)`
- [ ] Migrate any persisted JSON data to new format if needed (connection direction, enum names)
- [ ] Test all gestures, serialization, and visual rendering

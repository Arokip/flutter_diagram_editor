# diagram_editor

[![pub package](https://img.shields.io/pub/v/diagram_editor.svg)](https://pub.dev/packages/diagram_editor)

[Github](https://github.com/Arokip/fdl)

Flutter diagram editor library for showing and editing diagrams of custom type. It provides DiagramEditor widget and a possibility to customize all editor design and behavior.

<img src="https://user-images.githubusercontent.com/20387953/114435850-f1f20f00-9bc4-11eb-8d97-a16c40c326cb.png">

[Demo App Example](https://arokip.github.io/fdl_demo_app) ([example source code](https://github.com/Arokip/fdl_demo_app))


## Getting Started

Simple example of this package usage is in [`/example`](https://github.com/Arokip/fdl/tree/master/example) folder.

Use of `DiagramEditor` widget:

```dart
DiagramEditor(
  diagramEditorContext: DiagramEditorContext(
    policySet: myPolicySet,
  ),
),
```

`myPolicySet` is a class composed of mixins, for example:

```
class MyPolicySet extends PolicySet
    with
        MyInitPolicy,
        CanvasControlPolicy,
        LinkControlPolicy,
        LinkJointControlPolicy,
        LinkAttachmentRectPolicy {}
```

`MyInitpolicy` can be following:

```
mixin MyInitPolicy implements InitPolicy {
  @override
  initializeDiagramEditor() {
    canvasWriter.state.setCanvasColor(Colors.grey[300]);
  }
}
```

There are several editor policies that can be implemented and added to policy set:
- `InitPolicy`
- `CanvasPolicy`
- `ComponentPolicy`
- `ComponentDesignPolicy`
- `LinkPolicy`
- `LinkJointPolicy`
- `LinkAttachmentPolicy`
- `LinkWidgetsPolicy`
- `CanvasWidgetsPolicy`
- `ComponentWidgetsPolicy`

Some policies are already implemented and ready to use:
- `CanvasControlPolicy`
- `LinkControlPolicy`
- `LinkJointControlPolicy`
- `LinkAttachmentRectPolicy`


More in examples (links above).

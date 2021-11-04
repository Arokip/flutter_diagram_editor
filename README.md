# diagram_editor

[![pub package](https://img.shields.io/pub/v/diagram_editor.svg)](https://pub.dev/packages/diagram_editor)

Flutter diagram editor library for showing and editing diagrams of custom type. It provides DiagramEditor widget and a possibility to customize all editor design and behavior.

<img src="https://user-images.githubusercontent.com/20387953/114435850-f1f20f00-9bc4-11eb-8d97-a16c40c326cb.png">

[Demo App Example](https://arokip.github.io/fdl_demo_app) ([example source code](https://github.com/Arokip/fdl_demo_app))


## Getting Started

Use of `DiagramEditor` widget:

```
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
    canvasWriter.state.setCanvasColor(Colors.grey);
  }
}
```

For example in `MyCanvasPolicy` in function `onCanvasTapUp(TapUpDetails details)` a new component is added if no component is selected.

```
mixin MyCanvasPolicy implements CanvasPolicy, CustomPolicy {
  @override
  onCanvasTapUp(TapUpDetails details) async {
    canvasWriter.model.hideAllLinkJoints();
    if (selectedComponentId != null) {
      hideComponentHighlight(selectedComponentId);
    } else {
      canvasWriter.model.addComponent(
        ComponentData(
          size: Size(96, 72),
          position: canvasReader.state.fromCanvasCoordinates(details.localPosition),
          data: MyComponentData(),
        ),
      );
    }
  }
}
```

There are several editor policies that can be implemented and added to the policy set:
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

Possibilities of usage of individual policies are described in the documentation.
More in examples (links above).

<img src="https://user-images.githubusercontent.com/20387953/115140531-1bcd8a80-a038-11eb-8c67-d960a92666c2.gif">

# 1.0.0

**Breaking:** Complete API redesign for simplicity and type safety.

### New
* **Generic type parameters** `<C, L>` on `DiagramController`, `DiagramEditor`, `ComponentData`, and `LinkData` — eliminates `dynamic data` casting.
* **Callback-based API** — all gesture handling via optional callbacks on `DiagramEditor` instead of 10 policy mixins.
* **`DiagramController<C, L>`** — single class replaces `PolicySet` + `Reader/Writer` + `Context` (23 files consolidated into 1).
* **`CanvasConfig`** — immutable configuration for canvas behavior (scale bounds, zoom, background color).
* **`sealed class Connection`** with `OutgoingConnection` / `IncomingConnection` — Dart 3 exhaustive matching.
* **`JsonCodec<T>`** — type-safe serialization for custom component/link data.
* **Default behaviors as extensions** — `DefaultCanvasBehaviors`, `DefaultLinkBehaviors`, `DefaultJointBehaviors` are opt-in and composable.
* **`LinkAttachment`** — static methods (`rectangular`, `oval`, `crystal`, `center`) replace mixin policies.
* **CI/CD** — GitHub Actions workflow for analyze, test, and format.

### Changed
* Replaced `provider` dependency with built-in `ListenableBuilder`.
* Replaced `flutter_lints` with `very_good_analysis`.
* Serialization uses enum name strings instead of indices for forward compatibility.
* Fixed `shouldRepaint` in all painters (was always returning `true`).
* All tests now have proper isolation (each test creates its own controller).

### Removed
* `PolicySet` and all 10 policy mixins.
* `CanvasReader` / `CanvasWriter` / `ModelReader` / `ModelWriter` / `StateReader` / `StateWriter` abstraction layer.
* `DiagramEditorContext` (replaced by passing controller directly).
* `provider` dependency.

### Migration Guide

| v0.x | v1.0 |
|------|------|
| `PolicySet` with mixins | `DiagramEditor(controller:, componentBuilder:, onCanvasTapUp:, ...)` |
| `DiagramEditorContext(policySet:)` | `DiagramEditor(controller:)` |
| `canvasWriter.model.addComponent(...)` | `controller.addComponent(...)` |
| `canvasReader.state.fromCanvasCoordinates(...)` | `controller.fromCanvasCoordinates(...)` |
| `componentData.data as MyType` | `componentData.data` (typed via `ComponentData<MyType>`) |
| `CanvasControlPolicy` mixin | `enableDefaultPanZoom: true` (default) |
| `LinkControlPolicy` mixin | `enableDefaultLinkControl: true` (default) |
| `LinkAttachmentRectPolicy` mixin | `linkEndpointAlignment: LinkAttachment.rectangular()` (default) |
| `ComponentDesignPolicy.showComponentBody` | `componentBuilder: (context, data) => ...` |

# 0.2.3

* Change color serialization to Json approach (thanks pklosek)

# 0.2.2

* Update SDK to `sdk: ">=3.5.0 <4.0.0"`
* Fix: new static analysis

# 0.2.1

* Fix: dart format

# 0.2.0

* Updated to dart >=3.0.0
* Updated dependencies
* Added linter rules and project formatted.
* Demo app example code updated.

* Fixed example
* Added `showLinksOnTopOfComponents` option to canvas_policy.

# 0.1.9

* Fixed example
* Added `showLinksOnTopOfComponents` option to canvas_policy.

# 0.1.8

* Update dependencies.

# 0.1.7

* Update dependencies.

# 0.1.6

* Update dependencies.

# 0.1.5

* Run flutter format again.

# 0.1.4

* Update dependencies.
* Flutter format to get max pub.dev points.

# 0.1.3

* Fix flutter analysis issues.

# 0.1.2

* Add `serializeDiagram()` and `deserializeDiagram()` functions to allow saving the diagram.
* Update dependencies.
* Example update -- it should now explain how to use the serialization.

# 0.1.1

* Format code.

# 0.1.0

* ### Migrate to null-safety.

* Adds componentExists function.
* Adds linkExists function.

# 0.0.12

* Update dependencies in pubspec.yaml file.

# 0.0.11

* Update pubspec.yaml file.

# 0.0.10

* Fix remove component with children test.

# 0.0.9

* Add documentation comments to reader/writer.
* Move custom components widgets from Canvas to Component.

# 0.0.8

* Add some more documentation comments.
* Fix documentation comments.

# 0.0.7

* Add more documentation comments.
* Fix readme.

# 0.0.6

* Add documentation comments.
* Update the example and add comments to it.
* Update readme file.
* Add some asserts ("the model must contain this id").

# 0.0.5

* Fix add/remove component parent.
* Prevent parent-child loops.

# 0.0.4

* Other link attachment policies.

# 0.0.3

* Fix example.

# 0.0.2

* Add example.
* Update dependencies.
* Description in yaml.

# 0.0.1

* Initial release.

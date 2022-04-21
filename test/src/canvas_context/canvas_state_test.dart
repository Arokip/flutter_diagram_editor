import 'package:diagram_editor/src/abstraction_layer/policy/base/policy_set.dart';
import 'package:diagram_editor/src/canvas_context/diagram_editor_context.dart';
import 'package:diagram_editor/src/widget/editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Canvas state tests', () {
    test(
      'Given new DiagramEditor When no action Then canvas position is zero and scale is 1',
      () {
        PolicySet policySet = PolicySet();

        MaterialApp(
          home: DiagramEditor(
            diagramEditorContext: DiagramEditorContext(
              policySet: policySet,
            ),
          ),
        );

        expect(policySet.canvasReader.state.scale, 1);
        expect(policySet.canvasReader.state.position, Offset.zero);
      },
    );
  });
}

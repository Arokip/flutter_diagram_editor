import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/basics/basic_policy_set.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/diagram_editor_context.dart';
import 'package:flutter_diagram_editor/architecture_merge/widget/editor.dart';

void main() {
  runApp(ArchitectureEditorMerge());
}

class ArchitectureEditorMerge extends StatefulWidget {
  @override
  _ArchitectureEditorMergeState createState() =>
      _ArchitectureEditorMergeState();
}

class _ArchitectureEditorMergeState extends State<ArchitectureEditorMerge> {
  BasicPolicySet basicPolicySet = BasicPolicySet();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                color: Colors.green,
                // width: 600,
                // height: 400,
                child: DiagramEditor(
                  diagramEditorContext: DiagramEditorContext(
                    policySet: basicPolicySet,
                  ),
                ),
              ),
              Container(
                color: Colors.yellow,
                width: 48,
                height: 24,
                child: GestureDetector(
                  onTap: () {
                    basicPolicySet.resetView();
                  },
                ),
              ),
              Container(
                color: Colors.red,
                width: 24,
                height: 24,
                child: GestureDetector(
                  onTap: () {
                    basicPolicySet.removeAll();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

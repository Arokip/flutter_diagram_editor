import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/basic/basic_policy_set.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/diagram_editor_context.dart';
import 'package:flutter_diagram_editor/architecture/widget/editor.dart';

class Architecture extends StatefulWidget {
  @override
  _ArchitectureState createState() => _ArchitectureState();
}

class _ArchitectureState extends State<Architecture> {
  DiagramEditorContext diagramEditorContext1;
  DiagramEditorContext diagramEditorContext2;
  DiagramEditorContext diagramEditorContext3;
  DiagramEditorContext diagramEditorContext4;

  @override
  void initState() {
    diagramEditorContext1 = DiagramEditorContext(
      policySet: BasicPolicySet(),
    );
    diagramEditorContext2 = DiagramEditorContext.withSharedModel(
      diagramEditorContext1,
      policySet: BasicPolicySet(),
    );
    diagramEditorContext3 = DiagramEditorContext.withSharedState(
      diagramEditorContext1,
      policySet: BasicPolicySet(),
    );
    diagramEditorContext4 = DiagramEditorContext.withSharedModelAndState(
      diagramEditorContext1,
      policySet: BasicPolicySet(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              SizedBox(width: 16),
              Column(
                children: [
                  Container(child: Text('new context')),
                  DiagramEditor(
                    canvasContext: diagramEditorContext1,
                    width: 400,
                    height: 300,
                    color: Colors.green,
                  ),
                  SizedBox(height: 16),
                  Container(child: Text('shared model')),
                  DiagramEditor(
                    canvasContext: diagramEditorContext2,
                    width: 400,
                    height: 300,
                    color: Colors.pink,
                  ),
                ],
              ),
              SizedBox(width: 16),
              Column(
                children: [
                  Container(child: Text('shared state')),
                  DiagramEditor(
                    canvasContext: diagramEditorContext3,
                    width: 400,
                    height: 300,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 16),
                  Container(child: Text('shared model state')),
                  DiagramEditor(
                    canvasContext: diagramEditorContext4,
                    width: 400,
                    height: 300,
                    color: Colors.lightGreenAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:diagram_editor/diagram_editor.dart';
import 'package:diagram_editor/example/my_policy_set.dart';

import 'package:flutter/material.dart';

void main() => runApp(DiagramApp());

class DiagramApp extends StatefulWidget {
  @override
  _DiagramAppState createState() => _DiagramAppState();
}

class _DiagramAppState extends State<DiagramApp> {
  MyPolicySet myPolicySet = MyPolicySet();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(color: Colors.grey),
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  color: Colors.green,
                  child: DiagramEditor(
                    diagramEditorContext: DiagramEditorContext(
                      policySet: myPolicySet,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => myPolicySet.deleteAllComponents(),
                child: Container(
                  width: 64,
                  height: 32,
                  color: Colors.red,
                  child: Center(child: Text('delete all')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

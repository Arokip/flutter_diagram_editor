import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_context.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_misc.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/component_data.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/link_data.dart';
import 'package:flutter_diagram_editor/architecture/widget/editor.dart';

void main() {
  runApp(Architecture());
}

class Architecture extends StatefulWidget {
  @override
  _ArchitectureState createState() => _ArchitectureState();
}

class _ArchitectureState extends State<Architecture> {
  CanvasModel model1 = CanvasModel();
  CanvasModel model2 = CanvasModel();

  CanvasState state1 = CanvasState();
  CanvasState state2 = CanvasState();

  @override
  void initState() {
    model1.addComponent(ComponentData(position: Offset(120, 20)));
    model1.addComponent(ComponentData(position: Offset(320, 240)));
    model1.addLink(LinkData(position: Offset(100, 160)));

    model2.addComponent(ComponentData(position: Offset(180, 40)));
    model2.addComponent(ComponentData(position: Offset(120, 140)));
    model2.addComponent(ComponentData(position: Offset(160, 200)));
    model2.addLink(LinkData(position: Offset(80, 80)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          child: Row(
            children: [
              Icon(Icons.arrow_back, size: 16),
              SizedBox(width: 8),
              Text('BACK TO MENU'),
            ],
          ),
          onPressed: () => Navigator.pop(context),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 300,
              child: Text('state1'),
            ),
            Container(
              height: 300,
              child: Text('state2'),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              child: Text('model1'),
            ),
            DiagramEditor(
              canvasContext: CanvasContext(
                canvasModel: model1,
                canvasState: state1,
                canvasMisc: CanvasMisc(),
              ),
              width: 400,
              height: 300,
              color: Colors.green,
            ),
            SizedBox(height: 16),
            DiagramEditor(
              canvasContext: CanvasContext(
                canvasModel: model1,
                canvasState: state2,
                canvasMisc: CanvasMisc(),
              ),
              width: 400,
              height: 300,
              color: Colors.pink,
            ),
          ],
        ),
        SizedBox(width: 16),
        Column(
          children: [
            Container(
              child: Text('model2'),
            ),
            DiagramEditor(
              canvasContext: CanvasContext(
                canvasModel: model2,
                canvasState: state1,
                canvasMisc: CanvasMisc(),
              ),
              width: 400,
              height: 300,
              color: Colors.blue,
            ),
            SizedBox(height: 16),
            DiagramEditor(
              canvasContext: CanvasContext(
                canvasModel: model2,
                canvasState: state2,
                canvasMisc: CanvasMisc(),
              ),
              width: 400,
              height: 300,
              color: Colors.lightGreenAccent,
            ),
          ],
        ),
      ],
    );
  }
}

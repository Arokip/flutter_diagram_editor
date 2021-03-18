import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/link_data.dart';
import 'package:provider/provider.dart';

class Link extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var linkData = Provider.of<LinkData>(context);
    var canvasState = Provider.of<CanvasState>(context);

    return Positioned(
      left: linkData.position.dx + canvasState.position.dx,
      top: linkData.position.dy + canvasState.position.dy,
      child: GestureDetector(
        onTapDown: (d) {
          print('link tap: ${d.localPosition}');
        },
        child: Container(
          color: Colors.yellow,
          child: Text('link', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:provider/provider.dart';

class ComponentBodyWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var componentIdString =
        context.select<ComponentData, String>((ComponentData cmp) => cmp.id);

    return Container(
      decoration: BoxDecoration(
        color: Colors.limeAccent,
        borderRadius: BorderRadius.circular(10 * canvasScale),
        border: Border.all(
          width: 1.0 * canvasScale,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          componentIdString,
          style: TextStyle(fontSize: 12 * canvasScale),
        ),
      ),
    );
  }
}

class MenuComponentBodyWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.limeAccent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          'body1',
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

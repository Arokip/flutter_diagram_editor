import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:provider/provider.dart';

class ComponentBodyWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);

    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        border: Border.all(
          width: 1.0 * canvasScale,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.account_circle,
          color: Colors.black,
          size: 40 * canvasScale,
        ),
      ),
    );
  }
}

class MenuComponentBodyWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.account_circle,
          color: Colors.black,
          size: 12,
        ),
      ),
    );
  }
}

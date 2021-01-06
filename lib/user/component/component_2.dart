import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/user/component/component_3.dart';
import 'package:provider/provider.dart';

import 'component_common.dart';

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
          Icons.style,
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
          Icons.style,
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }
}

ComponentData generateComponent2(CanvasModel model) {
  return ComponentData(
    size: Size(120, 80),
    portSize: 20,
    portList: [],
    optionsData: ComponentCommon.optionsData(model),
    customData: MyCustomComponentData(
      someText: 'my text',
    ),
    componentBodyName: 'body2',
  );
}

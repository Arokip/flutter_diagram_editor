import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor/component/component_common.dart';
import 'package:flutter_diagram_editor/library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/library/model/component_data.dart';
import 'package:flutter_diagram_editor/library/model/custom_component_data.dart';
import 'package:flutter_diagram_editor/library/model/port_data.dart';
import 'package:provider/provider.dart';

class ComponentBodyWidgetOval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);

    return LayoutBuilder(builder: (context, size) {
      return GestureDetector(
        onLongPress: () {
          print('long press');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.all(
                Radius.elliptical(size.maxWidth, size.maxHeight)),
            border: Border.all(
              width: 2.0 * canvasScale,
              color: Colors.black,
            ),
          ),
          child: Center(
            child: Text(
              'body oval',
              style: TextStyle(fontSize: 12 * canvasScale),
            ),
          ),
        ),
      );
    });
  }
}

class MenuComponentBodyWidgetOval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.all(
              Radius.elliptical(size.maxWidth, size.maxHeight)),
          border: Border.all(
            width: 2.0,
            color: Colors.black,
          ),
        ),
        child: Center(
          child: Text(
            'body oval',
            style: TextStyle(fontSize: 12),
          ),
        ),
      );
    });
  }
}

ComponentData generateComponentOval(CanvasModel model) {
  return ComponentData(
    size: Size(120, 80),
    portSize: 20,
    portList: [
      PortData(
        color: Colors.green,
        borderColor: Colors.black,
        alignment: Alignment(-1, 0),
        portType: ComponentCommon.randomPortType(),
      ),
      PortData(
        color: Colors.red,
        borderColor: Colors.black,
        alignment: Alignment(1, 0),
        portType: ComponentCommon.randomPortType(),
      ),
    ],
    topOptions: ComponentCommon.topOptions,
    bottomOptions: ComponentCommon.bottomOptions,
    // customData: MyCustomComponentData(
    //   firstText: 'first',
    //   secondText: 'second',
    //   count: 10,
    // ),
    customData: ExampleCustomComponentData(
      exampleString: 'exstr',
      exampleList: [4, 2],
    ),
    componentBodyName: 'body oval',
  );
}

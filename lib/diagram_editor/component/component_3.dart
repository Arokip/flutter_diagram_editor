import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor/component/component_common.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ComponentBodyWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);

    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(10 * canvasScale),
        border: Border.all(
          width: 1.0 * canvasScale,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          'orange',
          style: TextStyle(fontSize: 12 * canvasScale),
        ),
      ),
    );
  }
}

class MenuComponentBodyWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          'orange',
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

ComponentData generateComponent3(CanvasModel model) {
  Uuid uuid = Uuid();
  return ComponentData(
    size: Size(64, 100),
    portSize: 20,
    portList: [
      PortData(
        id: uuid.v4(),
        color: Colors.white,
        borderColor: Colors.grey[800],
        alignment: Alignment(0, -1),
        portType: ComponentCommon.randomPortType(),
      ),
      PortData(
        id: uuid.v4(),
        color: Colors.white,
        borderColor: Colors.grey[800],
        alignment: Alignment(0, 1),
        portType: ComponentCommon.randomPortType(),
      ),
    ],
    topOptions: ComponentCommon.topOptions,
    bottomOptions: ComponentCommon.bottomOptions,
    customData: MyCustomComponentData(
      firstText: 'first',
      secondText: 'second',
      count: 10,
    ),
    componentBodyName: 'body3',
  );
}

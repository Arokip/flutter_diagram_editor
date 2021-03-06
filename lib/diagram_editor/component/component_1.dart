import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor/component/component_common.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ComponentBodyWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var componentIdString =
        context.select<ComponentData, String>((ComponentData cmp) => cmp.id);
    var componentSize =
        context.select<ComponentData, Size>((ComponentData cmp) => cmp.size);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
        ),
        Positioned(
          top: -20,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'label above',
              style: TextStyle(fontSize: 12 * canvasScale),
            ),
          ),
        ),
        Positioned(
          top: componentSize.height + 40,
          right: -60,
          child: Text(
            'label anywhere',
            style: TextStyle(
              fontSize: 10 * canvasScale,
              color: Colors.red,
            ),
          ),
        ),
      ],
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
          'component ID',
          style: TextStyle(fontSize: 9),
        ),
      ),
    );
  }
}

ComponentData generateComponent1(CanvasModel model) {
  return ComponentData(
    size: Size(120, 80),
    portSize: 20,
    portList: [
      PortData(
        id: Uuid().v4(),
        color: Colors.black,
        borderColor: Colors.white,
        alignment: Alignment(0, 0),
        portType: ComponentCommon.randomPortType(),
      )
    ],
    topOptions: ComponentCommon.topOptions,
    bottomOptions: ComponentCommon.bottomOptions,
    // no data: customData: MyCustomComponentData(
    //   firstText: 'first',
    //   secondText: 'second',
    //   count: 10,
    // ),
    componentBodyName: 'body1',
  );
}

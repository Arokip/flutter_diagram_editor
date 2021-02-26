import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/custom_component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_json/etl_components_list.dart';
import 'package:provider/provider.dart';

class ComponentBodyRect extends StatelessWidget {
  final EtlJarTemplateItem template;

  const ComponentBodyRect({
    Key key,
    this.template,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var customData = context.select<ComponentData, CustomComponentData>(
        (ComponentData cmp) => cmp.customData) as RectCustomComponentData;

    return Container(
      decoration: BoxDecoration(
        color: customData.color == null
            ? Color(
                int.parse(template.color.substring(1), radix: 16) + 0xFF000000)
            : Color(int.parse(customData.color.substring(1), radix: 16) +
                0xFF000000),
        border: Border.all(
          width: 2.0 * canvasScale,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          customData.label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12 * canvasScale),
        ),
      ),
    );
  }
}

class MenuComponentBodyRect extends StatelessWidget {
  final EtlJarTemplateItem template;

  const MenuComponentBodyRect({
    Key key,
    this.template,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(
            int.parse(template.color.substring(1), radix: 16) + 0xFF000000),
        border: Border.all(
          width: 2.0,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          template.label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

ComponentData generateComponentRect({
  CanvasModel model,
  List<EtlPortItem> ports,
  EtlJarTemplateItem template,
  Offset position = Offset.zero,
  Size size = const Size(120, 80),
}) {
  List<PortData> portDataList = [];
  int inPortCount = ports
      .where((port) =>
          port.io == EtlPortItemType.inputConf ||
          port.io == EtlPortItemType.input)
      .length;
  int outPortCount =
      ports.where((port) => port.io == EtlPortItemType.output).length;
  int inPortIndex = 1;
  int outPortIndex = 1;

  ports.forEach((port) {
    Color portColor;
    if (port.io == EtlPortItemType.inputConf) {
      portColor = Colors.pink;
    } else if (port.io == EtlPortItemType.input) {
      portColor = Colors.green;
    } else if (port.io == EtlPortItemType.output) {
      portColor = Colors.yellow;
    }
    bool isPortInput = port.io == EtlPortItemType.inputConf ||
        port.io == EtlPortItemType.input;
    portDataList.add(
      PortData(
        id: port.binding,
        color: portColor,
        borderColor: Colors.black,
        alignment: Alignment(
            (isPortInput) ? -1 : 1,
            (isPortInput)
                ? ((2 * inPortIndex++ - 1) / (inPortCount * 2)) * 2 - 1
                : ((2 * outPortIndex++ - 1) / (outPortCount * 2)) * 2 - 1),
        portType:
            '${port.portType}${(isPortInput) ? EtlPortItemType.input.toString() : EtlPortItemType.output.toString()}',
      ),
    );
  });

  // for (int i = 0; i < ports.length; i++) {
  //   Color portColor;
  //   if (ports[i].io == EtlPortItemType.inputConf) {
  //     portColor = Colors.pink;
  //   } else if (ports[i].io == EtlPortItemType.input) {
  //     portColor = Colors.green;
  //   } else if (ports[i].io == EtlPortItemType.output) {
  //     portColor = Colors.yellow;
  //   }
  //   portDataList.add(
  //     PortData(
  //       id: ports[i].binding,
  //       color: portColor,
  //       borderColor: Colors.black,
  //       alignment: Alignment(0, i / ports.length),
  //       portType:
  //           '${ports[i].portType}${(ports[i].io == EtlPortItemType.inputConf) ? EtlPortItemType.input.toString() : ports[i].io.toString()}',
  //     ),
  //   );
  // }

  return ComponentData(
    position: position,
    size: size,
    portSize: 20,
    portList: portDataList,
    topOptions: [
      'delete',
      'duplicate',
    ],
    customData: RectCustomComponentData(label: template.label),
    componentBodyName: template.id,
  );
}

class RectCustomComponentData extends CustomComponentData {
  String label;
  String description;
  String color;

  RectCustomComponentData({
    this.label = '',
    this.description = '',
    this.color,
  }) : super();

  RectCustomComponentData.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        description = json['description'],
        color = json['color'];

  @override
  Map<String, dynamic> toJson() => {
        'label': label,
        'description': description,
        'color': color,
      };

  @override
  CustomComponentData duplicate() {
    return RectCustomComponentData(
      label: label,
      description: description,
      color: color,
    );
  }
}

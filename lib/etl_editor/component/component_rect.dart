import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/custom_component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_components_list.dart';
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
        color: Color(
            int.parse(template.color.substring(1), radix: 16) + 0xFF000000),
        border: Border.all(
          width: 2.0 * canvasScale,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          customData.label,
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
  for (int i = 0; i < ports.length; i++) {
    portDataList.add(
      PortData(
        color: Colors.black,
        borderColor: Colors.white,
        alignment: Alignment(0, i / ports.length),
        portType: ports[i].portType + ports[i].io.toString(),
      ),
    );
  }

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

  RectCustomComponentData({
    this.label = '',
  }) : super();

  RectCustomComponentData.fromJson(Map<String, dynamic> json)
      : label = json['label'];

  @override
  Map<String, dynamic> toJson() => {
        'label': label,
      };

  @override
  CustomComponentData duplicate() {
    return RectCustomComponentData(
      label: label,
    );
  }
}

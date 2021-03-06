import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
    var componentData = Provider.of<ComponentData>(context, listen: true);
    var customData = componentData.customData as RectCustomComponentData;

    return GestureDetector(
      onLongPress: () {
        showEditComponentDialog(context, componentData);
      },
      child: Container(
        decoration: BoxDecoration(
          color: customData.color == null
              ? Color(int.parse(template.color.substring(1), radix: 16) +
                  0xFF000000)
              : Color(int.parse(customData.color.substring(1), radix: 16) +
                  0xFF000000),
          border: Border.all(
            width: 2.0 * canvasScale,
            color: Colors.black,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                customData.label,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12 * canvasScale),
              ),
              if (customData.description != null)
                Text(
                  customData.description,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(fontSize: 12 * canvasScale),
                ),
            ],
          ),
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

  return ComponentData(
    position: position,
    size: size,
    portSize: 20,
    portList: portDataList,
    topOptions: [
      'delete',
      'duplicate',
      'edit',
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
    this.description,
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

void showEditComponentDialog(
    BuildContext context, ComponentData componentData) {
  RectCustomComponentData customData = componentData.customData;

  final labelController = TextEditingController(text: customData.label ?? '');
  final descriptionController =
      TextEditingController(text: customData.description ?? '');

  showDialog(
    barrierDismissible: false,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          children: [
            SizedBox(width: 600),
            Text('Edit component', style: TextStyle(fontSize: 20)),
            TextField(
              controller: labelController,
              maxLines: 1,
              decoration: InputDecoration(
                // hintText: 'Find Group',
                labelText: 'Label',
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 13),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              textInputAction: TextInputAction.newline,
              maxLines: 1,
              decoration: InputDecoration(
                // hintText: 'Find Group',
                labelText: 'Description',
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 13),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(color: Colors.grey[300]),
                  ),
                ),
                onPressed: () {
                  showPickColorDialog(context, componentData);
                },
                child: Text('Change color'),
              ),
            ),
          ],
        ),
        scrollable: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('DISCARD'),
          ),
          TextButton(
            onPressed: () {
              customData.label = labelController.text;
              customData.description = descriptionController.text == ''
                  ? null
                  : descriptionController.text;
              componentData.componentUpdateData();
              Navigator.of(context).pop();
            },
            child: Text('SAVE'),
          )
        ],
      );
    },
  );
}

void showPickColorDialog(BuildContext context, ComponentData componentData) {
  RectCustomComponentData customData = componentData.customData;
  Color pickerColor = customData.color == null
      ? Colors.white
      : Color(int.parse(customData.color.substring(1), radix: 16) + 0xFF000000);
  Color currentColor = customData.color == null
      ? Colors.white
      : Color(int.parse(customData.color.substring(1), radix: 16) + 0xFF000000);

  showDialog(
    context: context,
    barrierDismissible: false,
    useSafeArea: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Pick a component color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: (color) => currentColor = color,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Set color'),
            onPressed: () {
              customData.color = '#${currentColor.value.toRadixString(16)}';
              componentData.componentUpdateData();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

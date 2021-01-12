import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_options_data.dart';
import 'package:flutter_provider_canvas/model/custom_component_data.dart';

class ComponentCommon {
  static Map<String, ComponentOptionData> optionsData(CanvasModel model) => {
        'map': ComponentOptionData(
          color: Colors.lime,
          icon: Icons.map,
          tooltip: "map",
          onOptionTap: (cid) {
            print('map tap: $cid');
          },
        ),
        'no': ComponentOptionData(),
        'nothing': ComponentOptionData(tooltip: "nothing"),
        'delete': ComponentOptionData(
          color: Colors.red,
          icon: Icons.delete_forever,
          tooltip: "Delete",
          onOptionTap: (cid) {
            model.removeComponentFromList(cid);
            print('remove component: $cid');
          },
        ),
        'duplicate': ComponentOptionData(
          color: Colors.yellow,
          icon: Icons.copy,
          tooltip: "Duplicate",
          onOptionTap: (cid) {
            model.duplicateComponentBelow(cid, Offset(0, 24));
            print('duplicate component: $cid');
          },
        ),
        'remove connections': ComponentOptionData(
          color: Colors.deepPurple,
          icon: Icons.link_off,
          tooltip: "Remove all connections",
          onOptionTap: (cid) {
            model.removeComponentConnections(cid);
            print('remove connections: $cid');
          },
        ),
        'resize': ComponentOptionData(
          color: Colors.deepOrange,
          icon: Icons.aspect_ratio,
          tooltip: "Resize",
          onOptionTap: (cid) {
            model.resizeComponent(cid);
            print('resize: $cid');
          },
        ),
      };

  static List<String> topOptions = [
    'map',
    'no',
    'nothing',
  ];
  static List<String> bottomOptions = [
    'delete',
    'duplicate',
    'remove connections',
    'resize',
  ];
}

class MyCustomComponentData extends CustomComponentData {
  String firstText;
  String secondText;
  int count;

  MyCustomComponentData({
    this.firstText,
    this.secondText,
    this.count,
  });

  @override
  CustomComponentData duplicate() {
    return MyCustomComponentData(
      firstText: 'count: $count',
      secondText: secondText,
      count: count + 1,
    );
  }

  @override
  String serialize() {
    return 'TODO: *serialized custom component data*';
  }

  @override
  CustomComponentData deserialize(String data) {
    return MyCustomComponentData(); // TODO: deserialize
  }
}

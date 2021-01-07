import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_options_data.dart';
import 'package:flutter_provider_canvas/model/custom_component_data.dart';

class ComponentCommon {
  static ComponentOptionsData optionsData(CanvasModel model,
          [double optionSize = 40]) =>
      ComponentOptionsData(
        optionSize: optionSize,
        optionsTop: [
          ComponentOptionData(
            color: Colors.lime,
            icon: Icons.map,
            tooltip: "map",
            onOptionTap: (cid) {
              print('map tap: $cid');
            },
          ),
          ComponentOptionData(),
          ComponentOptionData(tooltip: "nothing"),
        ],
        optionsBottom: [
          ComponentOptionData(
            color: Colors.red,
            icon: Icons.delete_forever,
            tooltip: "Delete",
            onOptionTap: (cid) {
              model.removeComponentFromList(cid);
              print('remove component: $cid');
            },
          ),
          ComponentOptionData(
            color: Colors.yellow,
            icon: Icons.copy,
            tooltip: "Duplicate",
            onOptionTap: (cid) {
              model.duplicateComponentBelow(cid, Offset(0, 24));
              print('duplicate component: $cid');
            },
          ),
          ComponentOptionData(
            color: Colors.deepPurple,
            icon: Icons.link_off,
            tooltip: "Remove all connections",
            onOptionTap: (cid) {
              model.removeComponentConnections(cid);
              print('remove connections: $cid');
            },
          ),
          ComponentOptionData(
            color: Colors.deepOrange,
            icon: Icons.aspect_ratio,
            tooltip: "Resize",
            onOptionTap: (cid) {
              model.resizeComponent(cid);
              print('resize: $cid');
            },
          )
        ],
      );
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
}

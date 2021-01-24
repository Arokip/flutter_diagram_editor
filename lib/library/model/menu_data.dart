import 'package:flutter_diagram_editor/library/model/component_data.dart';

class MenuData {
  bool isMenuVisible = true;

  List<ComponentData> _menuComponentDataList = [];

  List<ComponentData> get menuComponentDataList => _menuComponentDataList;

  addComponentToMenu(ComponentData componentData) {
    _menuComponentDataList.add(componentData);
  }

  addComponentsToMenu(List<ComponentData> componentDataList) {
    _menuComponentDataList.addAll(componentDataList);
  }
}

import 'package:flutter_provider_canvas/model/component_data.dart';

class MenuData {
  List<ComponentData> _menuComponentDataList = [];

  List<ComponentData> get menuComponentDataList => _menuComponentDataList;

  addComponentToMenu(ComponentData componentData) {
    _menuComponentDataList.add(componentData);
  }

  addComponentsToMenu(List<ComponentData> componentDataList) {
    _menuComponentDataList.addAll(componentDataList);
  }
}

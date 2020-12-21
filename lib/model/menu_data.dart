import 'component_data.dart';

class MenuData {
  List<ComponentData> menuComponentDataList = [];

  addComponentToMenu(ComponentData componentData) {
    menuComponentDataList.add(componentData);
  }

  addComponentsToMenu(List<ComponentData> componentDataList) {
    menuComponentDataList.addAll(componentDataList);
  }
}

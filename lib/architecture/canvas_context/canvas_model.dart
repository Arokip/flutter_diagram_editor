import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/component_data.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/link_data.dart';
import 'package:uuid/uuid.dart';

class CanvasModel extends ChangeNotifier {
  Uuid uuid = Uuid();
  HashMap<String, ComponentData> components = HashMap();
  HashMap<String, LinkData> links = HashMap();

  addComponent(ComponentData componentData) {
    components[componentData.id] = componentData;
    notifyListeners();
  }

  addLink(LinkData linkData) {
    links[linkData.id] = linkData;
  }

  moveComponent(String id, Offset offset) {
    components[id].move(offset);
  }
}

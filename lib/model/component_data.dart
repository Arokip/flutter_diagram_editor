import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/item_selected.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';

import 'component_options_data.dart';
import 'custom_component_data.dart';

class ComponentData extends ChangeNotifier with ItemSelected {
  final int id;
  Offset position;
  Color color; // TODO: remove
  Size size;
  final Size minSize;
  final double portSize;

  HashMap<int, PortData> ports = HashMap<int, PortData>();

  final ComponentOptionsData optionsData;

  bool enableResize = false;

  CustomComponentData customData;

  final String componentBodyName;

  ComponentData({
    @required this.id,
    this.position = Offset.zero,
    this.color = Colors.white,
    this.size = const Size(80, 80),
    this.minSize = const Size(32, 32),
    this.portSize = 20,
    @required this.ports,
    this.optionsData = const ComponentOptionsData(),
    this.customData,
    @required this.componentBodyName,
  })  : assert(minSize < size),
        assert(position != null),
        assert(size != null),
        assert(portSize != null),
        assert(portSize > 0),
        assert(ports != null),
        assert(optionsData != null);

  componentNotifyListeners() {
    notifyListeners();
  }

  updateComponentDataPosition(Offset position) {
    this.position += position;
    notifyListeners();
  }

  addPort(PortData portData) {
    ports[portData.id] = portData;
  }

  getPortCenterPoint(int portId) {
    var componentCenter = Offset(size.width / 2, size.height / 2);
    var portCenter = Offset(portSize / 2, portSize / 2);
    var portPosition = Offset(
      componentCenter.dx * ports[portId].alignment.x,
      componentCenter.dy * ports[portId].alignment.y,
    );

    return position + componentCenter + portCenter + portPosition;
  }

  removeConnection(int connectionId) {
    ports.values.forEach((port) {
      port.removeConnection(connectionId);
    });
  }

  ComponentData duplicate(int newId, [Offset offset = const Offset(0, 0)]) {
    final HashMap<int, PortData> newPorts =
        HashMap<int, PortData>.from(ports.map((key, port) {
      return MapEntry<int, PortData>(key, port.duplicate(newId));
    }));

    return ComponentData(
      id: newId,
      color: Color(color.value),
      size: Size(size.width, size.height),
      portSize: portSize,
      ports: newPorts,
      optionsData: optionsData,
      position: position + offset,
      customData: customData.duplicate(),
      componentBodyName: componentBodyName,
    );
  }

  switchEnableResize() {
    enableResize = !enableResize;
    notifyListeners();
  }

  resize(Offset deltaSize) {
    var tempSize = size + deltaSize;
    if (tempSize.width < minSize.width) {
      tempSize = Size(minSize.width, tempSize.height);
    }
    if (tempSize.height < minSize.height) {
      tempSize = Size(tempSize.width, minSize.height);
    }
    size = tempSize;
    notifyListeners();
  }
}

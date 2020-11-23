import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/item_selected.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';

import 'component_options_data.dart';

class ComponentData extends ChangeNotifier with ItemSelected {
  final int id;
  Offset position;
  Color color;
  final Size size;
  final double portSize;

  final HashMap<int, PortData> ports;

  final ComponentOptionsData optionsData;

  ComponentData({
    this.id,
    this.position,
    this.color,
    this.size,
    this.portSize,
    this.ports,
    this.optionsData = const ComponentOptionsData(),
  });

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
      position: Offset(position.dx, position.dy + size.height) + offset,
    );
  }
}

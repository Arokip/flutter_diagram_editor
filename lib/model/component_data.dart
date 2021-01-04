import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/component_options_data.dart';
import 'package:flutter_provider_canvas/model/custom_component_data.dart';
import 'package:flutter_provider_canvas/model/item_selected.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';

class ComponentData extends ChangeNotifier with ItemSelected {
  final int id;
  Offset position;
  Size size;
  final Size minSize;
  final double portSize;

  final List<PortData> portList;
  HashMap<int, PortData> ports = HashMap<int, PortData>();

  final ComponentOptionsData optionsData;

  bool enableResize = false;

  CustomComponentData customData;

  final String componentBodyName;

  ComponentData({
    @required this.id, // TODO: user should not touch the ID
    this.position = Offset.zero,
    this.size = const Size(80, 80),
    this.minSize = const Size(32, 32),
    this.portSize = 20,
    this.portList = const [],
    this.optionsData = const ComponentOptionsData(),
    this.customData,
    @required this.componentBodyName,
  })  : assert(minSize < size),
        assert(position != null),
        assert(size != null),
        assert(portSize != null),
        assert(portSize > 0),
        assert(portList != null),
        assert(optionsData != null) {
    for (int i = 0; i < portList.length; i++) {
      ports[i] = portList[i];
    }
  }

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
    final List<PortData> newPorts = [];

    ports.values.forEach((port) {
      newPorts.add(port.duplicate(newId, port.id));
    });

    return ComponentData(
      id: newId,
      size: Size(size.width, size.height),
      portSize: portSize,
      portList: newPorts,
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

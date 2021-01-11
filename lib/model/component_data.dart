import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/component_options_data.dart';
import 'package:flutter_provider_canvas/model/custom_component_data.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';
import 'package:uuid/uuid.dart';

class ComponentData extends ChangeNotifier {
  String _id;
  Offset position;
  Size size;
  final Size minSize;
  final double portSize;

  final List<PortData> portList;
  HashMap<int, PortData> ports = HashMap<int, PortData>();

  final ComponentOptionsData optionsData;

  bool enableResize = false;

  final CustomComponentData customData;

  final String componentBodyName;

  String get id => _id;

  ComponentData({
    this.position = Offset.zero,
    this.size = const Size(80, 80),
    this.minSize = const Size(32, 32),
    this.portSize = 20,
    this.portList = const [],
    this.optionsData = const ComponentOptionsData(),
    this.customData = const EmptyCustomComponentData(),
    @required this.componentBodyName,
  })  : assert(minSize < size),
        assert(position != null),
        assert(size != null),
        assert(portSize != null),
        assert(portSize > 0),
        assert(portList != null),
        assert(optionsData != null),
        assert(customData != null),
        assert(componentBodyName != null) {
    _id = Uuid().v4();
    for (int i = 0; i < portList.length; i++) {
      portList[i].setComponentId(id);
      portList[i].setId(i);
      ports[i] = portList[i];
    }
  }

  componentNotifyListeners() {
    notifyListeners();
  }

  componentUpdateData() {
    print('component notify update');
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

  removeConnection(String connectionId) {
    ports.values.forEach((port) {
      port.removeConnection(connectionId);
    });
  }

  ComponentData duplicate([Offset offset = const Offset(0, 0)]) {
    final List<PortData> newPorts = [];

    ports.values.forEach((port) {
      newPorts.add(port.duplicate());
    });

    return ComponentData(
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

  @override
  String toString() {
    return ''' Component data ($id)
    position: $position
    ports: $ports''';
  }
}

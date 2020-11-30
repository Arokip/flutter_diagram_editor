import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/port_connection.dart';

import 'item_selected.dart';

class PortData with ItemSelected {
  final int id;
  final int componentId;
  final Color color;
  final Color borderColor;
  final Color highlightColor;
  final Color highLightBorderColor;
  final Alignment alignment;

  final String portType;

  final List<PortConnection> _connections = [];

  List<PortConnection> get connections => _connections;

  PortData({
    @required this.id,
    @required this.componentId,
    @required this.color,
    @required this.borderColor,
    this.highlightColor,
    this.highLightBorderColor,
    @required this.alignment,
    this.portType,
  });

  addConnection(PortConnection portConnection) {
    _connections.add(portConnection);
  }

  removeConnection(int connectionId) {
    _connections.removeWhere((element) => element.connectionId == connectionId);
  }

  PortData duplicate(int newComponentId) {
    return PortData(
      id: id,
      componentId: newComponentId,
      color: color,
      alignment: alignment,
      borderColor: borderColor,
      portType: portType,
    );
  }
}

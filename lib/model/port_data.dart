import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/port_connection.dart';

import 'item_selected.dart';

class PortData with ItemSelected {
  final int id;
  final int componentId;
  final Color color;
  final Color borderColor;
  final Alignment alignment;

  final String portType;

  final List<PortConnection> _connections = [];

  List<PortConnection> get connections => _connections;

  PortData({
    @required this.id,
    @required this.componentId,
    this.color = Colors.white,
    this.borderColor = Colors.black,
    this.alignment = Alignment.center,
    this.portType,
  }) : assert(alignment != null);

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

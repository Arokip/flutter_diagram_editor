import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_connection.dart';

class PortData {
  int _id;
  String _componentId;
  final Color color;
  final Color borderColor;
  final Alignment alignment;
  final String portType;

  final List<PortConnection> _connections = [];

  List<PortConnection> get connections => _connections;

  int get id => _id;

  String get componentId => _componentId;

  PortData({
    this.color = Colors.white,
    this.borderColor = Colors.black,
    this.alignment = Alignment.center,
    this.portType,
  }) : assert(alignment != null);

  setId(int id) {
    _id = id;
  }

  setComponentId(String id) {
    _componentId = id;
  }

  addConnection(PortConnection portConnection) {
    _connections.add(portConnection);
  }

  bool containsConnection(String connectionId) {
    bool result = false;
    _connections.forEach((connection) {
      if (connection.contains(connectionId)) {
        result = true;
        return;
      }
    });
    return result;
  }

  removeConnection(String connectionId) {
    _connections
        .removeWhere((connection) => connection.connectionId == connectionId);
  }

  PortData duplicate() {
    return PortData(
      color: color,
      alignment: alignment,
      borderColor: borderColor,
      portType: portType,
    );
  }

  @override
  String toString() {
    return 'Port data ($id): componentId($componentId)';
  }
}

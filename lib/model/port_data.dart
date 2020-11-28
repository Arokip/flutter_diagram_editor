import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/port_connection.dart';

import 'item_selected.dart';

class PortData with ItemSelected {
  final int id;
  final componentId;
  final Color color;
  final Color borderColor;
  final Color highlightColor;
  final Color highLightBorderColor;
  final Alignment alignment;

  // typ portu.. podle pravidel je pak možné je do sebe zapojovat...
  // nějak se vyhnout self connection
  // final int type;

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
    );
  }
}

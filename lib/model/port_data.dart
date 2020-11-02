import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/port_connection.dart';

import 'item_selected.dart';

class PortData with ItemSelected {
  final int id;
  final componentId;
  final Color color;
  final Color borderColor;
  final Alignment alignment;

  // typ portu.. podle pravidel je pak možné je do sebe zapojovat...
  // nějak se vyhnout self connection
  // final int type;

  // final List<int> linksIn = [];
  // final List<int> linksOut = [];

  // final List<PortConnectionOut> _connectionsOut = [];
  // final List<PortConnectionIn> _connectionsIn = [];
  //
  // List<PortConnectionOut> get connectionsOut => _connectionsOut;
  //
  // List<PortConnectionIn> get connectionsIn => _connectionsIn;

  final List<PortConnection> _connections = [];

  List<PortConnection> get connections => _connections;

  PortData({
    this.id,
    this.componentId,
    this.color,
    this.borderColor,
    this.alignment,
  });

  addConnection(PortConnection portConnection) {
    _connections.add(portConnection);
  }

  removeConnection(int connectionId) {
    _connections.removeWhere((element) => element.connectionId == connectionId);
  }
}

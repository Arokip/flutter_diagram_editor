import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/item_selected.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';

class ComponentData extends ChangeNotifier with ItemSelected {
  final int id;
  Offset position;
  final Color color;
  final Size size;
  final double portSize;

  final HashMap<int, PortData> ports;

  // final List<int> linksFrom = [];
  // final List<int> linksTo = [];

  ComponentData({
    this.id,
    this.position,
    this.color,
    this.size,
    this.portSize,
    this.ports,
  });

  updateComponentDataPosition(Offset position) {
    this.position += position;
    notifyListeners();
  }

  // addLinkFrom(int linkId) {
  //   linksFrom.add(linkId);
  // }
  //
  // addLinkTo(int linkId) {
  //   linksTo.add(linkId);
  // }

  addPort(PortData portData) {
    ports[portData.id] = portData;
  }

  // connectPort(int portId, PortConnectionOut connectionOut) {
  //   ports[portId].addConnection(
  //     connectionOut,
  //     PortConnectionIn(
  //       componentId: id,
  //       portId: portId,
  //     ),
  //   );
  // }

  getPortCenterPoint(int portId) {
    var componentCenter = Offset(size.width / 2, size.height / 2);
    var portCenter = Offset(portSize / 2, portSize / 2);
    var portPosition = Offset(
      componentCenter.dx * ports[portId].alignment.x,
      componentCenter.dy * ports[portId].alignment.y,
    );

    return position + componentCenter + portCenter + portPosition;
  }
}

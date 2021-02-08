import 'package:flutter/material.dart';

abstract class PortConnection {
  final String connectionId;
  final String componentId;
  final int portId;

  PortConnection({
    @required this.connectionId,
    @required this.componentId,
    @required this.portId,
  });

  bool contains(String id) {
    return id == connectionId;
  }
}

class PortConnectionOut extends PortConnection {
  PortConnectionOut({
    @required linkId,
    @required componentId,
    @required portId,
  }) : super(
          connectionId: linkId,
          componentId: componentId,
          portId: portId,
        );
}

class PortConnectionIn extends PortConnection {
  PortConnectionIn({
    @required linkId,
    @required componentId,
    @required portId,
  }) : super(
          connectionId: linkId,
          componentId: componentId,
          portId: portId,
        );
}

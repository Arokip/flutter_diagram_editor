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
}

class PortConnectionOut extends PortConnection {
  PortConnectionOut({
    linkId,
    componentId,
    portId,
  }) : super(
          connectionId: linkId,
          componentId: componentId,
          portId: portId,
        );
}

class PortConnectionIn extends PortConnection {
  PortConnectionIn({
    linkId,
    componentId,
    portId,
  }) : super(
          connectionId: linkId,
          componentId: componentId,
          portId: portId,
        );
}

abstract class PortConnection {
  final int connectionId;
  final int componentId;
  final int portId;

  PortConnection({
    this.connectionId,
    this.componentId,
    this.portId,
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

abstract class PortConnection {
  final int linkId;
  final int componentId;
  final int portId;

  PortConnection({
    this.linkId,
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
          linkId: linkId,
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
          linkId: linkId,
          componentId: componentId,
          portId: portId,
        );
}

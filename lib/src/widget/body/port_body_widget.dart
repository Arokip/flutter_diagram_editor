import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:flutter/material.dart';

class PortBodyWidget extends StatelessWidget {
  final ComponentData componentData;

  const PortBodyWidget({
    Key key,
    @required this.componentData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PortData portData = componentData.data;

    switch (portData.portState) {
      case PortState.hidden:
        return SizedBox.shrink();
        break;
      case PortState.shown:
        return Port(
          color: portData.color,
          borderColor: Colors.black,
        );
        break;
      case PortState.selected:
        return Port(
          color: portData.color,
          borderColor: Colors.cyan,
        );
        break;
      case PortState.highlighted:
        return Port(
          color: portData.color,
          borderColor: Colors.teal,
        );
        break;
    }
    return SizedBox.shrink();
  }
}

class Port extends StatelessWidget {
  final Color color;
  final Color borderColor;

  const Port({
    Key key,
    this.color = Colors.white,
    this.borderColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.color,
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.0,
          color: this.borderColor,
        ),
      ),
    );
  }
}

enum PortState { hidden, shown, selected, highlighted }

class PortData {
  Color color;
  PortState portState = PortState.shown;

  PortData({
    this.color,
  });

  PortData.copy(PortData portData)
      : this(
          color: portData.color,
        );

  setPortState(PortState portState) {
    this.portState = portState;
  }
}

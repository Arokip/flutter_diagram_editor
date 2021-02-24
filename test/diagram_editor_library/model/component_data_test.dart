import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Component data tests', () {
    test('Get port center', () {
      Offset position = Offset(50, 50);
      Size size = Size(80, 80);
      double portSize = 20;
      Alignment alignment = Alignment(0.5, -0.8);

      var componentData = ComponentData(
        componentBodyName: 'test_body',
        position: position,
        size: size,
        portSize: portSize,
        portList: [
          PortData(
            id: '0',
            alignment: alignment,
          )
        ],
      );
      var port = componentData.ports.values.single;
      var center = componentData.getPortCenterPoint(port.id);

      expect(
        center,
        Offset(
          position.dx +
              (size.width / 2) +
              (portSize / 2) +
              (alignment.x * (size.width / 2)),
          position.dy +
              (size.height / 2) +
              (portSize / 2) +
              (alignment.y * (size.height / 2)),
        ),
      );
    });
  });
}

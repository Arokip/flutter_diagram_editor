import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/custom_component_data.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';
import 'package:flutter_provider_canvas/user/component/component_common.dart';
import 'package:provider/provider.dart';

class ComponentBodyWidgetCrystal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);

    return CustomPaint(
      painter: CrystalPainter(
        color: Colors.deepPurple,
        borderColor: Colors.grey[100],
        borderWidth: 4.0,
      ),
      child: Center(
        child: Text(
          'body crystal',
          style: TextStyle(fontSize: 12 * canvasScale),
        ),
      ),
    );
  }
}

class MenuComponentBodyWidgetCrystal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CrystalPainter(
        color: Colors.deepPurple,
        borderColor: Colors.grey[100],
        borderWidth: 3.0,
      ),
      child: Center(
        child: Text(
          'body crystal',
          style: TextStyle(fontSize: 8),
        ),
      ),
    );
  }
}

class CrystalPainter extends CustomPainter {
  final Color color;
  final Color borderColor;
  final double borderWidth;

  CrystalPainter({
    this.color = Colors.grey,
    this.borderColor = Colors.black,
    this.borderWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.close();

    canvas.drawPath(path, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = borderColor
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MyCustomComponentData extends CustomComponentData {
  String someText;

  MyCustomComponentData({this.someText});
}

ComponentData generateComponentCrystal(CanvasModel model) {
  return ComponentData(
    size: Size(120, 80),
    portSize: 20,
    portList: [
      PortData(
        color: Colors.lightBlueAccent,
        borderColor: Colors.grey,
        alignment: Alignment(0, -1),
        portType: '1',
      ),
      PortData(
        color: Colors.lightBlueAccent,
        borderColor: Colors.grey,
        alignment: Alignment(1, 0),
        portType: '1',
      ),
      PortData(
        color: Colors.lightBlueAccent,
        borderColor: Colors.grey,
        alignment: Alignment(-1, 0),
        portType: '1',
      ),
      PortData(
        color: Colors.lightBlueAccent,
        borderColor: Colors.grey,
        alignment: Alignment(0, 1),
        portType: '1',
      ),
    ],
    optionsData: ComponentCommon.optionsData(model),
    customData: MyCustomComponentData(
      someText: 'oval',
    ),
    componentBodyName: 'body crystal',
  );
}

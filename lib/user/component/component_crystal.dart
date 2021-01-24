import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/model/canvas_model.dart';
import 'package:flutter_diagram_editor/model/component_data.dart';
import 'package:flutter_diagram_editor/model/port_data.dart';
import 'package:flutter_diagram_editor/user/component/component_common.dart';
import 'package:provider/provider.dart';

class ComponentBodyWidgetCrystal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);

    var componentData = Provider.of<ComponentData>(context);

    var customData = componentData.customData as MyCustomComponentData;

    return GestureDetector(
      onLongPress: () {
        print('long press');
        showEditComponent(context, componentData);
      },
      child: CustomPaint(
        painter: CrystalPainter(
          color: Colors.deepPurple,
          borderColor: Colors.grey[100],
          borderWidth: 4.0 * canvasScale,
        ),
        child: Center(
          child: Text(
            customData.firstText,
            style: TextStyle(fontSize: 12 * canvasScale),
          ),
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

ComponentData generateComponentCrystal(CanvasModel model) {
  return ComponentData(
    size: Size(100, 120),
    portSize: 20,
    portList: [
      PortData(
        color: Colors.lightBlueAccent,
        borderColor: Colors.grey,
        alignment: Alignment(0, -1),
        portType: ComponentCommon.randomPortType(),
      ),
      PortData(
        color: Colors.lightBlueAccent,
        borderColor: Colors.grey,
        alignment: Alignment(1, 0),
        portType: ComponentCommon.randomPortType(),
      ),
      PortData(
        color: Colors.lightBlueAccent,
        borderColor: Colors.grey,
        alignment: Alignment(-1, 0),
        portType: ComponentCommon.randomPortType(),
      ),
      PortData(
        color: Colors.lightBlueAccent,
        borderColor: Colors.grey,
        alignment: Alignment(0, 1),
        portType: ComponentCommon.randomPortType(),
      ),
    ],
    topOptions: ComponentCommon.topOptions,
    bottomOptions: ComponentCommon.bottomOptions,
    customData: MyCustomComponentData(
      firstText: 'crystal',
      secondText: 'first',
      count: 0,
    ),
    // customData: ExampleCustomComponentData(
    //   exampleString: 'ex string',
    //   exampleList: [2, 4],
    // ),
    componentBodyName: 'body crystal',
  );
}

void showEditComponent(BuildContext context, ComponentData componentData) {
  MyCustomComponentData customData = componentData.customData;

  final firstTextController =
      TextEditingController(text: customData.firstText ?? 'fail null');
  final secondTextController =
      TextEditingController(text: customData.secondText ?? 'fail null');

  showDialog(
    barrierDismissible: false,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          children: [
            SizedBox(width: 600),
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
            Container(
              color: Colors.purple,
              child: Text('whatever'),
            ),
            TextField(
              controller: firstTextController,
              maxLines: 1,
              decoration: InputDecoration(
                // hintText: 'Find Group',
                labelText: 'Title',
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 13),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: secondTextController,
              textInputAction: TextInputAction.newline,
              maxLines: null,
              decoration: InputDecoration(
                // hintText: 'Find Group',
                labelText: 'Description',
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 13),
              ),
            ),
          ],
        ),
        scrollable: true,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('DISCARD'),
          ),
          FlatButton(
            onPressed: () {
              customData.firstText = firstTextController.text;
              customData.secondText = secondTextController.text;
              componentData.componentUpdateData();
              Navigator.of(context).pop();
            },
            child: Text('SAVE'),
          )
        ],
      );
    },
  );
}

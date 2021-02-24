import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor/component/component_common.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/component_data.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';
import 'package:provider/provider.dart';

class ComponentBodyWidgetComplex extends StatelessWidget {
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow[200],
          borderRadius: BorderRadius.circular(20 * canvasScale),
          border: Border.all(
            width: 0.5 * canvasScale,
            color: Colors.grey,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 8 * canvasScale),
            Center(
              child: Text(
                customData.firstText,
                style: TextStyle(fontSize: 32 * canvasScale),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1 * canvasScale,
              height: 8 * canvasScale,
              indent: 24 * canvasScale,
              endIndent: 24 * canvasScale,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.emoji_emotions,
                    color: Colors.grey, size: 64 * canvasScale),
                Icon(Icons.gesture,
                    color: Colors.amber, size: 64 * canvasScale),
                SizedBox(width: 8 * canvasScale),
                Text(
                  customData.secondText,
                  style: TextStyle(fontSize: 16 * canvasScale),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(height: 16 * canvasScale),
            Text(
              'This is a bit more complex component... try to scroll the rainbow below.',
              style: TextStyle(fontSize: 11 * canvasScale),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(24 * canvasScale),
                child: SizedBox(
                  height: 80 * canvasScale,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      RainbowItem(w: 80 * canvasScale, c: Colors.red),
                      RainbowItem(w: 80 * canvasScale, c: Colors.orange),
                      RainbowItem(w: 80 * canvasScale, c: Colors.amber),
                      RainbowItem(w: 80 * canvasScale, c: Colors.yellow),
                      RainbowItem(w: 80 * canvasScale, c: Colors.lime),
                      RainbowItem(w: 80 * canvasScale, c: Colors.green),
                      RainbowItem(w: 80 * canvasScale, c: Colors.cyan),
                      RainbowItem(w: 80 * canvasScale, c: Colors.blue),
                      RainbowItem(w: 80 * canvasScale, c: Colors.indigo),
                      RainbowItem(w: 80 * canvasScale, c: Colors.purple),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RainbowItem extends StatelessWidget {
  final c;
  final w;

  const RainbowItem({Key key, this.c, this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '${c.toString()}',
      child: GestureDetector(
        child: Container(width: w, color: c),
      ),
    );
  }
}

class MenuComponentBodyWidgetComplex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.5,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          'Complex',
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

ComponentData generateComponentComplex(CanvasModel model) {
  return ComponentData(
    size: Size(400, 300),
    portSize: 32,
    portList: [
      PortData(
        color: Colors.white,
        borderColor: Colors.grey,
        alignment: Alignment(0, -1),
        portType: '0',
      ),
      PortData(
        color: Colors.white,
        borderColor: Colors.grey,
        alignment: Alignment(1, 0),
        portType: '2',
      ),
      PortData(
        color: Colors.white,
        borderColor: Colors.grey,
        alignment: Alignment(-1, 0),
        portType: '1',
      ),
      PortData(
        color: Colors.white,
        borderColor: Colors.grey,
        alignment: Alignment(0, 1),
        portType: '0',
      ),
    ],
    optionSize: 80,
    topOptions: [],
    bottomOptions: [
      'delete',
      'duplicate',
      'remove connections',
    ],
    customData: MyCustomComponentData(
      firstText: 'COMPLEX',
      secondText: 'some text for complexity\nlong press to change it',
      count: 0,
    ),
    componentBodyName: 'body complex',
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

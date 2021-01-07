import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/component_options_data.dart';
import 'package:flutter_provider_canvas/model/custom_component_data.dart';
import 'package:provider/provider.dart';

import 'component_common.dart';

class ComponentBodyWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);

    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        border: Border.all(
          width: 1.0 * canvasScale,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.style,
          color: Colors.black,
          size: 40 * canvasScale,
        ),
      ),
    );
  }
}

class MenuComponentBodyWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.style,
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }
}

ComponentData generateComponent2(CanvasModel model, BuildContext context) {
  return ComponentData(
    size: Size(120, 80),
    portSize: 20,
    portList: [],
    optionsData: ComponentOptionsData(
      optionSize: 64,
      optionsTop: [
        ComponentOptionData(
          color: Colors.lime,
          icon: Icons.open_in_browser,
          tooltip: "open",
          onOptionTap: (cid) {
            showEditComponent(context, model.getComponentData(cid));
          },
        ),
      ],
      optionsBottom: [
        ComponentOptionData(
          color: Colors.red,
          icon: Icons.delete_forever,
          tooltip: "Delete",
          onOptionTap: (cid) {
            model.removeComponentFromList(cid);
            print('remove component: $cid');
          },
        ),
        ComponentOptionData(
          color: Colors.yellow,
          icon: Icons.copy,
          tooltip: "Duplicate",
          onOptionTap: (cid) {
            model.duplicateComponentBelow(cid, Offset(0, 24));
            print('duplicate component: $cid');
          },
        ),
      ],
    ),
    customData: MyCustomComponentData(
      firstText: 'first',
      secondText: 'second',
      count: 10,
    ),
    componentBodyName: 'body2',
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

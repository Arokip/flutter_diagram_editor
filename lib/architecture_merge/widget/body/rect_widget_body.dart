import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/component_data.dart';
import 'package:provider/provider.dart';

class RectWidgetBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final componentData = Provider.of<ComponentData>(context);
    final RectCustomData myCustomData = componentData.customData;

    return Container(
      decoration: BoxDecoration(
        color: myCustomData.color,
        border: Border.all(
          width: 2.0,
          color: componentData.isHighlightVisible ? Colors.pink : Colors.grey,
        ),
      ),
      child: Column(
        children: [
          Text(
            'COMP + ${myCustomData.text}',
            style: TextStyle(fontSize: 12),
          ),
          ElevatedButton(
            onPressed: () => print('butt'),
            onLongPress: () => print('BUTT'),
            child: Text('butt'),
          ),
        ],
      ),
    );
  }
}

class RectCustomData {
  Color color;
  String text;

  RectCustomData({
    this.color,
    this.text,
  });
}

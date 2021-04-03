import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:flutter/material.dart';

class RectWidgetBody extends StatelessWidget {
  final ComponentData componentData;

  const RectWidgetBody({
    Key key,
    @required this.componentData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RectCustomData myCustomData = componentData.data;

    return Container(
      decoration: BoxDecoration(
        color: myCustomData.color,
        border: Border.all(
          width: 2.0,
          color: myCustomData.isHighlightVisible ? Colors.pink : Colors.black,
        ),
      ),
      child: Column(
        children: [
          Text(
            'COMP + ${myCustomData.isHighlightVisible}',
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
  bool isHighlightVisible = false;

  RectCustomData({
    this.color,
    this.text,
  });

  RectCustomData.copy(RectCustomData customData)
      : this(
          color: customData.color,
          text: customData.text,
        );

  switchHighlight() {
    isHighlightVisible = !isHighlightVisible;
  }

  showHighlight() {
    isHighlightVisible = true;
  }

  hideHighlight() {
    isHighlightVisible = false;
  }
}

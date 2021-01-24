import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/graphml/graphml_serializer.dart';
import 'package:flutter_diagram_editor/model/canvas_model.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class SaveAsGraphmlButton extends StatelessWidget {
  final double size;
  final Color color;
  final Color iconColor;

  const SaveAsGraphmlButton({
    Key key,
    this.size = 48,
    this.color = const Color(0x44000000),
    this.iconColor = Colors.white,
  })  : assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CanvasModel>(
      builder: (_, canvasModel, __) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            color: iconColor,
            onPressed: () async {
              print('save web');
              String fileString = GraphmlSerializer.buildDiagramXml(canvasModel)
                  .toXmlString(pretty: true);
              var bytes = utf8.encode(fileString);
              final content = base64.encode(bytes);
              html.AnchorElement(
                  href:
                      'data:application/octet-stream;charset=utf-16le;base64,$content')
                ..setAttribute('download', 'diagram_${Uuid().v4()}.graphml')
                ..click();
            },
            tooltip: 'Save as GraphML',
            icon: const Icon(Icons.save),
          ),
        );
      },
    );
  }
}

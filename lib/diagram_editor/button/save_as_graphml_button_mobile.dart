import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor/graphml/graphml_serializer.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:path_provider/path_provider.dart';
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
              print('save not web');
              String dir = (await getExternalStorageDirectory()).path;
              String filePath = '$dir/diagram_${Uuid().v4()}.graphml';

              String xmlString = GraphmlSerializer.buildDiagramXml(canvasModel)
                  .toXmlString(pretty: true);
              await File(filePath).writeAsString(xmlString);
            },
            tooltip: 'Save as GraphML',
            icon: const Icon(Icons.save),
          ),
        );
      },
    );
  }
}

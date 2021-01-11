import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/graphml_serializer.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:provider/provider.dart';

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
            onPressed: () {
              log('${GraphmlSerializer.buildDiagramXml(canvasModel).toXmlString(pretty: true)}');
            },
            tooltip: 'Save as GraphML',
            icon: const Icon(Icons.save),
          ),
        );
      },
    );
  }
}

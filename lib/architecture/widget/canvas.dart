import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default_canvas_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default_component_policy.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_context.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/component_data.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/link_data.dart';
import 'package:flutter_diagram_editor/architecture/widget/component.dart';
import 'package:flutter_diagram_editor/architecture/widget/link.dart';
import 'package:provider/provider.dart';

class DiagramEditorCanvas extends StatelessWidget {
  final CanvasContext canvasContext;
  final double width;
  final double height;
  final Color color;

  final DefaultComponentPolicy componentPolicy;
  final DefaultCanvasPolicy canvasPolicy;

  const DiagramEditorCanvas({
    Key key,
    @required this.canvasContext,
    this.width,
    this.height,
    this.color,
    this.componentPolicy,
    this.canvasPolicy,
  }) : super(key: key);

  List<Widget> showComponents(CanvasModel canvasModel) {
    return canvasModel.components.values.map((ComponentData componentData) {
      return ChangeNotifierProvider<ComponentData>.value(
        value: componentData,
        child: Component(
          componentPolicy: this.componentPolicy,
        ),
      );
    }).toList();
  }

  List<Widget> showLinks(CanvasModel canvasModel) {
    return canvasModel.links.values.map((LinkData linkData) {
      return ChangeNotifierProvider<LinkData>.value(
        value: linkData,
        child: Link(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    print('CANVAS build');
    var canvasModel = Provider.of<CanvasModel>(context);

    return GestureDetector(
      child: Container(
        color: color,
        width: width,
        height: height,
        child: Stack(
          children: [
            ...showComponents(canvasModel),
            ...showLinks(canvasModel),
          ],
        ),
      ),
      onTap: () {
        print('canvas tap');
        canvasPolicy.onTap();
      },
      onTapDown: (details) {
        canvasPolicy.onTapDown(details);
      },
      onPanUpdate: (details) {
        canvasPolicy.onPanUpdate(details);
      },
    );
  }
}

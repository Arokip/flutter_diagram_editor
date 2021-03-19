import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default/default_policy_set.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/diagram_editor_context.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/component_data.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/model/link_data.dart';
import 'package:flutter_diagram_editor/architecture/widget/component.dart';
import 'package:flutter_diagram_editor/architecture/widget/link.dart';
import 'package:provider/provider.dart';

class DiagramEditorCanvas extends StatelessWidget {
  final DefaultPolicySet policy;
  final double width;
  final double height;
  final Color color;

  const DiagramEditorCanvas({
    Key key,
    @required this.policy,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  List<Widget> showComponents(CanvasModel canvasModel) {
    return canvasModel.components.values.map((ComponentData componentData) {
      return ChangeNotifierProvider<ComponentData>.value(
        value: componentData,
        child: Component(
          policy: policy,
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
        policy.onCanvasTap();
      },
      onTapDown: (details) {
        policy.onCanvasTapDown(details);
      },
      onPanUpdate: (details) {
        policy.onCanvasPanUpdate(details);
      },
    );
  }
}

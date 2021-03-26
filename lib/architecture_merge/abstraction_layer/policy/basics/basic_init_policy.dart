import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_init_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/widget/body/rect_widget_body.dart';

mixin BasicInitPolicy implements DefaultInitPolicy {
  initializeDiagram() {
    print('init diagram');

    canvasWriter.widgetsDefinition.addComponentBody('rect', RectWidgetBody());
  }
}

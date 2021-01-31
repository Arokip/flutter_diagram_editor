import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/custom_component_data.dart';

typedef CustomComponentData FromJsonFunction(Map<String, dynamic> json);

class ComponentBody {
  final Widget menuComponentBody;
  final Widget componentBody;

  final FromJsonFunction fromJsonCustomData;

  ComponentBody({
    @required this.menuComponentBody,
    @required this.componentBody,
    @required this.fromJsonCustomData,
  })  : assert(menuComponentBody != null),
        assert(componentBody != null),
        assert(fromJsonCustomData != null);
}

import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/basic/basic_canvas_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/basic/basic_component_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/basic/basic_init_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/basic/basic_link_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default/default_policy_set.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/policy_set.dart';

class BasicPolicySet extends DefaultPolicySet
    with
        BasicCanvasPolicy,
        BasicComponentPolicy,
        BasicLinkPolicy,
        BasicInitPolicy {}

import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/basics/basic_canvas_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/basics/basic_component_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/basics/basic_init_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/basics/basic_link_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/defaults/default_policy_set.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/policy_set.dart';

class BasicPolicySet extends DefaultPolicySet
    with
        BasicCanvasPolicy,
        BasicComponentPolicy,
        BasicLinkPolicy,
        BasicInitPolicy {}

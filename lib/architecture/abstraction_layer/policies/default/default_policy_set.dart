import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default/default_canvas_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default/default_component_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default/default_init_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default/default_link_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/policy_set.dart';

class DefaultPolicySet extends PolicySet
    with
        DefaultCanvasPolicy,
        DefaultComponentPolicy,
        DefaultLinkPolicy,
        DefaultInitPolicy {}

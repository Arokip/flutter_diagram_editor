import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_canvas_stack_widgets_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_canvas_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_component_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_init_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_link_joints_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_link_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/policy_set.dart';

class DefaultPolicySet extends PolicySet
    with
        DefaultCanvasPolicy,
        DefaultComponentPolicy,
        DefaultLinkPolicy,
        DefaultLinkJointPolicy,
        DefaultInitPolicy,
        DefaultCanvasStackWidgetsPolicy {}

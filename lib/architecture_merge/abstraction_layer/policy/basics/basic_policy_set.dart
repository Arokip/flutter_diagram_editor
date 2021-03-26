import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/basics/basic_canvas_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/basics/basic_canvas_stack_widgets_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/basics/basic_component_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/basics/basic_custom_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/basics/basic_init_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/basics/basic_link_joint_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/basics/basic_link_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/canvas_control_policy.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_policy_set.dart';

class BasicPolicySet extends DefaultPolicySet
    with
        BasicCanvasPolicy,
        BasicComponentPolicy,
        BasicLinkPolicy,
        BasicLinkJointPolicy,
        BasicInitPolicy,
        CustomStatePolicy,
        CustomBehaviourPolicy,
        BasicCanvasStackWidgetsPolicy,
        CanvasControlPolicy {}

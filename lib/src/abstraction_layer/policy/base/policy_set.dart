import 'package:diagram_editor/src/abstraction_layer/policy/base/canvas_policy.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base/canvas_widgets_policy.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base/component_design_policy.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base/component_policy.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base/init_policy.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base/link_attachment_policy.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base/link_joints_policy.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base/link_policy.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';

class PolicySet extends BasePolicySet
    with
        InitPolicy,
        CanvasPolicy,
        ComponentPolicy,
        ComponentDesignPolicy,
        LinkPolicy,
        LinkJointPolicy,
        LinkAttachmentPolicy,
        CanvasWidgetsPolicy {}

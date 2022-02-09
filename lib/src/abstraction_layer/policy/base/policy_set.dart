import 'package:diagram_editor/diagram_editor.dart';
import 'package:diagram_editor/src/abstraction_layer/policy/base_policy_set.dart';

/// Fundamental policy set. Your policy set should extend [PolicySet].
class PolicySet extends BasePolicySet
    with
        InitPolicy,
        CanvasPolicy,
        ComponentPolicy,
        ComponentDesignPolicy,
        LinkPolicy,
        LinkJointPolicy,
        LinkAttachmentPolicy,
        LinkWidgetsPolicy,
        CanvasWidgetsPolicy,
        ComponentWidgetsPolicy {}

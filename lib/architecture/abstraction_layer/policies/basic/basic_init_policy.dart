import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default/default_init_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/policy_set.dart';

mixin BasicInitPolicy implements DefaultInitPolicy {
  initState() {
    print('init policy');
  }
}

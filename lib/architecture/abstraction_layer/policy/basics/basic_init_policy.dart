import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/defaults/default_init_policy.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policy/policy_set.dart';

mixin BasicInitPolicy implements DefaultInitPolicy {
  initState() {
    print('init policy');
  }
}

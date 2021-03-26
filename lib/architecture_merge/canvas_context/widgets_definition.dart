import 'dart:collection';

import 'package:flutter/material.dart';

class WidgetsDefinition with ChangeNotifier {
  HashMap<String, Widget> _componentBodies = HashMap();

  addComponentBody(String bodyName, Widget body) {
    _componentBodies[bodyName] = body;
  }

  Widget getComponentBody(String bodyName) {
    return _componentBodies[bodyName];
  }
}

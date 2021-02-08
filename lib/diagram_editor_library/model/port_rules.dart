import 'dart:collection';

import 'package:flutter_diagram_editor/diagram_editor_library/model/port_data.dart';

class PortRules {
  HashMap<String, List<String>> _rules = HashMap<String, List<String>>();
  HashMap<String, int> _maxConnectionCount = HashMap<String, int>();

  bool canConnectSameComponent = false;

  get rules => _rules;

  get maxConnectionCount => _maxConnectionCount;

  addRule(String outPort, String inPort) {
    if (_rules[outPort] == null) {
      _rules[outPort] = [inPort];
    } else {
      _rules[outPort].add(inPort);
    }
  }

  addRules(String outPort, List<String> inPorts) {
    if (_rules[outPort] == null) {
      _rules[outPort] = inPorts;
    } else {
      _rules[outPort].addAll(inPorts);
    }
  }

  setMaxConnectionCount(String portType, int count) {
    _maxConnectionCount[portType] = count;
  }

  int getMaxConnectionCount(String portType) {
    return _maxConnectionCount[portType];
  }

  bool portTypesAllowToConnect(String outPort, String inPort) {
    if (_rules[outPort] == null) {
      return false;
    }
    return _rules[outPort].contains(inPort);
  }

  bool canConnectTwoPorts(PortData firstPort, PortData secondPort) {
    if (!this
        .portTypesAllowToConnect(firstPort.portType, secondPort.portType)) {
      return false;
    }
    if (arePortsConnected(firstPort, secondPort)) {
      return false;
    }
    if (!hasLessThanMaxConnections(firstPort) ||
        !hasLessThanMaxConnections(secondPort)) {
      return false;
    }
    if (!canConnectIfSameComponent(firstPort, secondPort)) {
      return false;
    }

    return true;
  }

  bool arePortsConnected(PortData firstPort, PortData secondPort) {
    int index = firstPort.connections.indexWhere((connection) =>
        connection.componentId == secondPort.componentId &&
        connection.portId == secondPort.id);
    return index >= 0;
  }

  bool hasLessThanMaxConnections(PortData port) {
    int max = this.getMaxConnectionCount(port.portType);
    if (max == null) {
      return true;
    } else {
      return port.connections.length < max;
    }
  }

  bool canConnectIfSameComponent(PortData firstPort, PortData secondPort) {
    if (canConnectSameComponent) {
      return true;
    } else {
      if (firstPort.componentId != secondPort.componentId) {
        return true;
      } else {
        return false;
      }
    }
  }
}

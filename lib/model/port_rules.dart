import 'dart:collection';

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

  bool canConnect(String outPort, String inPort) {
    if (_rules[outPort] == null) {
      return false;
    }
    return _rules[outPort].contains(inPort);
  }
}

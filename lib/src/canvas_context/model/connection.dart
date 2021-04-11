import 'package:flutter/material.dart';

abstract class Connection {
  final String connectionId;
  final String otherComponentId;

  Connection({
    @required this.connectionId,
    @required this.otherComponentId,
  });

  bool contains(String id) {
    return id == connectionId;
  }
}

class ConnectionOut extends Connection {
  ConnectionOut({
    @required connectionId,
    @required otherComponentId,
  }) : super(
          connectionId: connectionId,
          otherComponentId: otherComponentId,
        );
}

class ConnectionIn extends Connection {
  ConnectionIn({
    @required connectionId,
    @required otherComponentId,
  }) : super(
          connectionId: connectionId,
          otherComponentId: otherComponentId,
        );
}

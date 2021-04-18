import 'package:flutter/material.dart';

abstract class Connection {
  /// Id of this connection. It corresponds to link id.
  final String connectionId;

  /// Id of a component to which is the component connected.
  final String otherComponentId;

  Connection({
    @required this.connectionId,
    @required this.otherComponentId,
  });

  bool contains(String id) {
    return id == connectionId;
  }
}

/// Connection type that is saved to source component [connection].
class ConnectionOut extends Connection {
  ConnectionOut({
    @required connectionId,
    @required otherComponentId,
  }) : super(
          connectionId: connectionId,
          otherComponentId: otherComponentId,
        );
}

/// Connection type that is saved to target component [connection].
class ConnectionIn extends Connection {
  ConnectionIn({
    @required connectionId,
    @required otherComponentId,
  }) : super(
          connectionId: connectionId,
          otherComponentId: otherComponentId,
        );
}

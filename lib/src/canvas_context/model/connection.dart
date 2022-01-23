abstract class Connection {
  /// Id of this connection. It corresponds to link id.
  final String connectionId;

  /// Id of a component to which is the component connected.
  final String otherComponentId;

  /// Abstract class that represents connection of a component.
  Connection({
    required this.connectionId,
    required this.otherComponentId,
  });

  bool contains(String id) {
    return id == connectionId;
  }

  factory Connection.fromJson(Map<String, dynamic> json) => (json['type'] == 0)
      ? ConnectionOut(
          connectionId: json['connection_id'],
          otherComponentId: json['other_component_id'],
        )
      : ConnectionIn(
          connectionId: json['connection_id'],
          otherComponentId: json['other_component_id'],
        );

  Map<String, dynamic> toJson() => (this is ConnectionOut)
      ? {
          'type': 0,
          'connection_id': connectionId,
          'other_component_id': otherComponentId,
        }
      : {
          'type': 1,
          'connection_id': connectionId,
          'other_component_id': otherComponentId,
        };
}

class ConnectionOut extends Connection {
  /// Connection type that is saved to source component [connection].
  ConnectionOut({
    required connectionId,
    required otherComponentId,
  }) : super(
          connectionId: connectionId,
          otherComponentId: otherComponentId,
        );
}

class ConnectionIn extends Connection {
  /// Connection type that is saved to target component [connection].
  ConnectionIn({
    required connectionId,
    required otherComponentId,
  }) : super(
          connectionId: connectionId,
          otherComponentId: otherComponentId,
        );
}

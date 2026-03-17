/// Represents a connection between a component and a link.
sealed class Connection {
  const Connection({
    required this.linkId,
    required this.otherComponentId,
  });

  /// Deserializes a [Connection] from JSON.
  factory Connection.fromJson(Map<String, dynamic> json) {
    return switch (json['direction'] as String) {
      'out' => OutgoingConnection(
          linkId: json['link_id'] as String,
          otherComponentId: json['other_component_id'] as String,
        ),
      'in' => IncomingConnection(
          linkId: json['link_id'] as String,
          otherComponentId: json['other_component_id'] as String,
        ),
      _ => throw ArgumentError(
          'Unknown connection direction: '
          '${json['direction']}',
        ),
    };
  }

  /// The id of the link.
  final String linkId;

  /// The id of the other component in this connection.
  final String otherComponentId;

  /// Whether this connection refers to the given [id] (link id).
  bool contains(String id) => id == linkId;

  /// Serializes this connection to JSON.
  Map<String, dynamic> toJson() => {
        'direction': switch (this) {
          OutgoingConnection() => 'out',
          IncomingConnection() => 'in',
        },
        'link_id': linkId,
        'other_component_id': otherComponentId,
      };
}

/// A connection from this component to another (outgoing link).
final class OutgoingConnection extends Connection {
  const OutgoingConnection({
    required super.linkId,
    required super.otherComponentId,
  });
}

/// A connection from another component to this one (incoming link).
final class IncomingConnection extends Connection {
  const IncomingConnection({
    required super.linkId,
    required super.otherComponentId,
  });
}

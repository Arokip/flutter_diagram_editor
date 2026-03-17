import 'package:diagram_editor/src/model/connection.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// Data for a single component (node) on the diagram canvas.
///
/// The type parameter [C] is the type of custom data attached to this
/// component. Use `void` if no custom data is needed.
class ComponentData<C> with ChangeNotifier {
  /// Creates a new [ComponentData].
  ComponentData({
    String? id,
    this.position = Offset.zero,
    this.size = const Size(80, 80),
    this.minSize = const Size(4, 4),
    this.type,
    this.data,
  })  : assert(
          minSize <= size,
          'minSize must not exceed size',
        ),
        id = id ?? const Uuid().v4();

  /// Deserializes a [ComponentData] from JSON.
  ///
  /// If [decodeData] is provided, it will be used to decode the
  /// `dynamic_data` field into a typed [C] value.
  ComponentData.fromJson(
    Map<String, dynamic> json, {
    C Function(Map<String, dynamic> json)? decodeData,
  })  : id = json['id'] as String,
        position = Offset(
          ((json['position'] as List)[0] as num).toDouble(),
          ((json['position'] as List)[1] as num).toDouble(),
        ),
        size = Size(
          ((json['size'] as List)[0] as num).toDouble(),
          ((json['size'] as List)[1] as num).toDouble(),
        ),
        minSize = Size(
          ((json['min_size'] as List)[0] as num).toDouble(),
          ((json['min_size'] as List)[1] as num).toDouble(),
        ),
        type = json['type'] as String?,
        zOrder = json['z_order'] as int,
        parentId = json['parent_id'] as String?,
        data = json['dynamic_data'] != null && decodeData != null
            ? decodeData(
                json['dynamic_data'] as Map<String, dynamic>,
              )
            : null {
    childrenIds.addAll(
      (json['children_ids'] as List).cast<String>(),
    );
    connections.addAll(
      (json['connections'] as List).map(
        (connectionJson) => Connection.fromJson(
          connectionJson as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Unique id of this component.
  final String id;

  /// Position on the canvas.
  Offset position;

  /// Size of the component.
  Size size;

  /// Minimal size of a component.
  ///
  /// When [resizeDelta] is called the size will not go under this value.
  final Size minSize;

  /// Component type to distinguish components.
  ///
  /// You can use it to distinguish what [data] type this component has.
  final String? type;

  /// Determines the visual stacking order. Higher value means on top.
  int zOrder = 0;

  /// Assigned parent to this component for hierarchical layouts.
  ///
  /// Functions such as `moveComponentWithChildren` work with this property.
  String? parentId;

  /// List of child component ids for hierarchical layouts.
  final List<String> childrenIds = [];

  /// Defines which links are connected to this component.
  final List<Connection> connections = [];

  /// Type-safe custom data for this component.
  final C? data;

  /// Notifies listeners that this component has changed.
  ///
  /// Called automatically by mutation methods like [move] or [setSize].
  void updateComponent() {
    notifyListeners();
  }

  /// Translates the component by [offset].
  void move(Offset offset) {
    position += offset;
    notifyListeners();
  }

  /// Sets the absolute [position] of the component.
  void setPosition(Offset position) {
    this.position = position;
    notifyListeners();
  }

  /// Adds a [connection] to this component.
  void addConnection(Connection connection) {
    connections.add(connection);
  }

  /// Removes the connection with the given [linkId].
  void removeConnection(String linkId) {
    connections.removeWhere((conn) => conn.linkId == linkId);
  }

  /// Changes the component's size by [deltaSize].
  ///
  /// The resulting size will not be smaller than [minSize].
  void resizeDelta(Offset deltaSize) {
    var tempSize = size + deltaSize;
    if (tempSize.width < minSize.width) {
      tempSize = Size(minSize.width, tempSize.height);
    }
    if (tempSize.height < minSize.height) {
      tempSize = Size(tempSize.width, minSize.height);
    }
    size = tempSize;
    notifyListeners();
  }

  /// Sets the component's size to [size].
  void setSize(Size size) {
    this.size = size;
    notifyListeners();
  }

  /// Returns the offset position on this component from [alignment].
  ///
  /// [Alignment.topLeft] returns [Offset.zero].
  /// [Alignment.center] returns the center coordinates.
  /// [Alignment.bottomRight] returns offset equal to the component's size.
  Offset getPointOnComponent(Alignment alignment) {
    return Offset(
      size.width * ((alignment.x + 1) / 2),
      size.height * ((alignment.y + 1) / 2),
    );
  }

  /// Sets the component's parent id.
  // ignore: use_setters_to_change_properties
  void setParent(String parentId) {
    this.parentId = parentId;
  }

  /// Removes the parent id from this component.
  void removeParent() {
    parentId = null;
  }

  /// Adds a child component id.
  void addChild(String childId) {
    childrenIds.add(childId);
  }

  /// Removes a child component id.
  void removeChild(String childId) {
    childrenIds.remove(childId);
  }

  @override
  String toString() => 'ComponentData($id), position: $position';

  /// Serializes this component to JSON.
  ///
  /// If [encodeData] is provided, it will be used to serialize the [data]
  /// field. Otherwise, the `dynamic_data` key will be `null`.
  Map<String, dynamic> toJson({
    Map<String, dynamic> Function(C value)? encodeData,
  }) =>
      {
        'id': id,
        'position': [position.dx, position.dy],
        'size': [size.width, size.height],
        'min_size': [minSize.width, minSize.height],
        'type': type,
        'z_order': zOrder,
        'parent_id': parentId,
        'children_ids': childrenIds,
        'connections': connections.map((c) => c.toJson()).toList(),
        'dynamic_data':
            data != null && encodeData != null ? encodeData(data as C) : null,
      };
}

import 'package:diagram_editor/src/canvas_context/model/connection.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ComponentData with ChangeNotifier {
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
  /// You can use it for example to distinguish what [data] type this component has.
  final String? type;

  /// This value determines if this component will be above or under other components.
  /// Higher value means on the top.
  int zOrder = 0;

  /// Assigned parent to this component.
  ///
  /// Use for hierarchical components.
  /// Functions such as [moveComponentWithChildren] work with this property.
  String? parentId;

  /// List of children of this component.
  ///
  /// Use for hierarchical components.
  /// Functions such as [moveComponentWithChildren] work with this property.
  final List<String> childrenIds = [];

  /// Defines to which components is this components connected and what is the [connectionId].
  ///
  /// The connection can be [ConnectionOut] for link going from this component
  /// or [ConnectionIn] for link going from another to this component.
  final List<Connection> connections = [];

  /// Dynamic data for you to define your own data for this component.
  final dynamic data;

  /// Represents data of a component in the model.
  ComponentData({
    String? id,
    this.position = Offset.zero,
    this.size = const Size(80, 80),
    this.minSize = const Size(4, 4),
    this.type,
    this.data,
  })  : assert(minSize <= size),
        this.id = id ?? Uuid().v4();

  /// Updates this component on the canvas.
  ///
  /// Use this function if you somehow changed the component data and you want to propagate the change to canvas.
  /// Usually this is already called in most functions such as [move] or [setSize] so it's not necessary to call it again.
  ///
  /// It calls [notifyListeners] function of [ChangeNotifier].
  updateComponent() {
    notifyListeners();
  }

  /// Translates the component by [offset] value.
  move(Offset offset) {
    this.position += offset;
    notifyListeners();
  }

  /// Sets the position of the component to [position] value.
  setPosition(Offset position) {
    this.position = position;
    notifyListeners();
  }

  /// Adds new connection to this component.
  ///
  /// Do not use it if you are not sure what you do. This is called in [connectTwoComponents] function.
  addConnection(Connection connection) {
    connections.add(connection);
  }

  /// Removes existing connection.
  ///
  /// Do not use it if you are not sure what you do. This is called eg. in [removeLink] function.
  removeConnection(String connectionId) {
    connections.removeWhere((conn) => conn.connectionId == connectionId);
  }

  /// Changes the component's size by [deltaSize].
  ///
  /// You cannot change its size to smaller than [minSize] defined on the component.
  resizeDelta(Offset deltaSize) {
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

  /// Sets the component's to [size].
  setSize(Size size) {
    this.size = size;
    notifyListeners();
  }

  /// Returns Offset position on this component from [alignment].
  ///
  /// [Alignment.topLeft] returns [Offset.zero]
  ///
  /// [Alignment.center] or [Alignment(0, 0)] returns the center coordinates on this component.
  ///
  /// [Alignment.bottomRight] returns offset that is equal to size of this component.
  Offset getPointOnComponent(Alignment alignment) {
    return Offset(
      size.width * ((alignment.x + 1) / 2),
      size.height * ((alignment.y + 1) / 2),
    );
  }

  /// Sets the component's parent.
  ///
  /// It's not possible to make a parent-child loop. (its ancestor cannot be its child)
  ///
  /// You should use it only with [addChild] on the parent's component.
  setParent(String parentId) {
    this.parentId = parentId;
  }

  /// Removes parent's id from this component data.
  ///
  /// You should use it only with [removeChild] on the parent's component.
  removeParent() {
    this.parentId = null;
  }

  /// Sets the component's parent.
  ///
  /// It's not possible to make a parent-child loop. (its ancestor cannot be its child)
  ///
  /// You should use it only with [setParent] on the child's component.
  addChild(String childId) {
    childrenIds.add(childId);
  }

  /// Removes child's id from children.
  ///
  /// You should use it only with [removeParent] on the child's component.
  removeChild(String childId) {
    childrenIds.remove(childId);
  }

  @override
  String toString() {
    return 'Component data ($id), position: $position';
  }

  ComponentData.fromJson(
    Map<String, dynamic> json, {
    Function(Map<String, dynamic> json)? decodeCustomComponentData,
  })  : id = json['id'],
        position = Offset(json['position'][0], json['position'][1]),
        size = Size(json['size'][0], json['size'][1]),
        minSize = Size(json['min_size'][0], json['min_size'][1]),
        type = json['type'],
        zOrder = json['z_order'],
        parentId = json['parent_id'],
        data = decodeCustomComponentData?.call(json['dynamic_data']) {
    this.childrenIds.addAll(
        (json['children_ids'] as List).map((id) => id as String).toList());
    this.connections.addAll((json['connections'] as List)
        .map((connectionJson) => Connection.fromJson(connectionJson)));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'position': [position.dx, position.dy],
        'size': [size.width, size.height],
        'min_size': [minSize.width, minSize.height],
        'type': type,
        'z_order': zOrder,
        'parent_id': parentId,
        'children_ids': childrenIds,
        'connections': connections,
        'dynamic_data': data?.toJson(),
      };
}

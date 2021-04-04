import 'package:diagram_editor/src/canvas_context/model/connection.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ComponentData with ChangeNotifier {
  String id;
  Offset position;
  Size size;
  final Size minSize;
  final String type;
  int zOrder = 0;
  String parentId;
  final List<String> childrenIds = [];

  final List<Connection> connections = [];

  final dynamic data;

  ComponentData({
    this.id,
    this.position = Offset.zero,
    this.size = const Size(80, 80),
    this.minSize = const Size(4, 4),
    this.type,
    this.data,
  })  : assert(minSize <= size),
        assert(position != null),
        assert(size != null),
        assert(minSize != null) {
    if (this.id == null) {
      this.id = Uuid().v4();
    }
  }

  updateComponent() {
    notifyListeners();
  }

  move(Offset offset) {
    this.position += offset;
    notifyListeners();
  }

  setPosition(Offset position) {
    this.position = position;
    notifyListeners();
  }

  addConnection(Connection connection) {
    connections.add(connection);
  }

  removeConnection(String connectionId) {
    connections.removeWhere((conn) => conn.connectionId == connectionId);
  }

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

  setSize(Size size) {
    this.size = size;
    notifyListeners();
  }

  Offset getPointOnComponent(Alignment alignment) {
    return Offset(
      size.width * ((alignment.x + 1) / 2),
      size.height * ((alignment.y + 1) / 2),
    );
  }

  setParent(String parentId) {
    this.parentId = parentId;
  }

  removeParent() {
    this.parentId = null;
  }

  addChild(String childId) {
    childrenIds.add(childId);
  }

  removeChild(String childId) {
    childrenIds.remove(childId);
  }

  @override
  String toString() {
    return 'Component data ($id), position: $position';
  }
}

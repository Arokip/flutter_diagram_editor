import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/connection.dart';
import 'package:uuid/uuid.dart';

class ComponentData with ChangeNotifier {
  String id;
  Offset position;
  Size size;
  final Size minSize;
  final String type;
  String parentId;
  final List<String> childrenIds;
  Offset positionInParent;
  final String componentBodyName;

  final List<Connection> connections = [];

  bool canMove;
  bool enableResize;
  bool isHighlightVisible;

  int zOrder = 0;

  final dynamic customData;

  ComponentData({
    this.id,
    this.position = Offset.zero,
    this.size = const Size(80, 80),
    this.minSize = const Size(4, 4),
    this.type,
    this.parentId,
    this.childrenIds = const [],
    this.positionInParent,
    this.componentBodyName,
    this.canMove = true,
    this.enableResize = true,
    this.isHighlightVisible = false,
    this.customData,
  })  : assert(minSize <= size),
        assert(position != null),
        assert(size != null),
        assert(minSize != null),
        assert(childrenIds != null),
        assert(componentBodyName != null) {
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

  resizeDelta(Offset deltaSize, updateLinkMap) {
    var tempSize = size + deltaSize;
    if (tempSize.width < minSize.width) {
      tempSize = Size(minSize.width, tempSize.height);
    }
    if (tempSize.height < minSize.height) {
      tempSize = Size(tempSize.width, minSize.height);
    }
    size = tempSize;
    updateLinkMap(this.id);
    notifyListeners();
  }

  Offset getPointOnComponent(Alignment alignment) {
    return Offset(
      size.width * ((alignment.x + 1) / 2),
      size.height * ((alignment.y + 1) / 2),
    );
  }

  showHighlight() {
    isHighlightVisible = true;
    notifyListeners();
  }

  hideHighlight() {
    isHighlightVisible = false;
    notifyListeners();
  }

  @override
  String toString() {
    return 'Component data ($id), position: $position';
  }
}

import 'dart:collection';

import 'package:diagram_editor/src/codec/diagram_serializer.dart';
import 'package:diagram_editor/src/codec/json_codec.dart';
import 'package:diagram_editor/src/controller/canvas_config.dart';
import 'package:diagram_editor/src/model/component_data.dart';
import 'package:diagram_editor/src/model/connection.dart';
import 'package:diagram_editor/src/model/diagram_data.dart';
import 'package:diagram_editor/src/model/link_data.dart';
import 'package:diagram_editor/src/model/link_style.dart';
import 'package:diagram_editor/src/util/link_attachment.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// Central class that manages all diagram state: components, links,
/// canvas position/scale, and serialization.
///
/// Replaces the old PolicySet + Reader/Writer + Context architecture.
///
/// The type parameter [C] is the type of custom data on components.
/// The type parameter [L] is the type of custom data on links.
/// Use `void` for either if no custom data is needed.
class DiagramController<C, L> with ChangeNotifier {
  /// Creates a [DiagramController].
  ///
  /// Provide [componentDataCodec] and/or [linkDataCodec] to enable
  /// serialization of custom data.
  DiagramController({
    this.canvasConfig = const CanvasConfig(),
    JsonCodec<C>? componentDataCodec,
    JsonCodec<L>? linkDataCodec,
    LinkEndpointAligner? linkEndpointAligner,
  })  : _serializer = DiagramSerializer<C, L>(
          componentDataCodec: componentDataCodec,
          linkDataCodec: linkDataCodec,
        ),
        _position = canvasConfig.initialPosition,
        canvasScale = canvasConfig.initialScale,
        _canvasColor = canvasConfig.backgroundColor,
        linkEndpointAligner =
            linkEndpointAligner ?? LinkAttachment.rectangular();

  final Uuid _uuid = const Uuid();

  /// Canvas configuration (immutable).
  final CanvasConfig canvasConfig;

  /// Serializer for diagram data.
  final DiagramSerializer<C, L> _serializer;

  // ---------------------------------------------------------------------------
  // Component & link storage
  // ---------------------------------------------------------------------------

  final HashMap<String, ComponentData<C>> _components = HashMap();
  final HashMap<String, LinkData<L>> _links = HashMap();
  List<ComponentData<C>>? _componentsSortedCache;

  // ---------------------------------------------------------------------------
  // Canvas state
  // ---------------------------------------------------------------------------

  Offset _position;

  /// Current canvas scale (zoom level).
  double canvasScale;

  Color _canvasColor;
  final GlobalKey _canvasGlobalKey = GlobalKey();

  /// Whether pointer events should be absorbed.
  bool shouldAbsorbPointer = false;

  /// Function that computes link endpoint alignment on a component.
  LinkEndpointAligner linkEndpointAligner;

  // ---------------------------------------------------------------------------
  // Animation state (used by default canvas behaviors and the widget layer)
  // ---------------------------------------------------------------------------

  /// The animation controller for smooth canvas transforms.
  /// Set by the widget layer (which provides the [TickerProvider]).
  AnimationController? animationController;

  /// Base scale at the start of a pan/zoom gesture.
  double baseScale = 1;

  /// Base position at the start of a pan/zoom gesture.
  Offset basePosition = Offset.zero;

  /// Last focal point during a gesture.
  Offset lastFocalPoint = Offset.zero;

  /// Current transform position offset (for animated transforms).
  Offset transformPosition = Offset.zero;

  /// Current transform scale factor (for animated transforms).
  double transformScale = 1;

  /// Whether the canvas model can be updated during the current frame.
  bool canUpdateCanvasModel = false;

  // ===========================================================================
  // Canvas state — read
  // ===========================================================================

  /// Current canvas position (pan offset).
  Offset get canvasPosition => _position;

  /// Current canvas background color.
  Color get canvasColor => _canvasColor;

  /// Minimum allowed scale.
  double get minScale => canvasConfig.minScale;

  /// Maximum allowed scale.
  double get maxScale => canvasConfig.maxScale;

  /// Mouse scroll zoom speed.
  double get mouseScrollSpeed => canvasConfig.mouseScrollSpeed;

  /// Global key for the canvas [RepaintBoundary].
  GlobalKey get canvasGlobalKey => _canvasGlobalKey;

  // ===========================================================================
  // Canvas state — write
  // ===========================================================================

  /// Sets the canvas position to [position].
  // ignore: use_setters_to_change_properties
  void setCanvasPosition(Offset position) {
    _position = position;
  }

  /// Pans the canvas by [offset].
  void panCanvas(Offset offset) {
    _position += offset;
  }

  /// Multiplies the canvas scale by [factor].
  void zoomCanvas(double factor) {
    canvasScale *= factor;
  }

  /// Resets canvas position to origin and scale to 1.0.
  void resetCanvasView() {
    _position = Offset.zero;
    canvasScale = 1;
    notifyListeners();
  }

  /// Sets the canvas background color.
  set canvasColor(Color color) {
    _canvasColor = color;
    notifyListeners();
  }

  /// Converts a position from screen coordinates to canvas coordinates.
  Offset fromCanvasCoordinates(Offset position) {
    return (position - _position) / canvasScale;
  }

  /// Converts a position from canvas coordinates to screen coordinates.
  Offset toCanvasCoordinates(Offset position) {
    return position * canvasScale + _position;
  }

  /// Notifies listeners of canvas state changes.
  void updateCanvas() {
    notifyListeners();
  }

  // ===========================================================================
  // Component methods
  // ===========================================================================

  /// All components as an unmodifiable map.
  Map<String, ComponentData<C>> get components =>
      UnmodifiableMapView(_components);

  /// All components sorted by z-order (lowest first).
  ///
  /// The result is cached and invalidated when components change.
  List<ComponentData<C>> get componentsSorted {
    return _componentsSortedCache ??= _components.values.toList()
      ..sort((a, b) => a.zOrder.compareTo(b.zOrder));
  }

  void _invalidateComponentsCache() {
    _componentsSortedCache = null;
  }

  /// Whether a component with [id] exists.
  bool componentExists(String id) => _components.containsKey(id);

  /// Returns the component with [id].
  ComponentData<C> getComponent(String id) {
    assert(componentExists(id), 'No component with id: $id');
    return _components[id]!;
  }

  /// Adds a [component] to the diagram. Returns its id.
  String addComponent(ComponentData<C> component) {
    _components[component.id] = component;
    _invalidateComponentsCache();
    notifyListeners();
    return component.id;
  }

  /// Removes the component with [componentId] and all its links.
  void removeComponent(String componentId) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    removeComponentParent(componentId);
    _removeParentFromChildren(componentId);
    _removeComponentLinks(componentId);
    _components.remove(componentId);
    _invalidateComponentsCache();
    notifyListeners();
  }

  /// Removes the component with [componentId] and all its descendant
  /// components recursively.
  void removeComponentWithChildren(String componentId) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    final toRemove = <String>[];
    _collectComponentAndChildren(componentId, toRemove);
    for (final id in toRemove.reversed) {
      removeComponent(id);
    }
  }

  void _collectComponentAndChildren(String componentId, List<String> result) {
    result.add(componentId);
    for (final childId in getComponent(componentId).childrenIds) {
      _collectComponentAndChildren(childId, result);
    }
  }

  /// Removes all components and links.
  void removeAllComponents() {
    _links.clear();
    _components.clear();
    _invalidateComponentsCache();
    notifyListeners();
  }

  /// Moves a component by [offset] (in screen coordinates, scaled by canvas).
  void moveComponent(String componentId, Offset offset) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    getComponent(componentId).move(offset / canvasScale);
    updateLinks(componentId);
  }

  /// Moves a component and all its children by [offset].
  void moveComponentWithChildren(String componentId, Offset offset) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    moveComponent(componentId, offset);
    for (final childId in getComponent(componentId).childrenIds) {
      moveComponentWithChildren(childId, offset);
    }
  }

  /// Sets the absolute position of a component.
  void setComponentPosition(String componentId, Offset position) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    getComponent(componentId).setPosition(position);
    updateLinks(componentId);
  }

  /// Resizes a component by [deltaSize].
  void resizeComponent(String componentId, Offset deltaSize) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    getComponent(componentId).resizeDelta(deltaSize);
  }

  /// Sets the size of a component.
  void setComponentSize(String componentId, Size size) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    getComponent(componentId).setSize(size);
  }

  /// Notifies listeners that a component has changed.
  void updateComponent(String? componentId) {
    if (componentId == null) return;
    assert(componentExists(componentId), 'No component with id: $componentId');
    getComponent(componentId).updateComponent();
  }

  /// Removes all links connected to a component.
  void removeComponentLinks(String componentId) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    _removeComponentLinks(componentId);
  }

  void _removeComponentLinks(String componentId) {
    final linksToRemove =
        getComponent(componentId).connections.map((c) => c.linkId).toList();
    for (final linkId in linksToRemove) {
      _removeLink(linkId);
    }
    notifyListeners();
  }

  // ===========================================================================
  // Z-order methods
  // ===========================================================================

  /// Sets the z-order of a component.
  void setComponentZOrder(String componentId, int zOrder) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    getComponent(componentId).zOrder = zOrder;
    _invalidateComponentsCache();
    notifyListeners();
  }

  /// Brings a component to the front (highest z-order + 1).
  int bringToFront(String componentId) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    var maxZ = getComponent(componentId).zOrder;
    for (final c in _components.values) {
      if (c.zOrder > maxZ) maxZ = c.zOrder;
    }
    getComponent(componentId).zOrder = maxZ + 1;
    _invalidateComponentsCache();
    notifyListeners();
    return maxZ + 1;
  }

  /// Brings a component and its children to the front.
  int bringToFrontWithChildren(String componentId) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    final zOrder = bringToFront(componentId);
    _setZOrderToChildren(componentId, zOrder);
    return zOrder;
  }

  /// Sends a component to the back (lowest z-order - 1).
  int sendToBack(String componentId) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    var minZ = getComponent(componentId).zOrder;
    for (final c in _components.values) {
      if (c.zOrder < minZ) minZ = c.zOrder;
    }
    getComponent(componentId).zOrder = minZ - 1;
    _invalidateComponentsCache();
    notifyListeners();
    return minZ - 1;
  }

  /// Sends a component and its children to the back.
  int sendToBackWithChildren(String componentId) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    final zOrder = sendToBack(componentId);
    _setZOrderToChildren(componentId, zOrder);
    return zOrder;
  }

  void _setZOrderToChildren(String componentId, int zOrder) {
    setComponentZOrder(componentId, zOrder);
    for (final childId in getComponent(componentId).childrenIds) {
      _setZOrderToChildren(childId, zOrder + 1);
    }
  }

  // ===========================================================================
  // Parent-child methods
  // ===========================================================================

  /// Sets a parent-child relationship. Prevents cycles.
  void setComponentParent(String componentId, String parentId) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    assert(componentExists(parentId), 'No component with id: $parentId');
    removeComponentParent(componentId);
    if (_checkParentChildLoop(componentId, parentId)) {
      getComponent(componentId).setParent(parentId);
      getComponent(parentId).addChild(componentId);
    }
  }

  /// Removes the parent from a component.
  void removeComponentParent(String componentId) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    final parentId = getComponent(componentId).parentId;
    if (parentId != null) {
      getComponent(componentId).removeParent();
      if (componentExists(parentId)) {
        getComponent(parentId).removeChild(componentId);
      }
    }
  }

  bool _checkParentChildLoop(String componentId, String parentId) {
    if (componentId == parentId) return false;
    final grandParentId = getComponent(parentId).parentId;
    if (grandParentId != null) {
      return _checkParentChildLoop(componentId, grandParentId);
    }
    return true;
  }

  void _removeParentFromChildren(String componentId) {
    final childrenToRemove =
        List<String>.from(getComponent(componentId).childrenIds);
    for (final childId in childrenToRemove) {
      removeComponentParent(childId);
    }
  }

  // ===========================================================================
  // Link methods
  // ===========================================================================

  /// All links as an unmodifiable map.
  Map<String, LinkData<L>> get links => UnmodifiableMapView(_links);

  /// Whether a link with [id] exists.
  bool linkExists(String id) => _links.containsKey(id);

  /// Returns the link with [id].
  LinkData<L> getLink(String id) {
    assert(linkExists(id), 'No link with id: $id');
    return _links[id]!;
  }

  /// Connects two components with a new link. Returns the link id.
  String connect({
    required String sourceComponentId,
    required String targetComponentId,
    LinkStyle? linkStyle,
    L? data,
  }) {
    assert(
      componentExists(sourceComponentId),
      'No component with id: $sourceComponentId',
    );
    assert(
      componentExists(targetComponentId),
      'No component with id: $targetComponentId',
    );

    final linkId = _uuid.v4();
    final source = getComponent(sourceComponentId);
    final target = getComponent(targetComponentId);

    source.addConnection(
      OutgoingConnection(
        linkId: linkId,
        otherComponentId: targetComponentId,
      ),
    );
    target.addConnection(
      IncomingConnection(
        linkId: linkId,
        otherComponentId: sourceComponentId,
      ),
    );

    final sourceAlignment = linkEndpointAligner(
      source,
      target.position + target.size.center(Offset.zero),
    );
    final targetAlignment = linkEndpointAligner(
      target,
      source.position + source.size.center(Offset.zero),
    );

    _links[linkId] = LinkData<L>(
      id: linkId,
      sourceComponentId: sourceComponentId,
      targetComponentId: targetComponentId,
      linkPoints: [
        source.position + source.getPointOnComponent(sourceAlignment),
        target.position + target.getPointOnComponent(targetAlignment),
      ],
      linkStyle: linkStyle ?? const LinkStyle(),
      data: data,
    );

    notifyListeners();
    return linkId;
  }

  /// Removes a link by [linkId].
  void removeLink(String linkId) {
    assert(linkExists(linkId), 'No link with id: $linkId');
    _removeLink(linkId);
    notifyListeners();
  }

  void _removeLink(String linkId) {
    final link = getLink(linkId);
    if (componentExists(link.sourceComponentId)) {
      getComponent(link.sourceComponentId).removeConnection(linkId);
    }
    if (componentExists(link.targetComponentId)) {
      getComponent(link.targetComponentId).removeConnection(linkId);
    }
    _links.remove(linkId);
  }

  /// Removes all links.
  void removeAllLinks() {
    for (final component in _components.values) {
      _removeComponentLinks(component.id);
    }
  }

  // ===========================================================================
  // Link joint methods
  // ===========================================================================

  /// Inserts a new link joint at [position] on segment [index].
  void insertLinkJoint(String linkId, Offset position, int index) {
    assert(linkExists(linkId), 'No link with id: $linkId');
    getLink(linkId).insertMiddlePoint(
      fromCanvasCoordinates(position),
      index,
    );
  }

  /// Sets the position of a link joint (in screen coordinates).
  void setLinkJointPosition(String linkId, Offset position, int index) {
    assert(linkExists(linkId), 'No link with id: $linkId');
    getLink(linkId).setMiddlePointPosition(
      fromCanvasCoordinates(position),
      index,
    );
  }

  /// Moves a link joint by [offset] (in screen coordinates).
  void moveLinkJoint(String linkId, Offset offset, int index) {
    assert(linkExists(linkId), 'No link with id: $linkId');
    getLink(linkId).moveMiddlePoint(offset / canvasScale, index);
  }

  /// Removes the link joint at [index].
  void removeLinkJoint(String linkId, int index) {
    assert(linkExists(linkId), 'No link with id: $linkId');
    getLink(linkId).removeMiddlePoint(index);
  }

  /// Moves all link joints by [offset] (in screen coordinates).
  void moveAllLinkJoints(String linkId, Offset offset) {
    assert(linkExists(linkId), 'No link with id: $linkId');
    getLink(linkId).moveAllMiddlePoints(offset / canvasScale);
  }

  /// Shows joints on a link.
  void showLinkJoints(String linkId) {
    assert(linkExists(linkId), 'No link with id: $linkId');
    getLink(linkId).showJoints();
  }

  /// Hides joints on a link.
  void hideLinkJoints(String linkId) {
    assert(linkExists(linkId), 'No link with id: $linkId');
    getLink(linkId).hideJoints();
  }

  /// Hides all link joints on the canvas.
  void hideAllLinkJoints() {
    for (final link in _links.values) {
      link.hideJoints();
    }
  }

  /// Returns the link segment index at [tapPosition], or null.
  int? determineLinkSegmentIndex(String linkId, Offset tapPosition) {
    assert(linkExists(linkId), 'No link with id: $linkId');
    return getLink(linkId).determineLinkSegmentIndex(
      tapPosition,
      _position,
      canvasScale,
    );
  }

  /// Updates the link endpoints after its source or target components change.
  void updateLinkEndpoints(String linkId) {
    assert(linkExists(linkId), 'No link with id: $linkId');
    final link = getLink(linkId);
    updateLinks(link.sourceComponentId);
    updateLinks(link.targetComponentId);
  }

  // ===========================================================================
  // Link endpoint recalculation (internal)
  // ===========================================================================

  /// Recalculates link endpoints for all links connected to [componentId].
  void updateLinks(String componentId) {
    assert(componentExists(componentId), 'No component with id: $componentId');
    final component = getComponent(componentId);

    for (final connection in component.connections) {
      final link = getLink(connection.linkId);

      final ComponentData<C> sourceComponent;
      final ComponentData<C> targetComponent;

      switch (connection) {
        case OutgoingConnection():
          sourceComponent = component;
          targetComponent = getComponent(connection.otherComponentId);
        case IncomingConnection():
          sourceComponent = getComponent(connection.otherComponentId);
          targetComponent = component;
      }

      final sourceAlignment = _getLinkEndpointAlignment(
        sourceComponent,
        targetComponent,
        link,
        1,
      );
      final targetAlignment = _getLinkEndpointAlignment(
        targetComponent,
        sourceComponent,
        link,
        link.linkPoints.length - 2,
      );

      link.setEndpoints(
        sourceComponent.position +
            sourceComponent.getPointOnComponent(sourceAlignment),
        targetComponent.position +
            targetComponent.getPointOnComponent(targetAlignment),
      );
    }
  }

  Alignment _getLinkEndpointAlignment(
    ComponentData<C> component,
    ComponentData<C> otherComponent,
    LinkData<L> link,
    int linkPointIndex,
  ) {
    if (link.linkPoints.length <= 2) {
      return linkEndpointAligner(
        component,
        otherComponent.position + otherComponent.size.center(Offset.zero),
      );
    } else {
      return linkEndpointAligner(component, link.linkPoints[linkPointIndex]);
    }
  }

  // ===========================================================================
  // Serialization
  // ===========================================================================

  /// Serializes the diagram to a JSON string.
  String serialize() {
    return _serializer.serialize(
      DiagramData<C, L>(
        components: _components.values.toList(),
        links: _links.values.toList(),
      ),
    );
  }

  /// Deserializes a diagram from a JSON string.
  ///
  /// Existing components and links are preserved — call
  /// [removeAllComponents] first if you want to replace the diagram.
  void deserialize(String json) {
    final diagram = _serializer.deserialize(json);
    for (final component in diagram.components) {
      _components[component.id] = component;
    }
    for (final link in diagram.links) {
      _links[link.id] = link;
      link.updateLink();
    }
    _invalidateComponentsCache();
    notifyListeners();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
}

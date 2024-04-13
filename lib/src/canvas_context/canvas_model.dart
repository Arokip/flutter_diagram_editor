import 'dart:collection';

import 'package:diagram_editor/src/abstraction_layer/policy/base/policy_set.dart';
import 'package:diagram_editor/src/canvas_context/model/component_data.dart';
import 'package:diagram_editor/src/canvas_context/model/connection.dart';
import 'package:diagram_editor/src/canvas_context/model/diagram_data.dart';
import 'package:diagram_editor/src/canvas_context/model/link_data.dart';
import 'package:diagram_editor/src/utils/link_style.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CanvasModel with ChangeNotifier {
  final Uuid _uuid = const Uuid();
  HashMap<String, ComponentData> components = HashMap();
  HashMap<String, LinkData> links = HashMap();
  PolicySet policySet;

  CanvasModel(this.policySet);

  DiagramData getDiagram() {
    return DiagramData(
      components: components.values.toList(),
      links: links.values.toList(),
    );
  }

  void updateCanvas() {
    notifyListeners();
  }

  bool componentExists(String id) {
    return components.containsKey(id);
  }

  ComponentData getComponent(String id) {
    return components[id]!;
  }

  HashMap<String, ComponentData> getAllComponents() {
    return components;
  }

  bool linkExists(String id) {
    return links.containsKey(id);
  }

  LinkData getLink(String id) {
    return links[id]!;
  }

  HashMap<String, LinkData> getAllLinks() {
    return links;
  }

  /// Returns componentData id. useful when the id is set automatically.
  String addComponent(ComponentData componentData) {
    components[componentData.id] = componentData;
    notifyListeners();
    return componentData.id;
  }

  void removeComponent(String id) {
    removeComponentConnections(id);
    components.remove(id);
    notifyListeners();
  }

  void removeComponentConnections(String id) {
    assert(components.keys.contains(id));

    List<String> linksToRemove = [];

    getComponent(id).connections.forEach((connection) {
      linksToRemove.add(connection.connectionId);
    });

    linksToRemove.forEach(removeLink);
    notifyListeners();
  }

  void removeAllComponents() {
    links.clear();
    components.clear();
    notifyListeners();
  }

  void setComponentZOrder(String componentId, int zOrder) {
    getComponent(componentId).zOrder = zOrder;
    notifyListeners();
  }

  /// You cannot use is during any movement, because the order will change so the moving item will change.
  /// Returns new zOrder
  int moveComponentToTheFront(String componentId) {
    int zOrderMax = getComponent(componentId).zOrder;
    for (final component in components.values) {
      if (component.zOrder > zOrderMax) {
        zOrderMax = component.zOrder;
      }
    }
    getComponent(componentId).zOrder = zOrderMax + 1;
    notifyListeners();
    return zOrderMax + 1;
  }

  /// You cannot use is during any movement, because the order will change so the moving item will change.
  /// /// Returns new zOrder
  int moveComponentToTheBack(String componentId) {
    int zOrderMin = getComponent(componentId).zOrder;
    for (final component in components.values) {
      if (component.zOrder < zOrderMin) {
        zOrderMin = component.zOrder;
      }
    }
    getComponent(componentId).zOrder = zOrderMin - 1;
    notifyListeners();
    return zOrderMin - 1;
  }

  void addLink(LinkData linkData) {
    links[linkData.id] = linkData;
    notifyListeners();
  }

  void removeLink(String linkId) {
    getComponent(getLink(linkId).sourceComponentId).removeConnection(linkId);
    getComponent(getLink(linkId).targetComponentId).removeConnection(linkId);
    links.remove(linkId);
    notifyListeners();
  }

  void removeAllLinks() {
    for (final component in components.values) {
      removeComponentConnections(component.id);
    }
  }

  /// Creates a link between components. Returns created link's id.
  String connectTwoComponents(
    String sourceComponentId,
    String targetComponentId,
    LinkStyle? linkStyle,
    dynamic data,
  ) {
    var linkId = _uuid.v4();
    var sourceComponent = getComponent(sourceComponentId);
    var targetComponent = getComponent(targetComponentId);

    sourceComponent.addConnection(
      ConnectionOut(
        connectionId: linkId,
        otherComponentId: targetComponentId,
      ),
    );
    targetComponent.addConnection(
      ConnectionIn(
        connectionId: linkId,
        otherComponentId: sourceComponentId,
      ),
    );

    var sourceLinkAlignment = policySet.getLinkEndpointAlignment(
      sourceComponent,
      targetComponent.position + targetComponent.size.center(Offset.zero),
    );
    var targetLinkAlignment = policySet.getLinkEndpointAlignment(
      targetComponent,
      sourceComponent.position + sourceComponent.size.center(Offset.zero),
    );

    links[linkId] = LinkData(
      id: linkId,
      sourceComponentId: sourceComponentId,
      targetComponentId: targetComponentId,
      linkPoints: [
        sourceComponent.position +
            sourceComponent.getPointOnComponent(sourceLinkAlignment),
        targetComponent.position +
            targetComponent.getPointOnComponent(targetLinkAlignment),
      ],
      linkStyle: linkStyle ?? LinkStyle(),
      data: data,
    );

    notifyListeners();
    return linkId;
  }

  void updateLinks(String componentId) {
    assert(componentExists(componentId),
        'model does not contain this component id: $componentId');
    var component = getComponent(componentId);
    for (final connection in component.connections) {
      var link = getLink(connection.connectionId);

      ComponentData sourceComponent = component;
      var targetComponent = getComponent(connection.otherComponentId);

      if (connection is ConnectionOut) {
        sourceComponent = component;
        targetComponent = getComponent(connection.otherComponentId);
      } else if (connection is ConnectionIn) {
        sourceComponent = getComponent(connection.otherComponentId);
        targetComponent = component;
      } else {
        throw ArgumentError('Invalid port connection.');
      }

      Alignment firstLinkAlignment =
          _getLinkEndpointAlignment(sourceComponent, targetComponent, link, 1);
      Alignment secondLinkAlignment = _getLinkEndpointAlignment(
          targetComponent, sourceComponent, link, link.linkPoints.length - 2);

      _setLinkEndpoints(link, sourceComponent, targetComponent,
          firstLinkAlignment, secondLinkAlignment);
    }
  }

  Alignment _getLinkEndpointAlignment(
    ComponentData component1,
    ComponentData component2,
    LinkData link,
    int linkPointIndex,
  ) {
    if (link.linkPoints.length <= 2) {
      return policySet.getLinkEndpointAlignment(
        component1,
        component2.position + component2.size.center(Offset.zero),
      );
    } else {
      return policySet.getLinkEndpointAlignment(
        component1,
        link.linkPoints[linkPointIndex],
      );
    }
  }

  void _setLinkEndpoints(
    LinkData link,
    ComponentData component1,
    ComponentData component2,
    Alignment alignment1,
    Alignment alignment2,
  ) {
    link.setEndpoints(
      component1.position + component1.getPointOnComponent(alignment1),
      component2.position + component2.getPointOnComponent(alignment2),
    );
  }
}

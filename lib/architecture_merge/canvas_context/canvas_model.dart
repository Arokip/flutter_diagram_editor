import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/component_data.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/connection.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/model/link_data.dart';
import 'package:flutter_diagram_editor/architecture_merge/utils/link_style.dart';
import 'package:uuid/uuid.dart';

class CanvasModel with ChangeNotifier {
  Uuid _uuid = Uuid();
  HashMap<String, ComponentData> components = HashMap();
  HashMap<String, LinkData> links = HashMap();

  ComponentData getComponent(String id) {
    return components[id];
  }

  HashMap<String, ComponentData> getAllComponents() {
    return components;
  }

  LinkData getLink(String id) {
    return links[id];
  }

  HashMap<String, LinkData> getAllLinks() {
    return links;
  }

  addComponent(ComponentData componentData) {
    components[componentData.id] = componentData;
    moveComponentToTheFront(componentData.id);
    notifyListeners();
  }

  removeComponent(String id) {
    removeComponentConnections(id);
    components.remove(id);
    notifyListeners();
  }

  removeComponentConnections(String id) {
    assert(components.keys.contains(id));

    List<String> linksToRemove = [];

    components[id].connections.forEach((connection) {
      linksToRemove.add(connection.connectionId);
    });

    linksToRemove.forEach(removeLink);
    notifyListeners();
  }

  removeAllComponents() {
    links.clear();
    components.clear();
    notifyListeners();
  }

  /// You cannot use is during any movement, because the order will change so the moving item will change.
  moveComponentToTheFront(String componentId) {
    int zOrderMax = components[componentId].zOrder;
    components.values.forEach((component) {
      if (component.zOrder > zOrderMax) {
        zOrderMax = component.zOrder;
      }
    });
    components[componentId].zOrder = zOrderMax + 1;
    notifyListeners();
  }

  /// You cannot use is during any movement, because the order will change so the moving item will change.
  moveComponentToTheBack(String componentId) {
    int zOrderMin = components[componentId].zOrder;
    components.values.forEach((component) {
      if (component.zOrder < zOrderMin) {
        zOrderMin = component.zOrder;
      }
    });
    components[componentId].zOrder = zOrderMin - 1;
    notifyListeners();
  }

  addLink(LinkData linkData) {
    links[linkData.id] = linkData;
    notifyListeners();
  }

  removeLink(String linkId) {
    components[links[linkId].sourceComponentId].removeConnection(linkId);
    components[links[linkId].targetComponentId].removeConnection(linkId);
    links.remove(linkId);
    notifyListeners();
  }

  removeAllLinks() {
    components.values.forEach((component) {
      removeComponentConnections(component.id);
    });
  }

  connectTwoComponents(
    String sourceComponentId,
    String targetComponentId,
    LinkStyle linkStyle,
  ) {
    var linkId = _uuid.v4();
    var sourceComponent = components[sourceComponentId];
    var targetComponent = components[targetComponentId];

    sourceComponent.addConnection(
      ConnectionOut(
        connectionId: linkId,
        componentId: targetComponentId,
      ),
    );
    targetComponent.addConnection(
      ConnectionIn(
        connectionId: linkId,
        componentId: sourceComponentId,
      ),
    );

    var sourceLinkAlignment = _getAlignmentOfLinkOnComponent(
      sourceComponent,
      targetComponent.position + targetComponent.size.center(Offset.zero),
    );
    var targetLinkAlignment = _getAlignmentOfLinkOnComponent(
      targetComponent,
      sourceComponent.position + sourceComponent.size.center(Offset.zero),
    );

    //
    links[linkId] = LinkData(
      id: linkId,
      sourceComponentId: sourceComponentId,
      targetComponentId: targetComponentId,
      linkPoints: [
        sourceComponent.position + // TODO error?
            sourceComponent.getPointOnComponent(sourceLinkAlignment),
        targetComponent.position +
            targetComponent.getPointOnComponent(targetLinkAlignment),
      ],
      linkStyle: linkStyle,
    );

    notifyListeners();
  }

  updateLinks(String componentId) {
    var component = components[componentId];
    component.connections.forEach((connection) {
      var otherComponent = components[connection.otherComponentId];
      var link = links[connection.connectionId];

      if (connection is ConnectionOut) {
        var componentLinkAlignment = _getAlignmentOfLinkOnComponent(
          component,
          (link.linkPoints.length <= 2)
              ? otherComponent.position +
                  otherComponent.size.center(Offset.zero)
              : link.linkPoints[1],
        );
        var otherComponentLinkAlignment = _getAlignmentOfLinkOnComponent(
          otherComponent,
          (link.linkPoints.length <= 2)
              ? component.position + component.size.center(Offset.zero)
              : link.linkPoints[link.linkPoints.length - 2],
        );
        link.setStart(
          component.position +
              component.getPointOnComponent(componentLinkAlignment),
        );
        link.setEnd(
          otherComponent.position +
              otherComponent.getPointOnComponent(otherComponentLinkAlignment),
        );
      } else if (connection is ConnectionIn) {
        var componentLinkAlignment = _getAlignmentOfLinkOnComponent(
          component,
          (link.linkPoints.length <= 2)
              ? otherComponent.position +
                  otherComponent.size.center(Offset.zero)
              : link.linkPoints[link.linkPoints.length - 2],
        );
        var otherComponentLinkAlignment = _getAlignmentOfLinkOnComponent(
          otherComponent,
          (link.linkPoints.length <= 2)
              ? component.position + component.size.center(Offset.zero)
              : link.linkPoints[1],
        );
        link.setStart(
          otherComponent.position +
              otherComponent.getPointOnComponent(otherComponentLinkAlignment),
        );
        link.setEnd(
          component.position +
              component.getPointOnComponent(componentLinkAlignment),
        );
      } else {
        throw ArgumentError('Invalid port connection.');
      }
    });
  }

  Alignment _getAlignmentOfLinkOnComponent(
    ComponentData source,
    Offset targetPoint,
  ) {
    var ss = targetPoint - (source.position + source.size.center(Offset.zero));
    ss = Offset(
      ss.dx / source.size.width,
      ss.dy / source.size.height,
    );

    if (ss.dx.abs() >= ss.dy.abs()) {
      ss = Offset(ss.dx / ss.dx.abs(), ss.dy / ss.dx.abs());
    } else {
      ss = Offset(ss.dx / ss.dy.abs(), ss.dy / ss.dy.abs());
    }

    return Alignment(ss.dx, ss.dy);
  }
}

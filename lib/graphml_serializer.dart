import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/link_data.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';
import 'package:xml/xml.dart';

// source: https://cs.brown.edu/people/rtamassi/gdhandbook/chapters/graphml.pdf

class GraphmlSerializer {
  static XmlDocument buildDiagramXml(CanvasModel model) {
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');

    builder.element('graphml', nest: () {
      builder.attribute('xmlns', 'http://graphml.graphdrawing.org/xmlns');
      builder.attribute(
          'xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance');
      builder.attribute('xsi:schemaLocation',
          'http://graphml.graphdrawing.org/xmlns http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd');

      _buildExtraData(builder);

      builder.element('graph', nest: () {
        builder.attribute('id', 'G');
        builder.attribute('edgedefault', 'directed');
        _buildGraphData(builder, model);

        _buildNodes(builder, model);
        _buildEdges(builder, model);
      });
    });

    return builder.buildDocument();
  }

  static _buildExtraData(XmlBuilder builder) {
    // node:
    _buildData(builder, 'node-position.dx', 'node', 'double', 'position.dx');
    _buildData(builder, 'node-position.dy', 'node', 'double', 'position.dy');
    _buildData(builder, 'node-size.width', 'node', 'double', 'size.width');
    _buildData(builder, 'node-size.height', 'node', 'double', 'size.height');
    _buildData(
        builder, 'node-minSize.width', 'node', 'double', 'minSize.width');
    _buildData(
        builder, 'node-minSize.height', 'node', 'double', 'minSize.height');
    _buildData(builder, 'node-portSize', 'node', 'double', 'portSize');
    _buildData(builder, 'node-optionSize', 'node', 'double', 'optionSize');
    _buildData(builder, 'node-topOptions', 'node', 'string', 'topOptions');
    _buildData(
        builder, 'node-bottomOptions', 'node', 'string', 'bottomOptions');
    _buildData(builder, 'node-customData', 'node', 'string', 'customData');
    _buildData(builder, 'node-componentBodyName', 'node', 'string',
        'componentBodyName');
    // port:
    _buildData(builder, 'port-color', 'port', 'int', 'color');
    _buildData(builder, 'port-borderColor', 'port', 'int', 'borderColor');
    _buildData(builder, 'port-alignment.x', 'port', 'double', 'alignment.x');
    _buildData(builder, 'port-alignment.y', 'port', 'double', 'alignment.y');
    _buildData(builder, 'port-portType', 'port', 'string', 'portType');
    // edge:
    _buildData(builder, 'edge-color', 'edge', 'int', 'color');
    _buildData(builder, 'edge-width', 'edge', 'double', 'width');
    _buildData(builder, 'edge-tipSize', 'edge', 'double', 'tipSize');
    _buildData(builder, 'edge-linkPoints', 'edge', 'string', 'linkPoints');
  }

  static _buildData(
    XmlBuilder builder,
    String id,
    String forElement, [
    String attributeType,
    String attributeName,
    String defaultValue,
  ]) {
    builder.element('key', nest: () {
      builder.attribute('id', id);
      builder.attribute('for', forElement);
      builder.attribute('attr.type', attributeType);
      builder.attribute('attr.name', attributeName);
      if (defaultValue != null) {
        builder.element('default', nest: defaultValue);
      }
    });
  }

  static _buildDataInstance(
    XmlBuilder builder,
    String key,
    Object value,
  ) {
    builder.element('data', nest: () {
      builder.attribute('key', key);
      builder.text(value);
    });
  }

  static _buildGraphData(XmlBuilder builder, CanvasModel model) {
    // builder.element('data');
  }

  static _buildNodes(XmlBuilder builder, CanvasModel model) {
    model.componentDataMap.values.forEach((component) {
      _buildNode(builder, component);
    });
  }

  static _buildNode(XmlBuilder builder, ComponentData component) {
    builder.element('node', nest: () {
      builder.attribute('id', component.id);
      component.portList.forEach((port) {
        _buildPort(builder, port);
      });
      _buildNodeData(builder, component);
    });
  }

  static _buildNodeData(XmlBuilder builder, ComponentData component) {
    _buildDataInstance(builder, 'node-position.dx', component.position.dx);
    _buildDataInstance(builder, 'node-position.dy', component.position.dy);
    _buildDataInstance(builder, 'node-size.width', component.size.width);
    _buildDataInstance(builder, 'node-size.height', component.size.height);
    _buildDataInstance(builder, 'node-minSize.width', component.minSize.width);
    _buildDataInstance(
        builder, 'node-minSize.height', component.minSize.height);
    _buildDataInstance(builder, 'node-portSize', component.portSize);
    _buildDataInstance(builder, 'node-optionSize', component.optionSize);
    _buildDataInstance(builder, 'node-topOptions',
        _componentOptionsToString(component.topOptions));
    _buildDataInstance(builder, 'node-bottomOptions',
        _componentOptionsToString(component.bottomOptions));
    _buildDataInstance(
        builder, 'node-customData', component.customData.serialize());
    _buildDataInstance(
        builder, 'node-componentBodyName', component.componentBodyName);
  }

  static _buildPort(XmlBuilder builder, PortData port) {
    builder.element('port', nest: () {
      builder.attribute('name', '${port.id}');
      _buildPortData(builder, port);
    });
  }

  static _buildPortData(XmlBuilder builder, PortData port) {
    _buildDataInstance(builder, 'port-color', port.color.value);
    _buildDataInstance(builder, 'port-borderColor', port.borderColor.value);
    _buildDataInstance(builder, 'port-alignment.x', port.alignment.x);
    _buildDataInstance(builder, 'port-alignment.y', port.alignment.y);
    _buildDataInstance(builder, 'port-portType', port.portType);
  }

  static _buildEdges(XmlBuilder builder, CanvasModel model) {
    model.linkDataMap.values.forEach((link) {
      _buildEdge(
        builder,
        link,
        model.componentDataMap[link.componentOutId].id,
        model.componentDataMap[link.componentInId].id,
      );
    });
  }

  static _buildEdge(
    XmlBuilder builder,
    LinkData link,
    String sourcePort,
    String targetPort,
  ) {
    builder.element('edge', nest: () {
      builder.attribute('id', link.id);

      builder.attribute('source', link.componentOutId);
      builder.attribute('target', link.componentInId);
      builder.attribute('sourceport', sourcePort);
      builder.attribute('targetport', targetPort);

      _buildEdgeData(builder, link);
    });
  }

  static _buildEdgeData(
    XmlBuilder builder,
    LinkData link,
  ) {
    _buildDataInstance(builder, 'edge-color', link.color.value);
    _buildDataInstance(builder, 'edge-width', link.width);
    _buildDataInstance(builder, 'edge-tipSize', link.tipSize);
    _buildDataInstance(
        builder, 'edge-linkPoints', _linkPointsToString(link.linkPoints));
  }

  static String _linkPointsToString(List<Offset> points) {
    return (points.isEmpty)
        ? ''
        : points.map((p) => '${p.dx},${p.dy}').reduce((pp, p) => '$pp;$p');
  }

  static String _componentOptionsToString(List<String> optionNames) {
    return (optionNames.isEmpty) ? '' : optionNames.reduce((ss, s) => '$ss;$s');
  }
}

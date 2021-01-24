import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/model/canvas_model.dart';
import 'package:flutter_diagram_editor/model/component_body.dart';
import 'package:flutter_diagram_editor/model/component_data.dart';
import 'package:flutter_diagram_editor/model/link_data.dart';
import 'package:flutter_diagram_editor/model/port_connection.dart';
import 'package:flutter_diagram_editor/model/port_data.dart';
import 'package:xml/xml.dart';

// TODO: catch Exceptions

class GraphmlDeserializer {
  static void buildDiagramFromXml(String fileString, CanvasModel model) {
    final document = XmlDocument.parse(fileString);

    var graphElement = document.getElement('graphml').getElement('graph');
    var components = graphElement.findElements('node').toList();
    var links = graphElement.findElements('edge').toList();

    var oldIdComponentMap =
        _getComponentMap(components, model.componentBodyMap);
    var linkMap = _getLinkMap(links, oldIdComponentMap);

    _connectPorts(oldIdComponentMap, links);

    var newIdComponentMap = HashMap<String, ComponentData>.fromIterable(
        oldIdComponentMap.values,
        key: (value) => value.id,
        value: (value) => value);

    model.replaceDiagram(newIdComponentMap, linkMap);
  }

  static HashMap<String, ComponentData> _getComponentMap(
    List<XmlElement> xmlComponents,
    HashMap<String, ComponentBody> componentBodyMap,
  ) {
    HashMap<String, ComponentData> resultMap = HashMap<String, ComponentData>();

    xmlComponents.forEach((component) {
      var ports = component.findElements('port');
      var data = component.findElements('data');
      resultMap[component.getAttribute('id')] = _getComponent(
        data,
        ports,
        componentBodyMap,
      );
    });

    return resultMap;
  }

  static ComponentData _getComponent(
    Iterable<XmlElement> data,
    Iterable<XmlElement> ports,
    HashMap<String, ComponentBody> componentBodyMap,
  ) {
    return ComponentData(
      position: Offset(
          double.parse(_getDataElementText(data, 'node-position.dx')),
          double.parse(_getDataElementText(data, 'node-position.dy'))),
      size: Size(double.parse(_getDataElementText(data, 'node-size.width')),
          double.parse(_getDataElementText(data, 'node-size.height'))),
      minSize: Size(
          double.parse(_getDataElementText(data, 'node-minSize.width')),
          double.parse(_getDataElementText(data, 'node-minSize.height'))),
      portSize: double.parse(_getDataElementText(data, 'node-portSize')),
      portList: _getPortList(ports),
      optionSize: double.parse(_getDataElementText(data, 'node-optionSize')),
      topOptions: _componentOptionsFromString(
          _getDataElementText(data, 'node-topOptions')),
      bottomOptions: _componentOptionsFromString(
          _getDataElementText(data, 'node-bottomOptions')),
      customData:
          componentBodyMap[_getDataElementText(data, 'node-componentBodyName')]
              .fromJsonCustomData(
                  jsonDecode(_getDataElementText(data, 'node-customData'))),
      componentBodyName: _getDataElementText(data, 'node-componentBodyName'),
    );
  }

  static List<PortData> _getPortList(Iterable<XmlElement> ports) {
    List<PortData> resultList = []..length = ports.length;
    ports.forEach((port) {
      resultList[int.parse(port.getAttribute('name'))] = _getPortData(port);
    });
    return resultList;
  }

  static PortData _getPortData(XmlElement port) {
    var data = port.findElements('data');
    return PortData(
      color: _parseColor(_getDataElementText(data, 'port-color')),
      borderColor: _parseColor(_getDataElementText(data, 'port-borderColor')),
      portType: _getDataElementText(data, 'port-portType'),
      alignment: Alignment(
        double.parse(_getDataElementText(data, 'port-alignment.x')),
        double.parse(_getDataElementText(data, 'port-alignment.y')),
      ),
    );
  }

  static String _getDataElementText(Iterable<XmlElement> data, String keyName) {
    return data.firstWhere((d) => d.getAttribute('key') == keyName).text;
  }

  static HashMap<String, LinkData> _getLinkMap(
    List<XmlElement> xmlLinks,
    HashMap<String, ComponentData> componentMap,
  ) {
    HashMap<String, LinkData> resultMap = HashMap<String, LinkData>();

    xmlLinks.forEach((link) {
      resultMap[link.getAttribute('id')] = _getLink(link, componentMap);
    });

    return resultMap;
  }

  static LinkData _getLink(
    XmlElement link,
    HashMap<String, ComponentData> componentMap,
  ) {
    var data = link.findElements('data');
    return LinkData(
      id: link.getAttribute('id'),
      componentOutId: componentMap[link.getAttribute('source')].id,
      componentInId: componentMap[link.getAttribute('target')].id,
      color: _parseColor(_getDataElementText(data, 'edge-color')),
      width: double.parse(_getDataElementText(data, 'edge-width')),
      tipSize: double.parse(_getDataElementText(data, 'edge-tipSize')),
      linkPoints:
          _linkPointsFromString(_getDataElementText(data, 'edge-linkPoints')),
    );
  }

  static _connectPorts(
    HashMap<String, ComponentData> componentMap,
    List<XmlElement> links,
  ) {
    links.forEach((link) {
      var portOut = componentMap[link.getAttribute('source')]
          .ports[int.parse(link.getAttribute('sourceport'))];
      var portIn = componentMap[link.getAttribute('target')]
          .ports[int.parse(link.getAttribute('targetport'))];

      portOut.addConnection(
        PortConnectionOut(
          linkId: link.getAttribute('id'),
          componentId: portIn.componentId,
          portId: portIn.id,
        ),
      );
      portIn.addConnection(
        PortConnectionIn(
          linkId: link.getAttribute('id'),
          componentId: portOut.componentId,
          portId: portOut.id,
        ),
      );
    });
  }

  static Color _parseColor(String color) {
    return Color(int.parse(color));
  }

  static List<String> _componentOptionsFromString(String optionsString) {
    return optionsString.split(';');
  }

  static List<Offset> _linkPointsFromString(String pointsString) {
    List<Offset> points = [];
    pointsString.split(';').forEach((pointString) {
      var point = pointString.split(',').map((p) => double.parse(p)).toList();
      points.add(Offset(point[0], point[1]));
    });
    return points;
  }
}

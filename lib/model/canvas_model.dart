import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_provider_canvas/graphml_deserializer.dart';
import 'package:flutter_provider_canvas/graphml_serializer.dart';
import 'package:flutter_provider_canvas/model/component_body.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/component_option_data.dart';
import 'package:flutter_provider_canvas/model/deselect_item.dart';
import 'package:flutter_provider_canvas/model/link_data.dart';
import 'package:flutter_provider_canvas/model/menu_data.dart';
import 'package:flutter_provider_canvas/model/port_connection.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';
import 'package:flutter_provider_canvas/model/port_rules.dart';
import 'package:uuid/uuid.dart';

class CanvasModel extends ChangeNotifier {
  var _uuid = Uuid();

  Offset _position = Offset(0, 0);
  double _scale = 1.0;

  double mouseScaleSpeed = 0.8;

  double maxScale = 8.0;
  double minScale = 0.1;

  HashMap<String, ComponentBody> _componentBodyMap =
      HashMap<String, ComponentBody>();

  HashMap<String, ComponentOptionData> _componentOptionMap =
      HashMap<String, ComponentOptionData>();

  MenuData menuData = MenuData();

  final PortRules portRules = PortRules();

  HashMap<String, ComponentData> _componentDataMap =
      HashMap<String, ComponentData>();
  HashMap<String, LinkData> _linkDataMap = HashMap<String, LinkData>();

  dynamic selectedItem;
  final DeselectItem deselectItem = DeselectItem();

  Color canvasColor = Colors.white;

  Color selectedPortColor = Colors.cyanAccent;
  Color otherPortsColor = Colors.teal;
  Color componentHighLightColor = Colors.red;

  bool isMultipleSelectionOn = false;
  List<String> selectedComponents = [];

  // ==== getters ====

  Offset get position => _position;

  double get scale => _scale;

  HashMap<String, ComponentBody> get componentBodyMap => _componentBodyMap;

  HashMap<String, ComponentOptionData> get componentOptionMap =>
      _componentOptionMap;

  HashMap<String, ComponentData> get componentDataMap => _componentDataMap;

  HashMap<String, LinkData> get linkDataMap => _linkDataMap;

  getComponentData(String id) {
    return componentDataMap[id];
  }

  double keepScaleInBounds(double scale, double canvasScale) {
    double scaleResult = scale;
    if (scale * canvasScale <= minScale) {
      scaleResult = minScale / canvasScale;
    }
    if (scale * canvasScale >= maxScale) {
      scaleResult = maxScale / canvasScale;
    }
    return scaleResult;
  }

  // ==== initializer ====

  addNewComponentBody(String name, ComponentBody body) {
    assert(body != null);
    _componentBodyMap[name] = body;
  }

  addNewComponentOption(String name, ComponentOptionData option) {
    assert(option != null);
    _componentOptionMap[name] = option;
  }

  // ==== NOTIFIERS ====

  addComponentToMap(ComponentData componentData) {
    _componentDataMap[componentData.id] = componentData;
    notifyListeners();
  }

  removeComponentFromList(String id) {
    removeComponentConnections(id);

    _componentDataMap.remove(id);
    selectDeselectItem();
    notifyListeners();
  }

  duplicateComponent(String id, Offset offset) {
    addComponentToMap(_componentDataMap[id].duplicate(offset));
  }

  duplicateComponentBelow(String id, Offset offset) {
    addComponentToMap(_componentDataMap[id]
        .duplicate(offset + Offset(0, _componentDataMap[id].size.height)));
  }

  removeComponentConnections(String id) {
    List<LinkData> linksToRemove = [];

    _componentDataMap[id].ports.values.forEach((port) {
      port.connections.forEach((connection) {
        linksToRemove.add(_linkDataMap[connection.connectionId]);
      });
    });

    linksToRemove.forEach(removeLink);
    notifyListeners();
  }

  resetCanvasView() {
    _position = Offset(0, 0);
    _scale = 1.0;
    notifyListeners();
  }

  updateCanvasPosition(Offset position) {
    _position += position;
  }

  updateCanvasScale(double scale) {
    _scale *= scale;
  }

  setCanvasData(Offset position, double scale) {
    _scale = scale;
    _position = position;
  }

  notifyCanvasModelListeners() {
    notifyListeners();
  }

  resizeComponent(String id) {
    _componentDataMap[id].switchEnableResize();
    selectDeselectItem();
    notifyListeners();
  }

  selectItem(dynamic item) {
    print('select item: $item');

    if (item == null) return;

    if (isMultipleSelectionOn) {
      if (item is ComponentData) {
        addOrRemoveToMultipleSelection(item.id);
      } else if (item is PortData) {
        addOrRemoveToMultipleSelection(item.componentId);
      }
      return;
    }

    if (selectedItem == item) return;

    if (item is ComponentData) {
    } else if (item is PortData) {
      if (selectedItem is PortData) {
        bool connected = tryToConnectTwoPorts(selectedItem, item);
        if (connected) {
          return;
        }
      }
    } else if (item is LinkData) {
    } else if (item is DeselectItem) {
    } else {
      throw ArgumentError("selected item is unknown type: $item");
    }

    selectedItem = item;

    notifyListeners();
  }

  selectDeselectItem() {
    selectedItem = deselectItem;
  }

  deselectIfLinkSelected() {
    if (selectedItem is LinkData) {
      selectedItem.linkNotifyListeners();
      selectDeselectItem();
    }
  }

  bool tryToConnectTwoPorts(PortData firstPort, PortData secondPort) {
    if (canConnectTwoPorts(firstPort, secondPort)) {
      connectTwoPorts(firstPort, secondPort);
      selectDeselectItem();
      notifyListeners();
      return true;
    }
    return false;
  }

  bool canConnectTwoPorts(PortData firstPort, PortData secondPort) {
    if (!portRules.canConnect(firstPort.portType, secondPort.portType)) {
      return false;
    }
    if (arePortsConnected(firstPort, secondPort)) {
      return false;
    }
    if (!(hasLessThanMaxConnections(firstPort) &&
        hasLessThanMaxConnections(secondPort))) {
      return false;
    }
    if (!canConnectIfSameComponent(
        firstPort, secondPort, portRules.canConnectSameComponent)) {
      return false;
    }

    return true;
  }

  bool arePortsConnected(PortData firstPort, PortData secondPort) {
    int index = firstPort.connections.indexWhere((connection) =>
        connection.componentId == secondPort.componentId &&
        connection.portId == secondPort.id);
    return index >= 0;
  }

  bool hasLessThanMaxConnections(PortData port) {
    int max = portRules.getMaxConnectionCount(port.portType);
    if (max == null) {
      return true;
    } else {
      return port.connections.length < max;
    }
  }

  bool canConnectIfSameComponent(
      PortData firstPort, PortData secondPort, bool canConnectSame) {
    if (canConnectSame) {
      return true;
    } else {
      if (firstPort.componentId != secondPort.componentId) {
        return true;
      } else {
        return false;
      }
    }
  }

  connectTwoPorts(PortData portOut, PortData portIn) {
    print('connect two ports');
    var linkId = _uuid.v4();
    portOut.addConnection(
      PortConnectionOut(
        linkId: linkId,
        componentId: portIn.componentId,
        portId: portIn.id,
      ),
    );
    portIn.addConnection(
      PortConnectionIn(
        linkId: linkId,
        componentId: portOut.componentId,
        portId: portOut.id,
      ),
    );

    _linkDataMap[linkId] = LinkData(
      id: linkId,
      componentOutId: portOut.componentId,
      componentInId: portIn.componentId,
      color: Colors.black,
      width: 1.5,
      linkPoints: [
        componentDataMap[portOut.componentId].getPortCenterPoint(portOut.id),
        componentDataMap[portIn.componentId].getPortCenterPoint(portIn.id),
      ],
    );
  }

  removeLink(LinkData linkData) {
    linkDataMap.remove(linkData.id);
    componentDataMap[linkData.componentOutId].removeConnection(linkData.id);
    componentDataMap[linkData.componentInId].removeConnection(linkData.id);
    selectDeselectItem();
    notifyListeners();
  }

  void updateLinkMap(String componentId) {
    componentDataMap[componentId].ports.values.forEach((port) {
      port.connections.forEach((connection) {
        if (connection is PortConnectionOut) {
          linkDataMap[connection.connectionId].setStart(
              componentDataMap[componentId].getPortCenterPoint(port.id));
        } else if (connection is PortConnectionIn) {
          linkDataMap[connection.connectionId].setEnd(
              componentDataMap[componentId].getPortCenterPoint(port.id));
        } else {
          throw ArgumentError('Invalid port connection.');
        }
      });
    });
  }

  // ==== multiple selection ====

  switchMultipleSelection() {
    isMultipleSelectionOn = !isMultipleSelectionOn;
    selectDeselectItem();
    notifyListeners();
  }

  addToMultipleSelection(String componentId) {
    if (!selectedComponents.contains(componentId)) {
      selectedComponents.add(componentId);
      notifyListeners();
    }
  }

  addOrRemoveToMultipleSelection(String componentId) {
    if (!selectedComponents.remove(componentId)) {
      selectedComponents.add(componentId);
    }
    notifyListeners();
  }

  turnOffMultipleSelection() {
    isMultipleSelectionOn = false;
    selectedComponents = [];
  }

  clearMultipleSelectedComponents() {
    turnOffMultipleSelection();
    notifyListeners();
  }

  moveSelectedComponents(Offset position) {
    linkDataMap.values.forEach((value) {
      if (selectedComponents.contains(value.componentOutId) &&
          selectedComponents.contains(value.componentInId)) {
        value.updateAllMiddlePoints(position);
      }
    });
    selectedComponents.forEach((componentId) {
      componentDataMap[componentId].updateComponentDataPosition(position);
      updateLinkMap(componentId);
    });
  }

  removeSelectedComponents() {
    assert(isMultipleSelectionOn);
    selectedComponents.forEach((componentId) {
      removeComponentFromList(componentId);
    });
    clearMultipleSelectedComponents();
  }

  removeSelectedConnections() {
    assert(isMultipleSelectionOn);
    selectedComponents.forEach((componentId) {
      removeComponentConnections(componentId);
    });
  }

  duplicateSelectedComponents() {
    assert(isMultipleSelectionOn);
    double mostTop = double.infinity;
    double mostBottom = double.negativeInfinity;
    selectedComponents.forEach((componentId) {
      if (mostTop > _componentDataMap[componentId].position.dy) {
        mostTop = _componentDataMap[componentId].position.dy;
      }
      if (mostBottom <
          _componentDataMap[componentId].position.dy +
              _componentDataMap[componentId].size.height) {
        mostBottom = _componentDataMap[componentId].position.dy +
            _componentDataMap[componentId].size.height;
      }
    });
    selectedComponents.forEach((componentId) {
      duplicateComponent(componentId, Offset(0, mostBottom - mostTop + 24));
    });
  }

  selectAllComponents() {
    assert(isMultipleSelectionOn);
    _componentDataMap.keys.forEach((componentId) {
      print('select all: $componentId');
      addToMultipleSelection(componentId);
    });
  }

  // ==== functions all ====

  removeAllComponents() {
    clearMultipleSelectedComponents();
    var componentsToRemove = componentDataMap.keys.toList();
    componentsToRemove.forEach(removeComponentFromList);
  }

  removeAllConnections() {
    componentDataMap.values.forEach((component) {
      removeComponentConnections(component.id);
    });
  }

  // ==== graphML ====

  saveDiagramAsGraphML(String filePath) {
    String xmlString =
        GraphmlSerializer.buildDiagramXml(this).toXmlString(pretty: true);
    log(xmlString);
    _saveXmlToFile(xmlString, filePath);
  }

  _saveXmlToFile(String xmlString, String filePath) async {
    File file = File(filePath);
    await file.writeAsString(xmlString);
  }

  loadDiagramFromFile(String filePath) {
    resetCanvasView();

    File file = File(filePath);
    GraphmlDeserializer.buildDiagramFromXml(file, this);
  }

  replaceDiagram(HashMap<String, ComponentData> newComponentDataMap,
      HashMap<String, LinkData> newLinkDataMap) {
    _componentDataMap = newComponentDataMap;
    _linkDataMap = newLinkDataMap;
  }

  // ==== screenshot ====

  GlobalKey canvasGlobalKey = GlobalKey();
  bool isTakingImage = false;

  dynamic screenshotSelectedItem;
  Offset screenshotPosition;
  double screenshotScale;

  _prepareCanvasForScreenshot(double scale) async {
    screenshotSelectedItem = selectedItem;
    screenshotPosition = position;
    screenshotScale = _scale;

    isTakingImage = true;

    selectDeselectItem();
    turnOffMultipleSelection();

    _scale = scale;
  }

  _setScreenshotPosition(Offset position) {
    _position = position;
    notifyListeners();
  }

  _resetCanvasAfterScreenshot() {
    selectedItem = screenshotSelectedItem;
    _position = screenshotPosition;
    _scale = screenshotScale;

    isTakingImage = false;

    notifyListeners();
  }

  saveDiagramAsImage(String filePath,
      [double scale = 1.0, double edge = 0]) async {
    assert(edge >= 0);
    assert(scale <= maxScale && scale >= minScale);
    _prepareCanvasForScreenshot(scale);

    RenderRepaintBoundary boundary =
        canvasGlobalKey.currentContext.findRenderObject();
    Rect diagramRect = _getDiagramRect(scale, edge);
    Size canvasSize = boundary.size - Offset(1, 1);

    int horizontal = (diagramRect.width / canvasSize.width).ceil();
    int vertical = (diagramRect.height / canvasSize.height).ceil();

    HashMap<Offset, ui.Image> positionImageMap = HashMap<Offset, ui.Image>();

    for (int i = 0; i < vertical; i++) {
      for (int j = 0; j < horizontal; j++) {
        var screenshotPosition =
            -Offset(canvasSize.width * j, canvasSize.height * i) -
                diagramRect.topLeft;
        _setScreenshotPosition(screenshotPosition);
        await SchedulerBinding.instance.endOfFrame.then((_) async {
          await _captureImage(boundary, screenshotPosition, positionImageMap);
        });
      }
    }

    _resetCanvasAfterScreenshot();

    var resultImage = await _mergeImages(diagramRect, positionImageMap);

    await _saveImageToFile(resultImage, filePath);
  }

  Future<void> _captureImage(RenderRepaintBoundary boundary, Offset position,
      HashMap<Offset, ui.Image> positionImageMap) async {
    ui.Image image = await boundary.toImage();
    positionImageMap[position] = image;
  }

  Future<ui.Image> _mergeImages(
      Rect diagramRect, HashMap<Offset, ui.Image> positionImageMap) {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final paint = Paint();
    Canvas canvas = Canvas(recorder);

    canvas.drawColor(canvasColor, BlendMode.srcOver);

    positionImageMap.forEach((position, image) {
      canvas.drawImage(image, -position - diagramRect.topLeft, paint);
    });

    return recorder.endRecording().toImage(
          diagramRect.width.ceil(),
          diagramRect.height.ceil(),
        );
  }

  _saveImageToFile(ui.Image image, String filePath) async {
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    File file = File(filePath);
    await file.writeAsBytes(pngBytes);
  }

  Rect _getDiagramRect(double scale, double edge) {
    double mostTop = double.infinity;
    double mostBottom = double.negativeInfinity;
    double mostLeft = double.infinity;
    double mostRight = double.negativeInfinity;

    if (componentDataMap == null || componentDataMap.isEmpty) {
      if (edge <= 0) {
        return Rect.fromLTRB(0, 0, 1, 1);
      }
      return Rect.fromLTRB(0, 0, edge, edge);
    }

    componentDataMap.keys.forEach((componentId) {
      if (mostTop > _componentDataMap[componentId].position.dy) {
        mostTop = _componentDataMap[componentId].position.dy;
      }
      if (mostLeft > _componentDataMap[componentId].position.dx) {
        mostLeft = _componentDataMap[componentId].position.dx;
      }
      if (mostBottom <
          _componentDataMap[componentId].position.dy +
              _componentDataMap[componentId].size.height +
              _componentDataMap[componentId].portSize) {
        mostBottom = _componentDataMap[componentId].position.dy +
            _componentDataMap[componentId].size.height +
            _componentDataMap[componentId].portSize;
      }
      if (mostRight <
          _componentDataMap[componentId].position.dx +
              _componentDataMap[componentId].size.width +
              _componentDataMap[componentId].portSize) {
        mostRight = _componentDataMap[componentId].position.dx +
            _componentDataMap[componentId].size.width +
            _componentDataMap[componentId].portSize;
      }
    });
    linkDataMap.keys.forEach((linkId) {
      linkDataMap[linkId].linkPoints.forEach((point) {
        if (mostTop > point.dy) {
          mostTop = point.dy;
        }
        if (mostLeft > point.dx) {
          mostLeft = point.dx;
        }
        if (mostBottom < point.dy) {
          mostBottom = point.dy;
        }
        if (mostRight < point.dx) {
          mostRight = point.dx;
        }
      });
    });
    return Rect.fromLTRB(
      scale * mostLeft - edge,
      scale * mostTop - edge,
      scale * mostRight + edge,
      scale * mostBottom + edge,
    );
  }
}

import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_provider_canvas/model/component_body.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/deselect_item.dart';
import 'package:flutter_provider_canvas/model/link_data.dart';
import 'package:flutter_provider_canvas/model/menu_data.dart';
import 'package:flutter_provider_canvas/model/port_connection.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';
import 'package:flutter_provider_canvas/model/port_rules.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class CanvasModel extends ChangeNotifier {
  var _uuid = Uuid();

  Offset _position = Offset(0, 0);
  double _scale = 1.0;

  HashMap<String, ComponentBody> _componentBodyMap =
      HashMap<String, ComponentBody>();

  HashMap<String, ComponentData> _componentDataMap =
      HashMap<String, ComponentData>();
  HashMap<String, LinkData> _linkDataMap = HashMap<String, LinkData>();
  MenuData menuData = MenuData();

  dynamic selectedItem;
  final DeselectItem deselectItem = DeselectItem();

  Color canvasColor = Colors.yellow;

  Color selectedPortColor = Colors.cyanAccent;
  Color otherPortsColor = Colors.teal;
  Color componentHighLightColor = Colors.red;

  final PortRules portRules = PortRules();

  bool isMultipleSelectionOn = false;
  List<String> selectedComponents = [];

  // ==== getters ====

  Offset get position => _position;

  double get scale => _scale;

  HashMap<String, ComponentBody> get componentBodyMap => _componentBodyMap;

  HashMap<String, ComponentData> get componentDataMap => _componentDataMap;

  HashMap<String, LinkData> get linkDataMap => _linkDataMap;

  getComponentData(String id) {
    return componentDataMap[id];
  }

  // ==== initializer ====

  addNewComponentBody(String name, ComponentBody body) {
    assert(body != null);
    _componentBodyMap[name] = body;
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
    if (selectedItem == item) return;

    if (item == null) return;

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

    turnOffMultipleSelection();
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

  // ==== screenshot ====

  // TODO: unable canvas moving + loading

  GlobalKey canvasGlobalKey = GlobalKey();

  dynamic screenshotSelectedItem;
  Offset screenshotPosition;
  double screenshotScale;

  HashMap<Offset, ui.Image> positionImageMap = HashMap<Offset, ui.Image>();

  _prepareForScreenshot(double scale) async {
    print('prepare');
    screenshotSelectedItem = selectedItem;
    screenshotPosition = position;
    screenshotScale = _scale;

    selectDeselectItem();
    turnOffMultipleSelection();

    _scale = scale;
  }

  _setScreenshotPosition(Offset position) {
    _position = position;
    notifyListeners();
  }

  _resetAfterScreenshot() {
    print('reset');
    selectedItem = screenshotSelectedItem;
    _position = screenshotPosition;
    _scale = screenshotScale;
    positionImageMap = HashMap<Offset, ui.Image>();
    notifyListeners();
  }

  saveDiagramAsImage(double scale, double edge) async {
    assert(edge >= 0);
    _prepareForScreenshot(scale);

    RenderRepaintBoundary boundary =
        canvasGlobalKey.currentContext.findRenderObject();
    Rect diagramRect = _getDiagramRect(scale, edge);
    Size canvasSize = boundary.size;

    print('rect: $diagramRect');

    int horizontal = (diagramRect.width / canvasSize.width).ceil();
    int vertical = (diagramRect.height / canvasSize.height).ceil();

    List<Offset> positionsForSS = [];

    for (int i = 0; i < vertical; i++) {
      for (int j = 0; j < horizontal; j++) {
        positionsForSS.add(
            -Offset(canvasSize.width * j, canvasSize.height * i) -
                diagramRect.topLeft);
      }
    }

    for (Offset position in positionsForSS) {
      _setScreenshotPosition(position);
      await SchedulerBinding.instance.endOfFrame.then((_) async {
        await _captureImage(boundary, position);
      });
    }

    var resultImage = await _mergeImages(diagramRect);

    await _saveToFile(resultImage);

    _resetAfterScreenshot();
  }

  Future<void> _captureImage(
      RenderRepaintBoundary boundary, Offset position) async {
    ui.Image image = await boundary.toImage();
    positionImageMap[position] = image;
  }

  Future<ui.Image> _mergeImages(Rect rect) {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final paint = Paint();
    Canvas canvas = Canvas(recorder);

    canvas.drawColor(canvasColor, BlendMode.srcOver);

    positionImageMap.forEach((position, image) {
      canvas.drawImage(image, -position - rect.topLeft, paint);
    });

    return recorder.endRecording().toImage(
          rect.width.ceil(),
          rect.height.ceil(),
        );
  }

  _saveToFile(ui.Image image) async {
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    String dir = (await getExternalStorageDirectory()).path;
    String fullPath = '$dir/${Uuid().v4()}.png';
    File file = File(fullPath);
    await file.writeAsBytes(pngBytes);
  }

  Rect _getDiagramRect(double scale, [double edge = 0]) {
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
    return Rect.fromLTRB(
      scale * mostLeft - edge,
      scale * mostTop - edge,
      scale * mostRight + edge,
      scale * mostBottom + edge,
    );
  }
}

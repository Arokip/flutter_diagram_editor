import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/component_options_data.dart';
import 'package:flutter_provider_canvas/model/port_connection.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';

import 'item_selected.dart';
import 'link_data.dart';

int componentCount = 50;
int linkCount = 50;
int portPerComponentMaxCount = 4;

class CanvasModel extends ChangeNotifier {
  int _componentIdGen = 0;
  int _linkIdGen = 0;

  Offset _position = Offset(0, 0);
  double _scale = 1.0;

  HashMap<int, ComponentData> _componentDataMap;
  HashMap<int, LinkData> _linkDataMap;

  final double _portSize = 20;
  final double _optionSize = 40;

  dynamic selectedItem;
  final DeselectItem deselectItem = DeselectItem();

  CanvasModel() {
    // _componentDataMap = generateComponents(componentCount);
    _componentDataMap = generateRandomComponents(componentCount);

    _linkDataMap = generateRandomLinks(linkCount);
    // _linkDataMap[-1] =
    //     LinkData(start: Offset(0, 0), end: Offset(200, 100), width: 5);
  }

  Offset get position => _position;

  double get scale => _scale;

  HashMap<int, ComponentData> get componentDataMap => _componentDataMap;

  HashMap<int, LinkData> get linkDataMap => _linkDataMap;

  // ==== NOTIFIERS ====

  addComponentToList(ComponentData componentData) {
    _componentDataMap[componentData.id] = componentData;
    notifyListeners();
  }

  removeComponentFromList(int id) {
    removeComponentConnections(id);

    _componentDataMap.remove(id);
    selectedItem = deselectItem;
    notifyListeners();
  }

  duplicateComponent(int id) {
    int newId = generateNextComponentId;
    addComponentToList(_componentDataMap[id].duplicate(newId, Offset(0, 24)));
  }

  removeComponentConnections(int id) {
    List<LinkData> linksToRemove = [];

    _componentDataMap[id].ports.values.forEach((port) {
      port.connections.forEach((connection) {
        linksToRemove.add(_linkDataMap[connection.connectionId]);
      });
    });

    linksToRemove.forEach(removeLink);
    notifyListeners();
  }

  changeColor(int id) {
    _componentDataMap[id].color = randomColor();
    // selectedItem = deselectItem;
    // _componentDataMap[id].notifyListeners();
    notifyListeners();
  }

  resetCanvasView() {
    _position = Offset(0, 0);
    _scale = 1.0;
    notifyListeners();
  }

  updateCanvasPosition(Offset position) {
    _position += position;
    // notifyListeners();
  }

  updateCanvasScale(double scale) {
    _scale *= scale;
    // notifyListeners();
  }

  setCanvasData(Offset position, double scale) {
    _scale = scale;
    _position = position; //+=
    // notifyListeners();
  }

  notifyCanvasModelListeners() {
    notifyListeners();
  }

  selectItem(dynamic item) {
    if (selectedItem == item) return;

    if (item == null) return;

    if (selectedItem != null) {
      selectedItem.isItemSelected = false;
    }

    if (item is ComponentData) {
    } else if (item is PortData) {
      if (selectedItem is PortData) {
        connectTwoPorts(selectedItem, item);
        selectedItem = deselectItem;
        notifyListeners();
        return;
      }
    } else if (item is LinkData) {
    } else if (item is DeselectItem) {
    } else {
      throw ArgumentError("selected item is unknown type: $item");
    }

    selectedItem = item;
    selectedItem.isItemSelected = true;

    notifyListeners();
  }

  connectTwoPorts(PortData portOut, PortData portIn) {
    print('connect two ports');
    generateNextLinkId;
    portOut.addConnection(
      PortConnectionOut(
        linkId: getLastUsedLinkId,
        componentId: portOut.componentId,
        portId: portOut.id,
      ),
    );
    portIn.addConnection(
      PortConnectionIn(
        linkId: getLastUsedLinkId,
        componentId: portIn.componentId,
        portId: portIn.id,
      ),
    );
    _linkDataMap[getLastUsedLinkId] = LinkData(
      id: getLastUsedLinkId,
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
    selectedItem = deselectItem;
    notifyListeners();
  }

  // ==== IDs ====

  int get generateNextComponentId => _componentIdGen++;

  int get getLastUsedComponentId => _componentIdGen - 1;

  int get getNextComponentId => _componentIdGen;

  int get generateNextLinkId => _linkIdGen++;

  int get getLastUsedLinkId => _linkIdGen - 1;

  int get getNextLinkId => _linkIdGen;

  // ==== HELPERS ====

  HashMap<int, ComponentData> generateComponents(int number) {
    HashMap<int, ComponentData> resultMap = HashMap<int, ComponentData>();
    for (int j = 0; j < number / 100; j++) {
      for (int i = 0;
          i < ((number - j * 100) >= 100 ? 100 : (number % 100));
          i++) {
        resultMap[generateNextComponentId] = ComponentData(
            id: getLastUsedComponentId,
            position: Offset(i * 3.0, i * 3.0 + 100 * j),
            color: randomColor(),
            size: Size(50, 50));
      }
    }
    return resultMap;
  }

  HashMap<int, ComponentData> generateRandomComponents(int number) {
    HashMap<int, ComponentData> resultMap = HashMap<int, ComponentData>();

    for (int i = 0; i < number; i++) {
      int componentId = generateNextComponentId;
      resultMap[componentId] = ComponentData(
        id: componentId,
        color: randomColor(),
        size: Size(40 + 200 * math.Random().nextDouble(),
            40 + 120 * math.Random().nextDouble()),
        position: Offset(1200 * 2 * (math.Random().nextDouble() - 0.5),
            1200 * 2 * (math.Random().nextDouble() - 0.5)),
        portSize: _portSize,
        ports: generatePortData(
            componentId, math.Random().nextInt(portPerComponentMaxCount + 1)),
        optionsData: ComponentOptionsData(
          optionSize: _optionSize,
          optionsTop: [
            ComponentOptionData(
              color: Colors.lime,
              icon: Icons.map,
              tooltip: "map",
              onOptionTap: (cid) {
                print('the correct on tap: $cid');
              },
            ),
            ComponentOptionData(),
            ComponentOptionData(tooltip: "nothing"),
          ],
          optionsBottom: [
            ComponentOptionData(
              color: Colors.red,
              icon: Icons.delete_forever,
              tooltip: "delete component",
              onOptionTap: (cid) {
                removeComponentFromList(cid);
                print('remove component: $componentId');
              },
            ),
            ComponentOptionData(
              color: Colors.yellow,
              icon: Icons.copy,
              tooltip: "duplicate component",
              onOptionTap: (cid) {
                duplicateComponent(cid);
                print('duplicate component: $cid');
              },
            ),
            ComponentOptionData(
              color: randomColor(),
              icon: Icons.color_lens_outlined,
              tooltip: "change color randomly",
              onOptionTap: (cid) {
                changeColor(cid);
                print('change color: $cid');
              },
            ),
            ComponentOptionData(
              color: Colors.deepPurple,
              icon: Icons.link_off,
              tooltip: "remove all component connections",
              onOptionTap: (cid) {
                removeComponentConnections(cid);
                print('remove connections: $cid');
              },
            ),
          ],
        ),
      );
    }
    return resultMap;
  }

  HashMap<int, PortData> generatePortData(int componentId, int number) {
    HashMap<int, PortData> ports = HashMap<int, PortData>();
    for (int i = 0; i < number; i++) {
      ports[i] = PortData(
        id: i,
        componentId: componentId,
        color: randomColor(),
        borderColor: math.Random().nextBool() ? Colors.black : Colors.white,
        alignment: Alignment(2 * math.Random().nextDouble() - 1,
            2 * math.Random().nextDouble() - 1),
      );
    }
    return ports;
  }

  HashMap<int, LinkData> generateRandomLinks(int number) {
    HashMap<int, LinkData> resultMap = HashMap<int, LinkData>();
    for (int i = 0; i < number; i++) {
      generateNextLinkId;

      int idOut = math.Random().nextInt(getNextComponentId);
      int idIn = math.Random().nextInt(getNextComponentId);

      var componentOut = componentDataMap[idOut];
      var componentIn = componentDataMap[idIn];

      var portCountOut = componentOut.ports.length;
      if (portCountOut == 0) continue;
      var randomPortIdOut = math.Random().nextInt(portCountOut);

      var portCountIn = componentIn.ports.length;
      if (portCountIn == 0) continue;
      var randomPortIdIn = math.Random().nextInt(portCountIn);

      componentOut.ports[randomPortIdOut].addConnection(
        PortConnectionOut(
          linkId: getLastUsedLinkId,
          componentId: idOut,
          portId: randomPortIdOut,
        ),
      );

      componentIn.ports[randomPortIdIn].addConnection(
        PortConnectionIn(
          linkId: getLastUsedLinkId,
          componentId: idIn,
          portId: randomPortIdIn,
        ),
      );

      resultMap[getLastUsedLinkId] = LinkData(
        id: getLastUsedLinkId,
        componentOutId: idOut,
        componentInId: idIn,
        color: Colors.black,
        width: 1.5,
        linkPoints: [
          componentOut.getPortCenterPoint(randomPortIdOut),
          componentIn.getPortCenterPoint(randomPortIdIn),
        ],
      );
    }
    return resultMap;
  }

  Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/component.dart';
import 'package:flutter_provider_canvas/component_highlight.dart';
import 'package:flutter_provider_canvas/component_options.dart';
import 'package:flutter_provider_canvas/link.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:flutter_provider_canvas/model/component_data.dart';
import 'package:flutter_provider_canvas/model/link_data.dart';
import 'package:flutter_provider_canvas/model/port_data.dart';
import 'package:flutter_provider_canvas/port_highlight.dart';
import 'package:provider/provider.dart';

double mouseScaleSpeed = 0.8;

double maxScale = 8.0;
double minScale = 0.1;

class DiagramEditorCanvas extends StatefulWidget {
  @override
  _DiagramEditorCanvasState createState() => _DiagramEditorCanvasState();
}

class _DiagramEditorCanvasState extends State<DiagramEditorCanvas>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  double _baseScale = 1.0;
  Offset _basePosition = Offset(0, 0);

  Offset _lastFocalPoint = Offset(0, 0);

  Offset _transformPosition = Offset(0, 0);
  double _transformScale = 1.0;

  bool canUpdateCanvasModel = false;

  _onScaleStart(ScaleStartDetails details, CanvasModel canvasModel) {
    _baseScale = canvasModel.scale;
    _basePosition = canvasModel.position;

    _lastFocalPoint = details.focalPoint;
  }

  _onScaleUpdate(ScaleUpdateDetails details, CanvasModel canvasModel) {
    if (canUpdateCanvasModel) {
      _animationController.repeat();
      updateCanvasModelWithLastValues(canvasModel);

      double previousScale = _transformScale;

      _transformPosition += details.focalPoint - _lastFocalPoint;
      _transformScale = keepScaleInBounds(details.scale, _baseScale);

      var focalPoint = (details.localFocalPoint - _transformPosition);
      var focalPointScaled = focalPoint * (_transformScale / previousScale);

      _lastFocalPoint = details.focalPoint;

      _transformPosition += focalPoint - focalPointScaled;

      _animationController.reset();
    }
  }

  _onScaleEnd(CanvasModel canvasModel) {
    if (canUpdateCanvasModel) {
      updateCanvasModelWithLastValues(canvasModel);
    }

    _animationController.reset();

    _transformPosition = Offset(0, 0);
    _transformScale = 1.0;

    canvasModel.notifyCanvasModelListeners();
  }

  updateCanvasModelWithLastValues(CanvasModel canvasModel) {
    canvasModel.setCanvasData(
        (_basePosition * _transformScale) + _transformPosition,
        _transformScale * _baseScale);
    canUpdateCanvasModel = false;
  }

  void _receivedPointerSignal(
      PointerSignalEvent event, CanvasModel canvasModel) {
    if (event is PointerScrollEvent) {
      double scaleChange =
          event.scrollDelta.dy < 0 ? (1 / mouseScaleSpeed) : (mouseScaleSpeed);

      scaleChange = keepScaleInBounds(scaleChange, canvasModel.scale);

      if (scaleChange == 0.0) {
        return;
      }

      double previousScale = canvasModel.scale;

      canvasModel.updateCanvasScale(scaleChange);

      var focalPoint = (event.localPosition - canvasModel.position);
      var focalPointScaled = focalPoint * (canvasModel.scale / previousScale);

      canvasModel.updateCanvasPosition(focalPoint - focalPointScaled);
      canvasModel.notifyCanvasModelListeners();
    }
  }

  void _onAcceptWithDetails(
    DragTargetDetails details,
    BuildContext context,
    CanvasModel canvasModel,
  ) {
    final RenderBox renderBox = context.findRenderObject();
    final Offset localOffset = renderBox.globalToLocal(details.offset);
    ComponentData menuComponentData = details.data;
    int componentId = canvasModel.generateNextComponentId;
    Offset componentPosition = (localOffset - canvasModel.position) /
            canvasModel.scale +
        Offset(menuComponentData.size.width / canvasModel.scale / 2,
            menuComponentData.size.height / canvasModel.scale / 2) -
        Offset(menuComponentData.size.width / 2,
            menuComponentData.size.height / 2) -
        Offset(menuComponentData.portSize / 2, menuComponentData.portSize / 2);
    canvasModel.addComponentToList(
      menuComponentData.duplicate(componentId, componentPosition),
    );
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

  Widget addDragTarget(CanvasModel canvasModel) {
    return SizedBox(
      // it's here, because DragTarget outside is lagging (draggable cannot be accepted when user drops it on an component)
      child: DragTarget<ComponentData>(
        builder: (BuildContext context, List<ComponentData> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            color: Colors.transparent,
          );
        },
        onWillAccept: (ComponentData data) => true,
        onAcceptWithDetails: (details) =>
            _onAcceptWithDetails(details, context, canvasModel),
      ),
    );
  }

  List<Widget> showComponents(CanvasModel canvasModel) {
    return canvasModel.componentDataMap.values
        .map((ComponentData componentData) {
      return ChangeNotifierProvider<ComponentData>.value(
        value: componentData,
        child: Component(),
      );
    }).toList();
  }

  List<Widget> showLinks(CanvasModel canvasModel) {
    return canvasModel.linkDataMap.values.map((LinkData linkData) {
      return ChangeNotifierProvider<LinkData>.value(
        value: linkData,
        child: Link(),
      );
    }).toList();
  }

  Widget showOptions(CanvasModel canvasModel) {
    var data = canvasModel.selectedItem;
    if (data is ComponentData) {
      return ChangeNotifierProvider<ComponentData>.value(
        value: data,
        child: ComponentOptions(),
      );
    }
    return SizedBox.shrink();
  }

  Widget showComponentHighlight(CanvasModel canvasModel) {
    var data = canvasModel.selectedItem;
    if (data is ComponentData) {
      return ChangeNotifierProvider<ComponentData>.value(
        value: data,
        child: ComponentHighlight(),
      );
    }
    return SizedBox.shrink();
  }

  List<Widget> showMultipleComponentsHighlight(CanvasModel canvasModel) {
    if (canvasModel.isMultipleSelectionOn) {
      return canvasModel.selectedComponents.map((componentId) {
        return ChangeNotifierProvider<ComponentData>.value(
          value: canvasModel.componentDataMap[componentId],
          child: ComponentHighlight(),
        );
      }).toList();
    }
    return [];
  }

  Widget showPortHighlight(CanvasModel canvasModel) {
    var data = canvasModel.selectedItem;
    if (data is PortData) {
      return ChangeNotifierProvider<ComponentData>.value(
        value: canvasModel.componentDataMap[data.componentId],
        child: PortHighlight(
          portData: data,
          color: Colors.green,
        ),
      );
    }
    return SizedBox.shrink();
  }

  List<Widget> showConnectablePortsHighlight(CanvasModel canvasModel) {
    var selectedPort = canvasModel.selectedItem;
    if (selectedPort is PortData) {
      var highlights = canvasModel.componentDataMap.values
          .map((component) {
            return component.ports.values.map((port) {
              if (canvasModel.canConnectTwoPorts(selectedPort, port) &&
                  port != selectedPort) {
                return ChangeNotifierProvider<ComponentData>.value(
                  value: component,
                  child: PortHighlight(
                    portData: port,
                    color: Colors.amber,
                  ),
                );
              }
            }).toList();
          })
          .expand((element) => element)
          .toList();

      highlights.removeWhere((element) => element == null);

      return highlights;
    }
    return [];
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('CANVAS build');

    var canvasModel = Provider.of<CanvasModel>(context, listen: true);

    return Listener(
      onPointerSignal: (event) => _receivedPointerSignal(event, canvasModel),
      child: GestureDetector(
        child: Container(
          color: Colors.white,
          child: ClipRect(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget child) {
                canUpdateCanvasModel = true;
                return Transform(
                  transform: Matrix4.identity()
                    ..translate(_transformPosition.dx, _transformPosition.dy)
                    ..scale(_transformScale),
                  child: child,
                );
              },
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  addDragTarget(canvasModel),
                  ...showComponents(canvasModel),
                  ...showLinks(canvasModel),
                  showOptions(canvasModel),
                  showComponentHighlight(canvasModel),
                  showPortHighlight(canvasModel),
                  ...showConnectablePortsHighlight(canvasModel),
                  ...showMultipleComponentsHighlight(canvasModel),
                ],
              ),
            ),
          ),
        ),
        onScaleStart: (details) => _onScaleStart(details, canvasModel),
        onScaleUpdate: (details) => _onScaleUpdate(details, canvasModel),
        onScaleEnd: (details) => _onScaleEnd(canvasModel),
        onTap: () {
          print('canvas tapped');
          canvasModel.selectDeselectItem();
          canvasModel.clearMultipleSelectedComponents();
        },
      ),
    );
  }
}

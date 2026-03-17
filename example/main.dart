import 'dart:math' as math;

import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DiagramApp());

class MyNodeData {
  MyNodeData({required this.color});
  final Color color;
  bool isHighlighted = false;
}

class DiagramApp extends StatefulWidget {
  const DiagramApp({super.key});

  @override
  State<DiagramApp> createState() => _DiagramAppState();
}

class _DiagramAppState extends State<DiagramApp> {
  String? selectedComponentId;
  String serializedDiagram = '{"components": [], "links": []}';
  late Offset lastFocalPoint;

  final controller = DiagramController<MyNodeData, void>(
    canvasConfig: CanvasConfig(
      backgroundColor: Colors.grey.shade300,
    ),
    componentDataCodec: JsonCodec<MyNodeData>(
      encode: (d) => {
        'color': d.color.toARGB32().toRadixString(16),
      },
      decode: (j) => MyNodeData(
        color: Color(
          int.parse(j['color'] as String, radix: 16),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: DiagramEditor<MyNodeData, void>(
                  controller: controller,
                  componentBuilder: (context, component) {
                    final data = component.data;
                    return Container(
                      decoration: BoxDecoration(
                        color: data?.color ?? Colors.blue,
                        border: Border.all(
                          width: 2,
                          color: (data?.isHighlighted ?? false)
                              ? Colors.pink
                              : Colors.black,
                        ),
                      ),
                      child: const Center(child: Text('component')),
                    );
                  },
                  componentOverlayBuilder: (context, component) {
                    if (component.data?.isHighlighted != true) {
                      return const SizedBox.shrink();
                    }
                    return Positioned(
                      top: -36,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _OverlayButton(
                            icon: Icons.delete,
                            color: Colors.red,
                            onPressed: () {
                              _hideHighlight(selectedComponentId);
                              controller
                                ..hideAllLinkJoints()
                                ..removeComponent(component.id);
                            },
                          ),
                          const SizedBox(width: 4),
                          _OverlayButton(
                            icon: Icons.copy,
                            color: Colors.blue,
                            onPressed: () {
                              final pos =
                                  component.position + const Offset(20, 20);
                              controller.addComponent(
                                ComponentData<MyNodeData>(
                                  size: component.size,
                                  position: pos,
                                  data: MyNodeData(
                                    color: component.data?.color ?? Colors.blue,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  onCanvasTapUp: (details) {
                    controller.hideAllLinkJoints();
                    if (selectedComponentId != null) {
                      _hideHighlight(selectedComponentId);
                    } else {
                      controller.addComponent(
                        ComponentData<MyNodeData>(
                          size: const Size(96, 72),
                          position: controller.fromCanvasCoordinates(
                            details.localPosition,
                          ),
                          data: MyNodeData(
                            color: Color.fromARGB(
                              255,
                              math.Random().nextInt(256),
                              math.Random().nextInt(256),
                              math.Random().nextInt(256),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  onComponentTap: (id) {
                    controller.hideAllLinkJoints();
                    final connected = _connectComponents(
                      selectedComponentId,
                      id,
                    );
                    _hideHighlight(selectedComponentId);
                    if (!connected) _highlight(id);
                  },
                  onComponentLongPress: (id) {
                    _hideHighlight(selectedComponentId);
                    controller
                      ..hideAllLinkJoints()
                      ..removeComponent(id);
                  },
                  onComponentScaleStart: (id, details) {
                    lastFocalPoint = details.localFocalPoint;
                  },
                  onComponentScaleUpdate: (id, details) {
                    controller.moveComponent(
                      id,
                      details.localFocalPoint - lastFocalPoint,
                    );
                    lastFocalPoint = details.localFocalPoint;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        selectedComponentId = null;
                        controller.removeAllComponents();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('delete all'),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        serializedDiagram = controller.serialize();
                      },
                      child: const Text('serialize'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        controller
                          ..removeAllComponents()
                          ..deserialize(
                            serializedDiagram,
                          );
                      },
                      child: const Text('deserialize'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _highlight(String id) {
    controller.getComponent(id).data?.isHighlighted = true;
    controller.updateComponent(id);
    selectedComponentId = id;
  }

  void _hideHighlight(String? id) {
    if (id != null) {
      controller.getComponent(id).data?.isHighlighted = false;
      controller.updateComponent(id);
      selectedComponentId = null;
    }
  }

  // Long press on component already deletes; overlay button does the same
  // but is discoverable. Remove duplicate handler if desired.

  bool _connectComponents(
    String? sourceId,
    String? targetId,
  ) {
    if (sourceId == null || targetId == null || sourceId == targetId) {
      return false;
    }
    if (controller.getComponent(sourceId).connections.any(
          (c) => c is OutgoingConnection && c.otherComponentId == targetId,
        )) {
      return false;
    }
    controller.connect(
      sourceComponentId: sourceId,
      targetComponentId: targetId,
      linkStyle: const LinkStyle(
        arrowType: ArrowType.pointedArrow,
        lineWidth: 1.5,
        backArrowType: ArrowType.centerCircle,
      ),
    );
    return true;
  }
}

class _OverlayButton extends StatelessWidget {
  const _OverlayButton({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      height: 28,
      child: IconButton.filled(
        padding: EdgeInsets.zero,
        iconSize: 16,
        style: IconButton.styleFrom(backgroundColor: color),
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}

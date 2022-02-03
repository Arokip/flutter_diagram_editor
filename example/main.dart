import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DiagramApp());

class DiagramApp extends StatefulWidget {
  const DiagramApp({Key? key}) : super(key: key);

  @override
  _DiagramAppState createState() => _DiagramAppState();
}

class _DiagramAppState extends State<DiagramApp> {
  MyPolicySet myPolicySet = MyPolicySet();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(16),
                child: DiagramEditor(
                  diagramEditorContext:
                      DiagramEditorContext(policySet: myPolicySet),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () => myPolicySet.deleteAllComponents(),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        child: const Text('delete all')),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () => myPolicySet.serializeStringDiagram(),
                        child: const Text('serialize string DiagramData')),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: () => myPolicySet.deserializeStringDiagram(),
                        child: const Text('deserialize string DiagramData')),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () => myPolicySet.serializeObjectDiagram(),
                        child: const Text('serialize object DiagramData')),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: () => myPolicySet.deserializeObjectDiagram(),
                        child: const Text('deserialize object DiagramData')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom component Data which you can assign to a component to dynamic data property.
class MyComponentData {
  MyComponentData();

  bool isHighlightVisible = false;
  Color color =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  showHighlight() {
    isHighlightVisible = true;
  }

  hideHighlight() {
    isHighlightVisible = false;
  }

  // Function used to deserialize the diagram. Must be passed to `canvasWriter.model.deserializeDiagram` for proper deserialization.
  MyComponentData.fromJson(Map<String, dynamic> json)
      : isHighlightVisible = json['highlight'],
        color = Color(int.parse(json['color'], radix: 16));

  // Function used to serialization of the diagram. E.g. to save to a file.
  Map<String, dynamic> toJson() => {
        'highlight': isHighlightVisible,
        'color': color.toString().split('(0x')[1].split(')')[0],
      };
}

// A set of policies compound of mixins. There are some custom policy implementations and some policies defined by diagram_editor library.
class MyPolicySet extends PolicySet
    with
        MyInitPolicy,
        MyComponentDesignPolicy,
        MyCanvasPolicy,
        MyComponentPolicy,
        CustomPolicy,
        //
        CanvasControlPolicy,
        LinkControlPolicy,
        LinkJointControlPolicy,
        LinkAttachmentRectPolicy {}

// A place where you can init the canvas or your diagram (eg. load an existing diagram).
mixin MyInitPolicy implements InitPolicy {
  @override
  initializeDiagramEditor() {
    canvasWriter.state.setCanvasColor(Colors.grey[300]!);
  }
}

// This is the place where you can design a component.
// Use switch on componentData.type or componentData.data to define different component designs.
mixin MyComponentDesignPolicy implements ComponentDesignPolicy {
  @override
  Widget showComponentBody(ComponentData componentData) {
    return Container(
      decoration: BoxDecoration(
        color: (componentData.data as MyComponentData).color,
        border: Border.all(
          width: 2,
          color: (componentData.data as MyComponentData).isHighlightVisible
              ? Colors.pink
              : Colors.black,
        ),
      ),
      child: const Center(child: Text('component')),
    );
  }
}

// You can override the behavior of any gesture on canvas here.
// Note that it also implements CustomPolicy where own variables and functions can be defined and used here.
mixin MyCanvasPolicy implements CanvasPolicy, CustomPolicy {
  @override
  onCanvasTapUp(TapUpDetails details) {
    canvasWriter.model.hideAllLinkJoints();
    if (selectedComponentId != null) {
      hideComponentHighlight(selectedComponentId);
    } else {
      canvasWriter.model.addComponent(
        ComponentData(
          size: const Size(96, 72),
          position:
              canvasReader.state.fromCanvasCoordinates(details.localPosition),
          data: MyComponentData(),
        ),
      );
    }
  }
}

// Mixin where component behaviour is defined. In this example it is the movement, highlight and connecting two components.
mixin MyComponentPolicy implements ComponentPolicy, CustomPolicy {
  // variable used to calculate delta offset to move the component.
  late Offset lastFocalPoint;

  @override
  onComponentTap(String componentId) {
    canvasWriter.model.hideAllLinkJoints();

    bool connected = connectComponents(selectedComponentId, componentId);
    hideComponentHighlight(selectedComponentId);
    if (!connected) {
      highlightComponent(componentId);
    }
  }

  @override
  onComponentLongPress(String componentId) {
    hideComponentHighlight(selectedComponentId);
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.removeComponent(componentId);
  }

  @override
  onComponentScaleStart(componentId, details) {
    lastFocalPoint = details.localFocalPoint;
  }

  @override
  onComponentScaleUpdate(componentId, details) {
    Offset positionDelta = details.localFocalPoint - lastFocalPoint;
    canvasWriter.model.moveComponent(componentId, positionDelta);
    lastFocalPoint = details.localFocalPoint;
  }

  // This function tests if it's possible to connect the components and if yes, connects them
  bool connectComponents(String? sourceComponentId, String? targetComponentId) {
    if (sourceComponentId == null || targetComponentId == null) {
      return false;
    }
    // tests if the ids are not same (the same component)
    if (sourceComponentId == targetComponentId) {
      return false;
    }
    // tests if the connection between two components already exists (one way)
    if (canvasReader.model.getComponent(sourceComponentId).connections.any(
        (connection) =>
            (connection is ConnectionOut) &&
            (connection.otherComponentId == targetComponentId))) {
      return false;
    }

    // This connects two components (creates a link between), you can define the design of the link with LinkStyle.
    canvasWriter.model.connectTwoComponents(
      sourceComponentId: sourceComponentId,
      targetComponentId: targetComponentId,
      linkStyle: LinkStyle(
        arrowType: ArrowType.pointedArrow,
        lineWidth: 1.5,
        backArrowType: ArrowType.centerCircle,
      ),
    );

    return true;
  }
}

// You can create your own Policy to define own variables and functions with canvasReader and canvasWriter.
mixin CustomPolicy implements PolicySet {
  String? selectedComponentId;
  String serializedDiagram = '{"components": [], "links": []}';
  DiagramData diagramData = DiagramData.empty();

  highlightComponent(String componentId) {
    canvasReader.model.getComponent(componentId).data.showHighlight();
    canvasReader.model.getComponent(componentId).updateComponent();
    selectedComponentId = componentId;
  }

  hideComponentHighlight(String? componentId) {
    if (componentId != null) {
      canvasReader.model.getComponent(componentId).data.hideHighlight();
      canvasReader.model.getComponent(componentId).updateComponent();
      selectedComponentId = null;
    }
  }

  deleteAllComponents() {
    selectedComponentId = null;
    canvasWriter.model.removeAllComponents();
  }

  // Save the diagram to String in json format.
  // To choose an another option, uncomment it and comment the other options in serializeStringDiagram() and deserializeStringDiagram() methods.
  serializeStringDiagram() {
    //Option 1: DiagramData as String serialized in variable
    serializedDiagram = canvasReader.model.serializeDiagram();

    //Option 2: DiagramData as String serialized in file as single value
    // serializedDiagram = canvasReader.model.serializeDiagram();
    // File('...put your directory path here.../sting_single.json')
    //     .writeAsStringSync(serializedDiagramString);

    //Option 3: DiagramData as String serialized in file as child value
    // serializedDiagram = canvasReader.model.serializeDiagram();
    // Map<String, dynamic> parentData = {
    //   'id': 1,
    //   'name': 'diagram_string',
    //   'diagram_data': serializedDiagramString,
    // };
    // File('...put your directory path here.../string_in_parent.json')
    //     .writeAsStringSync(jsonEncode(parentData));
  }

  // Load the diagram from json format. Do it cautiously, to prevent unstable state remove the previous diagram (id collision can happen).
  // To choose an another option, uncomment it and comment the other options in serializeStringDiagram() and deserializeStringDiagram() methods.
  deserializeStringDiagram() {
    //Option 1: deserialize DiagramData as String from variable
    canvasWriter.model.deserializeDiagram(
      serializedDiagram,
      decodeCustomComponentData: MyComponentData.fromJson,
      decodeCustomLinkData: null,
    );

    //Option 2: deserialize DiagramData as String from file as single value
    // serializedDiagram = File('...put your directory path here.../sting_single.json').readAsStringSync();
    // canvasWriter.model.deserializeDiagram(
    //   serializedDiagram,
    //   decodeCustomComponentData: MyComponentData.fromJson,
    //   decodeCustomLinkData: null,
    // );

    //Option 3: deserialize DiagramData as String from file as child value
    // Map<String, dynamic> parentJson = jsonDecode(File('...put your directory path here.../string_in_parent.json').readAsStringSync());
    // serializedDiagram = parentJson['diagram_data'];
    // canvasWriter.model.deserializeDiagram(
    //   serializedDiagram,
    //   decodeCustomComponentData: MyComponentData.fromJson,
    //   decodeCustomLinkData: null,
    // );
  }

  // Save the diagram to Object.
  // To choose an another option, uncomment it and comment the other options in serializeObjectDiagram() and deserializeObjectDiagram() methods.
  serializeObjectDiagram() {
    //Option 1: DiagramData as Object serialized in variable
    diagramData = canvasReader.model.getDiagram();

    //Option 2: DiagramData as Object serialized in file as single value
    // diagramData = canvasReader.model.getDiagram();
    // File('...put your directory path here.../object_single.json')
    //     .writeAsStringSync(jsonEncode(diagramData));

    //Option 3: DiagramData as Object serialized in file as child value
    // diagramData = canvasReader.model.getDiagram();
    // Map<String, dynamic> parentData = {
    //   'id': 1,
    //   'name': 'diagram_object',
    //   'diagram_data': diagramData,
    // };
    // File('...put your directory path here.../object_in_parent.json')
    //     .writeAsStringSync(jsonEncode(parentData));
  }

  // Load the diagram from json format. Do it cautiously, to prevent unstable state remove the previous diagram (id collision can happen).
  // To choose an another option, uncomment it and comment the other options in serializeObjectDiagram() and deserializeObjectDiagram() methods.
  deserializeObjectDiagram() {
    //Option 1: deserialize DiagramData as Object from variable
    canvasWriter.model.setDiagram(diagramData);

    //Option 2: deserialize DiagramData as Object from file as single value
    // diagramData = DiagramData.fromJson(
    //   jsonDecode(File('...put your directory path here.../object_single.json').readAsStringSync()),
    //   decodeCustomComponentData: MyComponentData.fromJson,
    //   decodeCustomLinkData: null,
    // );
    // canvasWriter.model.setDiagram(diagramData);

    //Option 3: deserialize DiagramData as Object from file as child value
    // Map<String, dynamic> parentJson = jsonDecode(File('...put your directory path here.../object_in_parent.json').readAsStringSync());
    // diagramData = DiagramData.fromJson(
    //   parentJson['diagram_data'],
    //   decodeCustomComponentData: MyComponentData.fromJson,
    //   decodeCustomLinkData: null,
    // );
    // canvasWriter.model.setDiagram(diagramData);
  }
}

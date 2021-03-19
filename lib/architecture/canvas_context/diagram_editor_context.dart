import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/default/default_policy_set.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/policies/policy_set.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/rw/canvas_reader.dart';
import 'package:flutter_diagram_editor/architecture/abstraction_layer/rw/canvas_writer.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture/canvas_context/component_definition.dart';

class DiagramEditorContext {
  final CanvasModel canvasModel;
  final CanvasState canvasState;
  final ComponentDefinition componentDefinition;

  final DefaultPolicySet policySet;

  DiagramEditorContext({
    this.policySet,
  })  : this.canvasModel = CanvasModel(),
        this.canvasState = CanvasState(),
        this.componentDefinition = ComponentDefinition() {
    policySet.initPolicy(this);
  }

  DiagramEditorContext.withSharedModel(
    DiagramEditorContext oldContext, {
    this.policySet,
  })  : this.canvasModel = oldContext.canvasModel,
        this.canvasState = CanvasState(),
        this.componentDefinition = ComponentDefinition() {
    policySet.initPolicy(this);
  }

  DiagramEditorContext.withSharedState(
    DiagramEditorContext oldContext, {
    this.policySet,
  })  : this.canvasModel = CanvasModel(),
        this.canvasState = oldContext.canvasState,
        this.componentDefinition = ComponentDefinition() {
    policySet.initPolicy(this);
  }

  DiagramEditorContext.withSharedModelAndState(
    DiagramEditorContext oldContext, {
    this.policySet,
  })  : this.canvasModel = oldContext.canvasModel,
        this.canvasState = oldContext.canvasState,
        this.componentDefinition = ComponentDefinition() {
    policySet.initPolicy(this);
  }

  CanvasReader getReader() {
    return CanvasReader(
      CanvasModelReader(canvasModel),
      CanvasStateReader(canvasState),
      CanvasMiscReader(componentDefinition),
    );
  }

  CanvasWriter getWriter() {
    return CanvasWriter(
      CanvasModelWriter(canvasModel),
      CanvasStateWriter(canvasState),
      CanvasMiscWriter(componentDefinition),
    );
  }
}

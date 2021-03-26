import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/policy/defaults/default_policy_set.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/rw/reader/canvas_reader.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/rw/writer/canvas_writer.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/rw/writer/widgets_definition_writer.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/rw/writer/model_writer.dart';
import 'package:flutter_diagram_editor/architecture_merge/abstraction_layer/rw/writer/state_writer.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_model.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/canvas_state.dart';
import 'package:flutter_diagram_editor/architecture_merge/canvas_context/widgets_definition.dart';

class DiagramEditorContext {
  final CanvasModel _canvasModel;
  final CanvasState _canvasState;
  final WidgetsDefinition _componentDefinition;

  final DefaultPolicySet policySet;

  CanvasModel get canvasModel => _canvasModel;

  CanvasState get canvasState => _canvasState;

  WidgetsDefinition get componentDefinition => _componentDefinition;

  DiagramEditorContext({
    @required this.policySet,
  })  : this._canvasModel = CanvasModel(),
        this._canvasState = CanvasState(),
        this._componentDefinition = WidgetsDefinition() {
    policySet.initializePolicy(_getReader(), _getWriter());
  }

  DiagramEditorContext.withSharedModel(
    DiagramEditorContext oldContext, {
    @required this.policySet,
  })  : this._canvasModel = oldContext.canvasModel,
        this._canvasState = CanvasState(),
        this._componentDefinition = WidgetsDefinition() {
    policySet.initializePolicy(_getReader(), _getWriter());
  }

  DiagramEditorContext.withSharedState(
    DiagramEditorContext oldContext, {
    @required this.policySet,
  })  : this._canvasModel = CanvasModel(),
        this._canvasState = oldContext.canvasState,
        this._componentDefinition = WidgetsDefinition() {
    policySet.initializePolicy(_getReader(), _getWriter());
  }

  DiagramEditorContext.withSharedModelAndState(
    DiagramEditorContext oldContext, {
    @required this.policySet,
  })  : this._canvasModel = oldContext.canvasModel,
        this._canvasState = oldContext.canvasState,
        this._componentDefinition = WidgetsDefinition() {
    policySet.initializePolicy(_getReader(), _getWriter());
  }

  CanvasReader _getReader() {
    return CanvasReader(
      CanvasModelReader(canvasModel, canvasState),
      CanvasStateReader(canvasState),
      WidgetsDefinitionReader(componentDefinition),
    );
  }

  CanvasWriter _getWriter() {
    return CanvasWriter(
      CanvasModelWriter(canvasModel, canvasState),
      CanvasStateWriter(canvasState),
      WidgetsDefinitionWriter(componentDefinition),
    );
  }
}

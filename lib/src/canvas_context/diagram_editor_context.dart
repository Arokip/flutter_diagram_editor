import 'package:diagram_editor/src/abstraction_layer/policy/base/policy_set.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/canvas_reader.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/canvas_writer.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/model_reader.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/model_writer.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/state_reader.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/state_writer.dart';
import 'package:diagram_editor/src/canvas_context/canvas_model.dart';
import 'package:diagram_editor/src/canvas_context/canvas_state.dart';
import 'package:flutter/material.dart';

class DiagramEditorContext {
  final CanvasModel _canvasModel;
  final CanvasState _canvasState;

  final PolicySet policySet;

  CanvasModel get canvasModel => _canvasModel;

  CanvasState get canvasState => _canvasState;

  DiagramEditorContext({
    @required this.policySet,
  })  : this._canvasModel = CanvasModel(policySet),
        this._canvasState = CanvasState() {
    policySet.initializePolicy(_getReader(), _getWriter());
  }

  /// Some policies are used in CanvasModel, so they will be shared as well.
  DiagramEditorContext.withSharedModel(
    DiagramEditorContext oldContext, {
    @required this.policySet,
  })  : this._canvasModel = oldContext.canvasModel,
        this._canvasState = CanvasState() {
    policySet.initializePolicy(_getReader(), _getWriter());
  }

  DiagramEditorContext.withSharedState(
    DiagramEditorContext oldContext, {
    @required this.policySet,
  })  : this._canvasModel = CanvasModel(policySet),
        this._canvasState = oldContext.canvasState {
    policySet.initializePolicy(_getReader(), _getWriter());
  }

  /// Some policies are used in CanvasModel, so they will be shared as well.
  DiagramEditorContext.withSharedModelAndState(
    DiagramEditorContext oldContext, {
    @required this.policySet,
  })  : this._canvasModel = oldContext.canvasModel,
        this._canvasState = oldContext.canvasState {
    policySet.initializePolicy(_getReader(), _getWriter());
  }

  CanvasReader _getReader() {
    return CanvasReader(CanvasModelReader(canvasModel, canvasState),
        CanvasStateReader(canvasState));
  }

  CanvasWriter _getWriter() {
    return CanvasWriter(CanvasModelWriter(canvasModel, canvasState),
        CanvasStateWriter(canvasState));
  }
}

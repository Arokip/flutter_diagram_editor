import 'package:diagram_editor/src/abstraction_layer/policy/base/policy_set.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/canvas_reader.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/canvas_writer.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/model_reader.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/model_writer.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/state_reader.dart';
import 'package:diagram_editor/src/abstraction_layer/rw/state_writer.dart';
import 'package:diagram_editor/src/canvas_context/canvas_model.dart';
import 'package:diagram_editor/src/canvas_context/canvas_state.dart';

class DiagramEditorContext {
  final CanvasModel _canvasModel;
  final CanvasState _canvasState;

  /// Set of policies where all the diagram customization is defined.
  final PolicySet policySet;

  /// Canvas model containing all components and links with all the functions.
  CanvasModel get canvasModel => _canvasModel;

  /// Canvas state containing for example canvas position and scale.
  CanvasState get canvasState => _canvasState;

  /// [DiagramEditorContext] is taken as parameter by [DiagramEditor] widget.
  ///
  /// Its not generated automatically because you want to use it to copy model or state to another [DiagramEditor].
  DiagramEditorContext({
    required this.policySet,
  })  : this._canvasModel = CanvasModel(policySet),
        this._canvasState = CanvasState() {
    policySet.initializePolicy(_getReader(), _getWriter());
  }

  /// Allows you to create [DiagramEditorContext] with shared model from another [DiagramEditorContext].
  ///
  /// Warning: [LinkAttachmentPolicy] is used in CanvasModel, so this policy will be shared as well, even if you put new one to [PolicySet].
  DiagramEditorContext.withSharedModel(
    DiagramEditorContext oldContext, {
    required this.policySet,
  })  : this._canvasModel = oldContext.canvasModel,
        this._canvasState = CanvasState() {
    policySet.initializePolicy(_getReader(), _getWriter());
  }

  /// Allows you to create [DiagramEditorContext] with shared state (eg. canvas position and scale) from another [DiagramEditorContext].
  DiagramEditorContext.withSharedState(
    DiagramEditorContext oldContext, {
    required this.policySet,
  })  : this._canvasModel = CanvasModel(policySet),
        this._canvasState = oldContext.canvasState {
    policySet.initializePolicy(_getReader(), _getWriter());
  }

  /// Allows you to create [DiagramEditorContext] with shared model and state from another [DiagramEditorContext].
  ///
  /// Warning: [LinkAttachmentPolicy] is used in CanvasModel, so this policy will be shared as well, even if you put new one to [PolicySet].
  DiagramEditorContext.withSharedModelAndState(
    DiagramEditorContext oldContext, {
    required this.policySet,
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

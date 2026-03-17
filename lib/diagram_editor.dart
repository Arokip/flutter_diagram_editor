/// A Flutter library for building interactive diagram editors.
///
/// Provides a DiagramEditor widget and DiagramController for managing
/// components, links, pan/zoom, serialization, and more.
library;

export 'src/codec/json_codec.dart';
export 'src/controller/canvas_config.dart';
export 'src/controller/default_behaviors.dart';
export 'src/controller/diagram_controller.dart';
export 'src/model/component_data.dart';
export 'src/model/connection.dart';
export 'src/model/diagram_data.dart';
export 'src/model/link_data.dart';
export 'src/model/link_style.dart';
export 'src/painter/component_highlight_painter.dart';
export 'src/painter/delete_icon_painter.dart';
export 'src/painter/grid_painter.dart';
export 'src/util/link_attachment.dart';
export 'src/util/vector_utils.dart';
export 'src/widget/diagram_editor.dart';

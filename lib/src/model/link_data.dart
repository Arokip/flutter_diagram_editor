import 'package:diagram_editor/src/model/link_style.dart';
import 'package:diagram_editor/src/util/vector_utils.dart';
import 'package:flutter/material.dart';

/// Data for a single link (edge) on the diagram canvas.
///
/// The type parameter [L] is the type of custom data attached to this
/// link. Use `void` if no custom data is needed.
class LinkData<L> with ChangeNotifier {
  /// Creates a new [LinkData].
  LinkData({
    required this.id,
    required this.sourceComponentId,
    required this.targetComponentId,
    required this.linkPoints,
    LinkStyle? linkStyle,
    this.data,
  }) : linkStyle = linkStyle ?? const LinkStyle();

  /// Deserializes a [LinkData] from JSON.
  ///
  /// If [decodeData] is provided, it will be used to decode the
  /// `dynamic_data` field into a typed [L] value.
  LinkData.fromJson(
    Map<String, dynamic> json, {
    L Function(Map<String, dynamic> json)? decodeData,
  })  : id = json['id'] as String,
        sourceComponentId = json['source_component_id'] as String,
        targetComponentId = json['target_component_id'] as String,
        linkStyle = LinkStyle.fromJson(
          json['link_style'] as Map<String, dynamic>,
        ),
        linkPoints = (json['link_points'] as List)
            .map(
              (point) => Offset(
                ((point as List)[0] as num).toDouble(),
                (point[1] as num).toDouble(),
              ),
            )
            .toList(),
        data = json['dynamic_data'] != null && decodeData != null
            ? decodeData(
                json['dynamic_data'] as Map<String, dynamic>,
              )
            : null;

  /// Unique link id.
  final String id;

  /// Id of the source component.
  final String sourceComponentId;

  /// Id of the target component.
  final String targetComponentId;

  /// Visual style of this link.
  final LinkStyle linkStyle;

  /// Points from which the link is drawn on canvas.
  ///
  /// First and last points lie on the source and target components.
  final List<Offset> linkPoints;

  /// Whether this link's joints are currently visible.
  bool areJointsVisible = false;

  /// Type-safe custom data for this link.
  L? data;

  /// Notifies listeners that this link has changed.
  void updateLink() {
    notifyListeners();
  }

  /// Sets the position of the first point (on the source component).
  void setStart(Offset start) {
    linkPoints[0] = start;
    notifyListeners();
  }

  /// Sets the position of the last point (on the target component).
  void setEnd(Offset end) {
    linkPoints[linkPoints.length - 1] = end;
    notifyListeners();
  }

  /// Sets both the start and end points.
  void setEndpoints(Offset start, Offset end) {
    linkPoints[0] = start;
    linkPoints[linkPoints.length - 1] = end;
    notifyListeners();
  }

  /// Returns an unmodifiable view of all link points.
  List<Offset> getLinkPoints() => List.unmodifiable(linkPoints);

  /// Inserts a new middle point at [position] at the given [index].
  ///
  /// [index] is the segment index (starting from 1).
  void insertMiddlePoint(Offset position, int index) {
    assert(index > 0, 'index must be greater than 0');
    assert(
      index < linkPoints.length,
      'index must be less than linkPoints.length',
    );
    linkPoints.insert(index, position);
    notifyListeners();
  }

  /// Sets the position of a middle point at [index].
  ///
  /// Middle points are indexed from 1.
  void setMiddlePointPosition(Offset position, int index) {
    linkPoints[index] = position;
    notifyListeners();
  }

  /// Moves a middle point at [index] by [offset].
  ///
  /// Middle points are indexed from 1.
  void moveMiddlePoint(Offset offset, int index) {
    linkPoints[index] += offset;
    notifyListeners();
  }

  /// Removes the middle point at [index].
  ///
  /// Middle points are indexed from 1.
  void removeMiddlePoint(int index) {
    assert(
      linkPoints.length > 2,
      'cannot remove point when only 2 remain',
    );
    assert(index > 0, 'index must be greater than 0');
    assert(
      index < linkPoints.length - 1,
      'index must be less than linkPoints.length - 1',
    );
    linkPoints.removeAt(index);
    notifyListeners();
  }

  /// Moves all middle points by [offset].
  void moveAllMiddlePoints(Offset offset) {
    for (var i = 1; i < linkPoints.length - 1; i++) {
      linkPoints[i] += offset;
    }
    notifyListeners();
  }

  /// Returns the index of the link segment at the given [position],
  /// or `null` if none.
  ///
  /// Segments are indexed from 1.
  int? determineLinkSegmentIndex(
    Offset position,
    Offset canvasPosition,
    double canvasScale,
  ) {
    for (var i = 0; i < linkPoints.length - 1; i++) {
      final point1 = linkPoints[i] * canvasScale + canvasPosition;
      final point2 = linkPoints[i + 1] * canvasScale + canvasPosition;

      final rect = VectorUtils.getRectAroundLine(
        point1,
        point2,
        canvasScale * (linkStyle.lineWidth + 5),
      );

      if (rect.contains(position)) {
        return i + 1;
      }
    }
    return null;
  }

  /// Makes all link joints visible.
  void showJoints() {
    areJointsVisible = true;
    notifyListeners();
  }

  /// Hides all link joints.
  void hideJoints() {
    areJointsVisible = false;
    notifyListeners();
  }

  /// Serializes this link to JSON.
  ///
  /// If [encodeData] is provided, it will be used to serialize the [data]
  /// field.
  Map<String, dynamic> toJson({
    Map<String, dynamic> Function(L value)? encodeData,
  }) =>
      {
        'id': id,
        'source_component_id': sourceComponentId,
        'target_component_id': targetComponentId,
        'link_style': linkStyle.toJson(),
        'link_points': linkPoints.map((point) => [point.dx, point.dy]).toList(),
        'dynamic_data':
            data != null && encodeData != null ? encodeData(data as L) : null,
      };
}

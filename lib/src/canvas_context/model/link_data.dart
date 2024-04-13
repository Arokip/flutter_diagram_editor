import 'package:diagram_editor/src/utils/link_style.dart';
import 'package:diagram_editor/src/utils/vector_utils.dart';
import 'package:flutter/material.dart';

/// Class that carries all link data.
class LinkData with ChangeNotifier {
  /// Unique link id.
  final String id;

  /// Id of source component.
  final String sourceComponentId;

  /// Id of target component.
  final String targetComponentId;

  /// Defines link design such as color, width and arrowheads.
  final LinkStyle linkStyle;

  /// Points from which the link is drawn on canvas.
  ///
  /// First and last points lay on the two components which are connected by this link.
  final List<Offset> linkPoints;

  /// Defines the visibility of link's joints.
  bool areJointsVisible = false;

  /// Dynamic data for you to define your own data for this link.
  dynamic data;

  /// Represents data of a link/connection in the model.
  LinkData({
    required this.id,
    required this.sourceComponentId,
    required this.targetComponentId,
    LinkStyle? linkStyle,
    required this.linkPoints,
    this.data,
  }) : linkStyle = linkStyle ?? LinkStyle();

  /// Updates this link on the canvas.
  ///
  /// Use this function if you somehow changed the link data and you want to propagate the change to canvas.
  /// Usually this is already called in most functions such as [setStart] or [insertMiddlePoint] so it's not necessary to call it again.
  ///
  /// It calls [notifyListeners] function of [ChangeNotifier].
  updateLink() {
    notifyListeners();
  }

  /// Sets the position of the first point of the link which lies on the source component.
  setStart(Offset start) {
    linkPoints[0] = start;
    notifyListeners();
  }

  /// Sets the position of the last point of the link which lies on the target component.
  setEnd(Offset end) {
    linkPoints[linkPoints.length - 1] = end;
    notifyListeners();
  }

  /// Sets the position of both first and last point of the link.
  ///
  /// The points lie on the source and target components.
  setEndpoints(Offset start, Offset end) {
    linkPoints[0] = start;
    linkPoints[linkPoints.length - 1] = end;
    notifyListeners();
  }

  /// Returns list of all point of the link.
  List<Offset> getLinkPoints() {
    return linkPoints;
  }

  /// Adds a new point to link on [point] location.
  ///
  /// [index] is an index of link's segment where you want to insert the point.
  /// Indexed from 1.
  /// When the link is a straight line you want to add a point to index 1.
  insertMiddlePoint(Offset position, int index) {
    assert(index > 0);
    assert(index < linkPoints.length);
    linkPoints.insert(index, position);
    notifyListeners();
  }

  /// Sets the new position ([point]) to the existing link's point.
  ///
  /// Middle points are indexed from 1.
  setMiddlePointPosition(Offset position, int index) {
    linkPoints[index] = position;
    notifyListeners();
  }

  /// Updates link's point position by [offset].
  ///
  /// Middle points are indexed from 1.
  moveMiddlePoint(Offset offset, int index) {
    linkPoints[index] += offset;
    notifyListeners();
  }

  /// Removes the point on [index]^th place from the link.
  ///
  /// Middle points are indexed from 1.
  removeMiddlePoint(int index) {
    assert(linkPoints.length > 2);
    assert(index > 0);
    assert(index < linkPoints.length - 1);
    linkPoints.removeAt(index);
    notifyListeners();
  }

  /// Updates all link's middle points position by [offset].
  moveAllMiddlePoints(Offset position) {
    for (int i = 1; i < linkPoints.length - 1; i++) {
      linkPoints[i] += position;
    }
  }

  /// If a link is compound from more than one segments this returns an index of the link segment, which was tapped on.
  ///
  /// Segments are indexed from 1.
  /// If there is no link segment on the tap location it returns null.
  /// It should take a [localPosition] from a [onLinkTap] function or similar.
  int? determineLinkSegmentIndex(
    Offset position,
    Offset canvasPosition,
    double canvasScale,
  ) {
    for (int i = 0; i < linkPoints.length - 1; i++) {
      var point1 = linkPoints[i] * canvasScale + canvasPosition;
      var point2 = linkPoints[i + 1] * canvasScale + canvasPosition;

      Path rect = VectorUtils.getRectAroundLine(
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

  /// Makes all link's joint visible.
  showJoints() {
    areJointsVisible = true;
    notifyListeners();
  }

  /// Hides all link's joint.
  hideJoints() {
    areJointsVisible = false;
    notifyListeners();
  }

  LinkData.fromJson(
    Map<String, dynamic> json, {
    Function(Map<String, dynamic> json)? decodeCustomLinkData,
  })  : id = json['id'],
        sourceComponentId = json['source_component_id'],
        targetComponentId = json['target_component_id'],
        linkStyle = LinkStyle.fromJson(json['link_style']),
        linkPoints = (json['link_points'] as List).map((point) => Offset(point[0], point[1])).toList(),
        data = decodeCustomLinkData?.call(json['dynamic_data']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'source_component_id': sourceComponentId,
        'target_component_id': targetComponentId,
        'link_style': linkStyle,
        'link_points': linkPoints.map((point) => [point.dx, point.dy]).toList(),
        'dynamic_data': data?.toJson(),
      };
}

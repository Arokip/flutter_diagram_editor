import 'package:diagram_editor/src/utils/link_style.dart';
import 'package:diagram_editor/src/utils/vector_utils.dart';
import 'package:flutter/material.dart';

class LinkData with ChangeNotifier {
  final String id;

  final String sourceComponentId;
  final String targetComponentId;

  LinkStyle linkStyle;

  final List<Offset> linkPoints;

  bool areJointsVisible = false;
  bool isDeleteIconVisible = false;
  Offset deleteIconPosition = Offset.zero;

  dynamic data;

  LinkData({
    this.id,
    this.sourceComponentId,
    this.targetComponentId,
    this.linkStyle,
    this.linkPoints,
    this.data,
  });

  updateLink() {
    notifyListeners();
  }

  setStart(Offset start) {
    linkPoints[0] = start;
    notifyListeners();
  }

  setEnd(Offset end) {
    linkPoints[linkPoints.length - 1] = end;
    notifyListeners();
  }

  setEndpoints(Offset start, Offset end) {
    linkPoints[0] = start;
    linkPoints[linkPoints.length - 1] = end;
    notifyListeners();
  }

  List<Offset> getLinkPoints() {
    return linkPoints;
  }

  insertMiddlePoint(Offset position, int index) {
    assert(index > 0);
    assert(index < linkPoints.length);
    linkPoints.insert(index, position);
    notifyListeners();
  }

  setMiddlePointPosition(Offset position, int index) {
    linkPoints[index] = position;
    notifyListeners();
  }

  moveMiddlePoint(Offset offset, int index) {
    linkPoints[index] += offset;
    notifyListeners();
  }

  removeMiddlePoint(int index) {
    assert(linkPoints.length > 2);
    assert(index > 0);
    assert(index < linkPoints.length - 1);
    linkPoints.removeAt(index);
    notifyListeners();
  }

  moveAllMiddlePoints(Offset position) {
    for (int i = 1; i < linkPoints.length - 1; i++) {
      linkPoints[i] += position;
    }
  }

  int determineLinkSegmentIndex(
    Offset position,
    Offset canvasPosition,
    double canvasScale,
  ) {
    for (int i = 0; i < linkPoints.length - 1; i++) {
      var point1 = linkPoints[i] * canvasScale + canvasPosition;
      var point2 = linkPoints[i + 1] * canvasScale + canvasPosition;

      Path rect = VectorUtils.getRectAroundLine(
          point1, point2, canvasScale * (linkStyle.lineWidth + 5));

      if (rect.contains(position)) {
        return i + 1;
      }
    }
    return null;
  }

  showJoints() {
    areJointsVisible = true;
    notifyListeners();
  }

  hideJoints() {
    areJointsVisible = false;
    notifyListeners();
  }

  showDeleteIcon() {
    isDeleteIconVisible = true;
    notifyListeners();
  }

  hideLinkDeleteIcon() {
    isDeleteIconVisible = false;
    notifyListeners();
  }

  setDeleteIconPosition(Offset position) {
    deleteIconPosition = position;
    notifyListeners();
  }
}

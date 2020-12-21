import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:provider/provider.dart';

import 'model/link_data.dart';

class Link extends StatefulWidget {
  @override
  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link> {
  Offset tapPosition = Offset(0, 0);
  int segmentIndex = 0;
  bool isDeleteIconVisible = false;

  setDeleteIconVisibility(bool isVisible) {
    setState(() {
      isDeleteIconVisible = isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('LINE build');
    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var canvasSelectItem = context
        .select<CanvasModel, Function>((CanvasModel model) => model.selectItem);
    var linkData = Provider.of<LinkData>(context);
    var removeLink = context
        .select<CanvasModel, Function>((CanvasModel model) => model.removeLink);
    var selectedItem = context.select<CanvasModel, dynamic>(
        (CanvasModel model) => model.selectedItem);

    LinkPainter linkPainter = LinkPainter(
      linkPoints: (linkData.linkPoints
          .map((point) => point * canvasScale + canvasPosition)).toList(),
      width: linkData.width,
      scale: canvasScale,
      color: linkData.color,
      tipSize: linkData.tipSize,
    );

    return GestureDetector(
      onTapUp: (details) {
        if (selectedItem == linkData) {
          setState(() {
            tapPosition =
                (details.localPosition - canvasPosition) / canvasScale;
          });
          setDeleteIconVisibility(true);
        } else {
          setDeleteIconVisibility(false);
        }
        canvasSelectItem(linkData);
      },
      onLongPressStart: (details) {
        canvasSelectItem(linkData);
        setDeleteIconVisibility(false);
        segmentIndex = linkPainter.determineLinkSegmentIndex(
            (details.localPosition), canvasScale * (5 + linkData.width));
        if (segmentIndex != null) {
          linkData.insertMiddlePoint(
              (details.localPosition - canvasPosition) / canvasScale,
              segmentIndex);
        }
      },
      onLongPressMoveUpdate: (details) {
        if (segmentIndex != null) {
          linkData.updateMiddlePoint(
              (details.localPosition - canvasPosition) / canvasScale,
              segmentIndex);
        }
      },
      child: CustomPaint(
        painter: linkPainter,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Visibility(
              visible: linkData.isItemSelected && isDeleteIconVisible,
              child: GestureDetector(
                onTap: () {
                  removeLink(linkData);
                },
                child: CustomPaint(
                  painter: DeleteIconPainter(
                    location: tapPosition * canvasScale + canvasPosition,
                    radius: 16,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            ...linkData.linkPoints
                .getRange(1, linkData.linkPoints.length - 1)
                .toList()
                .asMap()
                .map(
                  (index, jointPoint) => MapEntry(
                    index,
                    Visibility(
                      visible: linkData.isItemSelected,
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          setDeleteIconVisibility(false);
                          linkData.updateMiddlePoint(
                              (details.localPosition - canvasPosition) /
                                  canvasScale,
                              index + 1);
                        },
                        onLongPress: () {
                          setDeleteIconVisibility(false);
                          linkData.removeMiddlePoint(index + 1);
                        },
                        child: CustomPaint(
                          painter: LinkJointPainter(
                            location: jointPoint * canvasScale + canvasPosition,
                            radius: 8,
                            scale: canvasScale,
                            color: linkData.color.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          ],
        ),
      ),
    );
  }
}

class LinkPainter extends CustomPainter {
  final List<Offset> linkPoints;
  final double scale;
  final double width;
  final Color color;
  final double tipSize;

  LinkPainter({
    @required this.linkPoints,
    @required this.scale,
    @required this.width,
    @required this.color,
    @required this.tipSize,
  })  : assert(width > 0),
        assert(tipSize > 0);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = width * scale
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < linkPoints.length - 1; i++) {
      if (i == linkPoints.length - 2) {
        canvas.drawLine(
          linkPoints[i],
          getShorterLineEnd(linkPoints[i], linkPoints[i + 1], scale * 5),
          paint,
        );
      } else {
        canvas.drawLine(linkPoints[i], linkPoints[i + 1], paint);
      }
    }

    paint..style = PaintingStyle.fill;
    canvas.drawPath(
        getTriangleTipPath(
          linkPoints[linkPoints.length - 2],
          linkPoints[linkPoints.length - 1],
          tipSize,
        ),
        paint);

    // DEBUG:
    // paint
    //   ..color = Colors.red
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = scale * width / 5;
    // canvas.drawPath(makeWiderLinePath(scale * (5 + width)), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = makeWiderLinePath(scale * (5 + width));
    return path.contains(position);
  }

  Path makeWiderLinePath(double hitAreaWidth) {
    Path path = new Path();
    for (int i = 0; i < linkPoints.length - 1; i++) {
      var point1 = linkPoints[i];
      var point2 = linkPoints[i + 1];

      if (i == 0) point1 = getShorterLineStart(point1, point2, scale * 10);
      if (i == linkPoints.length - 2)
        point2 = getShorterLineEnd(point1, point2, scale * 10);

      path.addPath(
          getRectAroundLine(point1, point2, hitAreaWidth), Offset(0, 0));
    }
    return path;
  }

  Path getTriangleTipPath(Offset point1, Offset point2, double tipSize) {
    Offset left = point2 +
        normalizeVector(getPerpendicularVector(point1, point2)) *
            tipSize *
            scale -
        normalizeVector(getDirectionVector(point1, point2)) *
            2 *
            tipSize *
            scale;
    Offset right = point2 -
        normalizeVector(getPerpendicularVector(point1, point2)) *
            tipSize *
            scale -
        normalizeVector(getDirectionVector(point1, point2)) *
            2 *
            tipSize *
            scale;

    Path path = new Path();
    path.moveTo(point2.dx, point2.dy);
    path.lineTo(left.dx, left.dy);
    path.lineTo(right.dx, right.dy);
    path.close();
    return path;
  }

  Offset getDirectionVector(Offset point11, Offset point2) {
    return Offset((point2.dx - point11.dx), (point2.dy - point11.dy));
  }

  Offset getPerpendicularVector(Offset point11, Offset point2) {
    return Offset((point2.dy - point11.dy), -(point2.dx - point11.dx));
  }

  Offset normalizeVector(Offset vector) {
    return vector.distance == 0.0 ? vector : vector / vector.distance;
  }

  Offset getShorterLineStart(Offset point1, Offset point2, double shortening) {
    return point1 +
        normalizeVector(getDirectionVector(point1, point2)) * shortening;
  }

  Offset getShorterLineEnd(Offset point1, Offset point2, double shortening) {
    return point2 -
        normalizeVector(getDirectionVector(point1, point2)) * shortening;
  }

  int determineLinkSegmentIndex(Offset position, double hitAreaWidth) {
    for (int i = 0; i < linkPoints.length - 1; i++) {
      var point1 = linkPoints[i];
      var point2 = linkPoints[i + 1];

      Path rect = getRectAroundLine(point1, point2, hitAreaWidth);

      if (rect.contains(position)) {
        return i + 1;
      }
    }
    return null;
  }

  Path getRectAroundLine(Offset point1, Offset point2, rectWidth) {
    Path path = Path();
    Offset pnsv =
        normalizeVector(getPerpendicularVector(point1, point2)) * rectWidth;

    // rect around line
    path.moveTo(point1.dx + pnsv.dx, point1.dy + pnsv.dy);
    path.lineTo(point2.dx + pnsv.dx, point2.dy + pnsv.dy);
    path.lineTo(point2.dx - pnsv.dx, point2.dy - pnsv.dy);
    path.lineTo(point1.dx - pnsv.dx, point1.dy - pnsv.dy);
    path.close();

    return path;
  }
}

// ==== DELETE ICON ====

class DeleteIconPainter extends CustomPainter {
  final Offset location;
  final double radius;
  final Color color;

  DeleteIconPainter({
    @required this.location,
    @required this.radius,
    @required this.color,
  }) : assert(radius > 0);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(location, radius, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.grey[800]
      ..strokeWidth = 2;

    canvas.drawCircle(location, radius, paint);

    paint..color = color;

    var halfRadius = radius / 2;
    canvas.drawLine(
      location + Offset(-halfRadius, -halfRadius),
      location + Offset(halfRadius, halfRadius),
      paint,
    );

    canvas.drawLine(
      location + Offset(halfRadius, -halfRadius),
      location + Offset(-halfRadius, halfRadius),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = new Path();
    path.addOval(Rect.fromCircle(
      center: this.location,
      radius: radius,
    ));

    return path.contains(position);
  }
}

// ==== LINK JOINT ====

class LinkJointPainter extends CustomPainter {
  final Offset location;
  final double radius;
  final double scale;
  final Color color;

  LinkJointPainter({
    @required this.location,
    @required this.radius,
    @required this.scale,
    @required this.color,
  }) : assert(radius > 0);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(location, scale * radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = new Path();
    path.addOval(Rect.fromCircle(
      center: this.location,
      radius: scale * radius,
    ));

    return path.contains(position);
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:provider/provider.dart';

import 'model/link_data.dart';

class Link extends StatefulWidget {
  const Link({
    Key key,
  }) : super(key: key);

  @override
  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link> {
  @override
  Widget build(BuildContext context) {
    // print('LINE build');
    var canvasPosition = context
        .select<CanvasModel, Offset>((CanvasModel model) => model.position);
    var canvasScale =
        context.select<CanvasModel, double>((CanvasModel model) => model.scale);
    var linkData = Provider.of<LinkData>(context);

    return GestureDetector(
      onTap: () {
        print('link tapped');
      },
      child: CustomPaint(
        painter: LinkPainter(linkData.start, linkData.end, linkData.width,
            canvasPosition, canvasScale),
      ),
    );
  }
}

class LinkPainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final double width;
  final Offset canvasPosition;
  final double canvasScale;

  LinkPainter(
    this.start,
    this.end,
    this.width,
    this.canvasPosition,
    this.canvasScale,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = width * canvasScale
      ..style = PaintingStyle.stroke;

    canvas.drawLine(start * canvasScale + canvasPosition,
        end * canvasScale + canvasPosition, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = makeWiderLinePath(width * 1.5);

    return path.contains(position);
  }

  Path makeWiderLinePath(double k) {
    Path path = new Path();
    // perpendicularVector
    Offset pv = Offset((end.dx - start.dx), -(end.dy - start.dy));
    double normValue = sqrt((pv.dx * pv.dx) + (pv.dy * pv.dy));
    // perpendicularNormalizedScaledVector
    Offset pnsv = pv / normValue * k;
    // rect around line
    path.moveTo(start.dx + pnsv.dx, start.dy + pnsv.dy);
    path.lineTo(end.dx + pnsv.dx, end.dy + pnsv.dy);
    path.lineTo(end.dx - pnsv.dx, end.dy - pnsv.dy);
    path.lineTo(start.dx - pnsv.dx, start.dy - pnsv.dy);
    path.close();
    return path;
  }
}

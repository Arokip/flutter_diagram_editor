import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';

class CanvasScreenshot {
  dynamic _screenshotSelectedItem;
  Offset _screenshotPosition;
  double _screenshotScale;

  final CanvasModel model;

  CanvasScreenshot(this.model);

  _prepareCanvasForScreenshot(double scale) async {
    _screenshotSelectedItem = model.selectedItem;
    _screenshotPosition = model.position;
    _screenshotScale = model.scale;

    model.isTakingImage = true;

    model.selectDeselectItem();
    model.multipleSelection.turnOff();

    model.setCanvasData(model.position, scale);
  }

  _setScreenshotPosition(Offset position) {
    model.setCanvasData(position, model.scale);
    model.notifyCanvasModelListeners();
  }

  _resetCanvasAfterScreenshot() {
    model.selectedItem = _screenshotSelectedItem;
    model.setCanvasData(_screenshotPosition, _screenshotScale);

    model.isTakingImage = false;

    model.notifyCanvasModelListeners();
  }

  saveDiagramAsImage(File file, [double scale = 1.0, double edge = 0]) async {
    assert(edge >= 0);
    assert(scale <= model.maxScale && scale >= model.minScale);
    if (model.isTakingImage) return;

    _prepareCanvasForScreenshot(scale);

    RenderRepaintBoundary boundary =
        model.canvasGlobalKey.currentContext.findRenderObject();
    Rect diagramRect = _getDiagramRect(scale, edge);
    Size canvasSize = boundary.size - Offset(1, 1);

    int horizontal = (diagramRect.width / canvasSize.width).ceil();
    int vertical = (diagramRect.height / canvasSize.height).ceil();

    HashMap<Offset, ui.Image> positionImageMap = HashMap<Offset, ui.Image>();

    for (int i = 0; i < vertical; i++) {
      for (int j = 0; j < horizontal; j++) {
        var screenshotPosition =
            -Offset(canvasSize.width * j, canvasSize.height * i) -
                diagramRect.topLeft;
        _setScreenshotPosition(screenshotPosition);
        await SchedulerBinding.instance.endOfFrame.then((_) async {
          await _captureImage(boundary, screenshotPosition, positionImageMap);
        });
      }
    }

    _resetCanvasAfterScreenshot();

    var resultImage = await _mergeImages(diagramRect, positionImageMap);

    await _saveImageToFile(resultImage, file);
  }

  Future<void> _captureImage(RenderRepaintBoundary boundary, Offset position,
      HashMap<Offset, ui.Image> positionImageMap) async {
    ui.Image image = await boundary.toImage();
    positionImageMap[position] = image;
  }

  Future<ui.Image> _mergeImages(
      Rect diagramRect, HashMap<Offset, ui.Image> positionImageMap) {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final paint = Paint();
    Canvas canvas = Canvas(recorder);

    canvas.drawColor(model.canvasColor, BlendMode.srcOver);

    positionImageMap.forEach((position, image) {
      canvas.drawImage(image, -position - diagramRect.topLeft, paint);
    });

    return recorder.endRecording().toImage(
          diagramRect.width.ceil(),
          diagramRect.height.ceil(),
        );
  }

  _saveImageToFile(ui.Image image, File file) async {
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    await file.writeAsBytes(pngBytes);
  }

  Rect _getDiagramRect(double scale, double edge) {
    double mostTop = double.infinity;
    double mostBottom = double.negativeInfinity;
    double mostLeft = double.infinity;
    double mostRight = double.negativeInfinity;

    if (model.componentDataMap == null || model.componentDataMap.isEmpty) {
      if (edge <= 0) {
        return Rect.fromLTRB(0, 0, 1, 1);
      }
      return Rect.fromLTRB(0, 0, edge, edge);
    }

    model.componentDataMap.keys.forEach((componentId) {
      if (mostTop > model.componentDataMap[componentId].position.dy) {
        mostTop = model.componentDataMap[componentId].position.dy;
      }
      if (mostLeft > model.componentDataMap[componentId].position.dx) {
        mostLeft = model.componentDataMap[componentId].position.dx;
      }
      if (mostBottom <
          model.componentDataMap[componentId].position.dy +
              model.componentDataMap[componentId].size.height +
              model.componentDataMap[componentId].portSize) {
        mostBottom = model.componentDataMap[componentId].position.dy +
            model.componentDataMap[componentId].size.height +
            model.componentDataMap[componentId].portSize;
      }
      if (mostRight <
          model.componentDataMap[componentId].position.dx +
              model.componentDataMap[componentId].size.width +
              model.componentDataMap[componentId].portSize) {
        mostRight = model.componentDataMap[componentId].position.dx +
            model.componentDataMap[componentId].size.width +
            model.componentDataMap[componentId].portSize;
      }
    });
    model.linkDataMap.keys.forEach((linkId) {
      model.linkDataMap[linkId].linkPoints.forEach((point) {
        if (mostTop > point.dy) {
          mostTop = point.dy;
        }
        if (mostLeft > point.dx) {
          mostLeft = point.dx;
        }
        if (mostBottom < point.dy) {
          mostBottom = point.dy;
        }
        if (mostRight < point.dx) {
          mostRight = point.dx;
        }
      });
    });
    return Rect.fromLTRB(
      scale * mostLeft - edge,
      scale * mostTop - edge,
      scale * mostRight + edge,
      scale * mostBottom + edge,
    );
  }
}

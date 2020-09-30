import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:provider/provider.dart';

class ResetViewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CanvasModel>(
      builder: (_, canvasData, __) {
        return IconButton(
          color: Colors.white,
          onPressed: () {
            canvasData.resetCanvasView();
          },
          tooltip: 'Reset',
          icon: const Icon(Icons.replay),
        );
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class SaveAsImageButton extends StatelessWidget {
  final double size;
  final Color color;
  final Color iconColor;

  const SaveAsImageButton({
    Key key,
    this.size = 48,
    this.color = const Color(0x44000000),
    this.iconColor = Colors.white,
  })  : assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CanvasModel>(
      builder: (_, canvasModel, __) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            color: iconColor,
            onPressed: () async {
              if (kIsWeb) {
                print('save as image is not functional on web');
              } else {
                print('not web');
                String dir = (await getExternalStorageDirectory()).path;
                String filePath = '$dir/${Uuid().v4()}.png';
                canvasModel.saveDiagramAsImage(filePath, 2.0, 32);
              }
            },
            tooltip: 'Save as image (only mobile)',
            icon: const Icon(Icons.image),
          ),
        );
      },
    );
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor/graphml/graphml_deserializer.dart';
import 'package:flutter_diagram_editor/diagram_editor_library/model/canvas_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class LoadDiagramFromGraphmlButton extends StatelessWidget {
  final double size;
  final Color color;
  final Color iconColor;

  const LoadDiagramFromGraphmlButton({
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
                print('load web');
                FilePickerResult result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['graphml'],
                );
                if (result != null) {
                  var fileString =
                      String.fromCharCodes(result.files.single.bytes);

                  canvasModel.resetCanvasView();
                  GraphmlDeserializer.buildDiagramFromXml(
                      fileString, canvasModel);
                }
              } else {
                print('load not web');
                List<File> filesInDirectory = [];
                var entities = (await getExternalStorageDirectory()).listSync();
                entities.forEach((entity) {
                  if (entity is File) {
                    if (entity.path.split('.')?.last == 'graphml') {
                      filesInDirectory.add(entity);
                    }
                  }
                });

                showFiles(context, filesInDirectory, canvasModel);
              }
            },
            tooltip: 'Load from GraphML',
            icon: const Icon(Icons.drive_folder_upload),
          ),
        );
      },
    );
  }

  showFiles(BuildContext context, List<File> files, CanvasModel model) {
    showDialog(
      barrierDismissible: false,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            children: [
              ...files
                  .map(
                    (file) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(2),
                      child: GestureDetector(
                        onTap: () {
                          model.resetCanvasView();
                          GraphmlDeserializer.buildDiagramFromXml(
                              file.readAsStringSync(), model);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          color: Colors.grey[200],
                          child: Text(
                              '${file.path.split(Platform.pathSeparator)?.last}'),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
          scrollable: true,
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'editor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter canvas',
      home: Editor(),
    );
  }
}

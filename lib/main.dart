import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/editor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true,
      title: 'Diagram editor',
      home: SafeArea(
        child: Scaffold(
          body: Editor(),
        ),
      ),
    );
  }
}

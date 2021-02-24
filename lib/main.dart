import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor/editor.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_editor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true,
      title: 'Diagram editor',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/editor_app': (context) => EditorApp(),
        '/etl_editor_app': (context) => EtlEditorApp(),
        '/demo_app': (context) => DemoApp(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Editor'),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/editor_app');
                },
              ),
              SizedBox(height: 8),
              RaisedButton(
                child: Text('ETL'),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/etl_editor_app');
                },
              ),
              SizedBox(height: 8),
              RaisedButton(
                child: Text('Another demo'),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/demo_app');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Editor(),
      ),
    );
  }
}

class EtlEditorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: EtlEditor(),
      ),
    );
  }
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.red,
          child: Center(
            child: RaisedButton(
              color: Colors.blue,
              child: Text('return'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
    );
  }
}

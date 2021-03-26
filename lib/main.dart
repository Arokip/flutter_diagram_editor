import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/architecture/architecture.dart';
import 'package:flutter_diagram_editor/architecture_merge/architecture_merge.dart';
import 'package:flutter_diagram_editor/diagram_editor/editor.dart';
import 'package:flutter_diagram_editor/etl_editor/etl_editor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      title: 'Diagram editor',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/editor_app': (context) => EditorApp(),
        '/etl_editor_app': (context) => EtlEditorApp(),
        '/architecture': (context) => ArchitectureApp(),
        '/architecture_merge': (context) => ArchitectureMergeApp(),
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
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('Editor'),
                onPressed: () {
                  Navigator.pushNamed(context, '/editor_app');
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('ETL'),
                onPressed: () {
                  Navigator.pushNamed(context, '/etl_editor_app');
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('Architecture'),
                onPressed: () {
                  Navigator.pushNamed(context, '/architecture');
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('Architecture merge'),
                onPressed: () {
                  Navigator.pushNamed(context, '/architecture_merge');
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('Another demo'),
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

class ArchitectureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Architecture(),
      ),
    );
  }
}

class ArchitectureMergeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ArchitectureEditorMerge(),
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
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: Text('return'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
    );
  }
}

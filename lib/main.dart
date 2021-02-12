import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diagram_editor/diagram_editor/editor.dart';

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
                child: Text('Demo'),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/demo_app');
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

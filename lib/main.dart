import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Opacity Demo';
    return const MaterialApp(
      title: appTitle,
      home: AppHomePage(title: appTitle),
    );
  }
}

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _AppHomePageState createState() => _AppHomePageState();
  final String title;
}

class _AppHomePageState extends State<AppHomePage> {
//Whether the greenbox shouild be visible.
  bool _visible = true;
  final double _containerValue = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade300,
          title: Text(widget.title),
        ),
        body: Center(
          child: AnimatedOpacity(
            // If the widget is visible, animate to 0.0 (invisible)
            // If the widget is hidden, animate to 1.0 (fully visible)
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            // The box is a child of the AnimatedOpacity
            child: Container(
              width: _containerValue,
              height: _containerValue,
              color: Colors.purple,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Call setState. This tells Flutter to rebuild the UI with the changes.
            setState(() {
              _visible = !_visible;
            });
          },
          tooltip: 'Toggle Opacity',
          backgroundColor: Colors.purple.shade300,
          child: const Icon(
            Icons.flip,
          ),
        ));
  }
}

import 'package:flutter/material.dart';

import 'home.dart';

class ShowkaseApp extends StatefulWidget {
  const ShowkaseApp({
    this.lightTheme,
    this.darkTheme,
  });

  final ThemeData lightTheme;
  final ThemeData darkTheme;

  @override
  _ShowkaseAppState createState() => _ShowkaseAppState();
}

class _ShowkaseAppState extends State<ShowkaseApp> {
  bool _isLight = true;

  void _toggleTheme() {
    setState(() {
      _isLight = !_isLight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: widget.lightTheme,
      darkTheme: widget.darkTheme,
      themeMode: _isLight ? ThemeMode.light : ThemeMode.dark,
      home: ShowkaseHome(),
    );
  }
}

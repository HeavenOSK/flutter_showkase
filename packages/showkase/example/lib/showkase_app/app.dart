import 'package:flutter/material.dart';

import 'home/home.dart';
import 'theme_provider.dart';

class ShowkaseApp extends StatefulWidget {
  const ShowkaseApp({
    this.lightTheme,
    this.darkTheme,
  });

  final ThemeData lightTheme;
  final ThemeData darkTheme;

  static ShowkaseAppState of(BuildContext context) =>
      context.findAncestorStateOfType<ShowkaseAppState>();

  @override
  ShowkaseAppState createState() => ShowkaseAppState();
}

class ShowkaseAppState extends State<ShowkaseApp> {
  bool _isLight = true;

  void toggleTheme() {
    setState(() {
      _isLight = !_isLight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      isLight: _isLight,
      child: MaterialApp(
        theme: widget.lightTheme,
        darkTheme: widget.darkTheme,
        themeMode: _isLight ? ThemeMode.light : ThemeMode.dark,
        home: ShowkaseHome(),
      ),
    );
  }
}

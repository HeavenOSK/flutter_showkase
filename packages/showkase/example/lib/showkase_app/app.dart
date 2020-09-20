import 'package:flutter/material.dart';

import 'home/home.dart';
import 'model/model.dart';
import 'showkase_theme_provider.dart';

class ShowkaseApp extends StatefulWidget {
  const ShowkaseApp({
    this.lightTheme,
    this.darkTheme,
    this.components,
  });

  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final List<ShowkaseComponent> components;

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
    return ShowkaseThemeProvider(
      isLight: _isLight,
      child: MaterialApp(
        theme: widget.lightTheme,
        darkTheme: widget.darkTheme,
        themeMode: _isLight ? ThemeMode.light : ThemeMode.dark,
        home: ShowkaseHome(
          components: widget.components,
        ),
      ),
    );
  }
}

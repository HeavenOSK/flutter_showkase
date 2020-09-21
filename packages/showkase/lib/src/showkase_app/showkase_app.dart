import 'package:flutter/material.dart';

import '../interface/interface.dart';
import 'model/model.dart';
import 'pages/home/home.dart';
import 'providers/providers.dart';

class ShowkaseApp extends StatefulWidget {
  const ShowkaseApp({
    @required this.theme,
    this.components,
  });

  final ShowkasedTheme theme;
  final List<ShowkasedComponent> components;

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
        theme: widget.theme.theme,
        darkTheme: widget.theme.darkTheme,
        themeMode: _isLight ? ThemeMode.light : ThemeMode.dark,
        home: ShowkaseHome(
          components: widget.components?.map((c) {
            return ShowkaseComponent.fromShowkased(c);
          })?.toList(),
        ),
      ),
    );
  }
}

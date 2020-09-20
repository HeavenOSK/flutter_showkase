import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    @required this.isLight,
    @required Widget child,
    Key key,
  })  : assert(child != null),
        super(key: key, child: child);

  final bool isLight;

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
  }

  @override
  bool updateShouldNotify(ThemeProvider old) => old.isLight != isLight;
}

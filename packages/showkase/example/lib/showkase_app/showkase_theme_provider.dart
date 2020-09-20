import 'package:flutter/material.dart';

class ShowkaseThemeProvider extends InheritedWidget {
  const ShowkaseThemeProvider({
    @required this.isLight,
    @required Widget child,
    Key key,
  })  : assert(child != null),
        super(key: key, child: child);

  final bool isLight;

  static ShowkaseThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShowkaseThemeProvider>();
  }

  @override
  bool updateShouldNotify(ShowkaseThemeProvider old) => old.isLight != isLight;
}

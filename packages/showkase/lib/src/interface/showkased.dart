import 'package:flutter/material.dart';

class ShowkasedTheme {
  const ShowkasedTheme({
    @required this.theme,
    this.darkTheme,
  }) : assert(theme != null);

  final ThemeData theme;
  final ThemeData darkTheme;
}

class ShowkasedComponent {
  ShowkasedComponent({
    @required this.name,
    this.groupName,
    @required this.component,
  })  : assert(name != null),
        assert(component != null);

  final String name;
  final String groupName;
  final Widget component;
}

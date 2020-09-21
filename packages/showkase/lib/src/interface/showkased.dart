import 'package:flutter/material.dart';

abstract class Showkased {
  factory Showkased.theme({
    @required ThemeData theme,
    ThemeData darkTheme,
  }) =>
      ShowkasedTheme._(
        theme: theme,
        darkTheme: darkTheme,
      );

  factory Showkased.component({
    @required String name,
    String groupName,
    @required List<Widget> components,
  }) =>
      ShowkasedComponent._(
        name: name,
        groupName: groupName,
        components: components,
      );
}

class ShowkasedTheme with Showkased {
  const ShowkasedTheme._({
    @required this.theme,
    this.darkTheme,
  }) : assert(theme != null);

  final ThemeData theme;
  final ThemeData darkTheme;
}

class ShowkasedComponent with Showkased {
  ShowkasedComponent._({
    @required this.name,
    this.groupName,
    @required this.components,
  })  : assert(name != null),
        assert(components != null);

  final String name;
  final String groupName;
  final List<Widget> components;
}

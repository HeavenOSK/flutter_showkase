import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';
import 'home_for_large_screen/home_for_large_screen.dart';
import 'home_for_small_screen/home_for_small_screen.dart';
import 'showkase_group_extensions.dart';

const _screenBoundary = 960.0;

class ShowkaseHome extends StatelessWidget {
  const ShowkaseHome({
    List<ShowkaseComponent> components,
    Key key,
  })  : components = components ?? const [],
        super(key: key);

  final List<ShowkaseComponent> components;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final groupNames = components.map((c) => c.group).toSet();
    final componentGroups = groupNames.map((name) {
      return ShowkaseGroup<ShowkaseComponent>(
        name,
        items: components.where((c) => c.group == name).toList(),
      );
    }).toList();

    if (MediaQuery.of(context).size.width < _screenBoundary) {
      return HomeForSmallScreen();
    } else {
      return HomeForLargeScreen(
        colorGroup: theme.colorGroup,
        colorSchemeGroup: theme.colorSchemeGroup,
        textThemeGroup: theme.textThemeGroup,
        componentGroups: componentGroups,
      );
    }
  }
}

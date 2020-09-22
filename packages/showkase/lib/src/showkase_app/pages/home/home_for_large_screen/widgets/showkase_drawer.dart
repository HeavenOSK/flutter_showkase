import 'package:flutter/material.dart';

import '../../../../providers/providers.dart';
import '../../../../showkase_app.dart';

typedef OnTapContentMenu = void Function(String groupName);

class ShowkaseDrawer extends StatelessWidget {
  const ShowkaseDrawer({
    Key key,
    @required this.groupNames,
    @required this.onTapAll,
    @required this.onTapGroup,
  }) : super(key: key);

  final List<String> groupNames;
  final VoidCallback onTapAll;
  final OnTapContentMenu onTapGroup;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      elevation: 0,
      child: ListView(
        children: [
          DarkModeSwitch(),
          Divider(),
          ListTile(
            title: Text('All Items'),
            onTap: onTapAll,
          ),
          Divider(),
          ListTile(
            title: Text(
              'Groups',
              style: theme.textTheme.subtitle2.copyWith(
                color: theme.textTheme.caption.color,
              ),
            ),
          ),
          ...groupNames.map((groupName) {
            return ListTile(
              title: Text(groupName ?? ''),
              onTap: () {
                onTapGroup?.call(groupName);
              },
            );
          })
        ],
      ),
    );
  }
}

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch();

  @override
  Widget build(BuildContext context) {
    final app = ShowkaseApp.of(context);
    final isLight = ShowkaseThemeProvider.of(context).isLight;
    return ListTile(
      title: Text('Dark Mode'),
      trailing: Switch(
        onChanged: (bool value) {
          app.toggleTheme();
        },
        value: !isLight,
      ),
    );
  }
}

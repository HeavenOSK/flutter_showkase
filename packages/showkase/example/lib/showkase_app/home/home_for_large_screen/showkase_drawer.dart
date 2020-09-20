import 'package:example/showkase_app/app.dart';
import 'package:example/showkase_app/home/home_for_large_screen/home_for_large_screen.dart';
import 'package:example/showkase_app/showkase_theme_provider.dart';
import 'package:flutter/material.dart';

import '../home.dart';

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
    return Drawer(
      elevation: 0,
      child: ListView(
        children: [
          DarkModeSwitch(),
          Divider(),
          ListTile(
            title: Text('All'),
            onTap: onTapAll,
          ),
          Divider(),
          ...groupNames.map((groupName) {
            return ListTile(
              title: Text(groupName),
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
      title: Text('Dark mode'),
      trailing: Switch(
        onChanged: (bool value) {
          app.toggleTheme();
        },
        value: !isLight,
      ),
    );
  }
}

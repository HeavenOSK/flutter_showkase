import 'package:example/showkase_app/app.dart';
import 'package:example/showkase_app/home/home_for_large_screen.dart';
import 'package:example/showkase_app/theme_provider.dart';
import 'package:flutter/material.dart';

import 'home.dart';

typedef OnTapContentMenu = void Function(List<HomeScreenContent> contents);

class ShowkaseDrawer extends StatelessWidget {
  const ShowkaseDrawer({
    Key key,
    @required this.contents,
    @required this.onTapContentMenu,
  }) : super(key: key);

  final List<HomeScreenContent> contents;
  final OnTapContentMenu onTapContentMenu;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      child: ListView(
        children: [
          DarkModeSwitch(),
          Divider(),
          ListTile(
            title: Text('All'),
            onTap: () {
              onTapContentMenu?.call(contents);
            },
          ),
          Divider(),
          ...contents.map((content) {
            return ListTile(
              title: Text(content.title),
              onTap: () {
                onTapContentMenu?.call([content]);
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
    final isLight = ThemeProvider.of(context).isLight;
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

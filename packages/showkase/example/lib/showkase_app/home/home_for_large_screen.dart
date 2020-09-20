import 'package:example/showkase_app/home/home.dart';
import 'package:example/showkase_app/model/showkase_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recase/recase.dart';

import '../app.dart';
import '../theme_provider.dart';
import 'color_scheme_palette.dart';
import 'colors_sliver_grid.dart';
import 'component_group.dart';
import 'showkase_drawer.dart';
import 'single_child_sliver.dart';
import 'title_sliver.dart';

extension _HomeForLargeScreenContent on HomeScreenContent {
  Widget get content {
    switch (this) {
      case HomeScreenContent.colorScheme:
        return ColorSchemeSliverList();
      case HomeScreenContent.colors:
        return ColorsSliverGrid();
      case HomeScreenContent.textTheme:
        return SingleChildSliver(child: SizedBox.shrink());
      case HomeScreenContent.components:
        return SingleChildSliver(child: SizedBox.shrink());
    }
    return SingleChildSliver(child: SizedBox.shrink());
  }
}

class HomeForLargeScreen extends StatefulWidget {
  const HomeForLargeScreen();

  @override
  _HomeForLargeScreenState createState() => _HomeForLargeScreenState();
}

class _HomeForLargeScreenState extends State<HomeForLargeScreen> {
  List<HomeScreenContent> _visibleContents;

  @override
  void initState() {
    super.initState();
    _visibleContents = HomeScreenContent.values;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Showkase'),
      ),
      body: Row(
        children: [
          ShowkaseDrawer(
            contents: HomeScreenContent.values,
            onTapContentMenu: (selectedContents) {
              if (selectedContents?.isNotEmpty ?? false) {
                setState(() {
                  _visibleContents = selectedContents;
                });
              }
            },
          ),
          Expanded(
            child: CustomScrollView(
              slivers: _visibleContents.fold<Iterable<Widget>>(
                  <Widget>[],
                  (prev, content) => [
                        ...prev,
                        SliverTitle(
                          title: content.title,
                        ),
                        content.content,
                      ]).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

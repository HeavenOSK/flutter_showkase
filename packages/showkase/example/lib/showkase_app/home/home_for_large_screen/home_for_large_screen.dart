import 'package:example/paddings.dart';
import 'package:example/showkase_app/home/home.dart';
import 'package:example/showkase_app/model/model.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recase/recase.dart';

import '../../app.dart';
import '../../showkase_theme_provider.dart';
import 'color_scheme_sliver_list.dart';
import 'colors_sliver_grid.dart';
import 'component_sliver_grid.dart';
import 'showkase_drawer.dart';
import 'single_child_sliver.dart';
import 'text_theme_sliver_list.dart';
import 'title_sliver.dart';
import '../showkase_group_extensions.dart';

enum _Mode {
  keywordSearch,
  groupSearch,
}

extension _IsKeywordSearch on _Mode {
  bool get isKeywordSearch => this == _Mode.keywordSearch;
}

class HomeForLargeScreen extends StatefulWidget {
  const HomeForLargeScreen({
    @required this.colorSchemeGroup,
    @required this.colorGroup,
    @required this.textThemeGroup,
    @required this.componentGroups,
  });

  final ShowkaseGroup<ShowkaseColorScheme> colorSchemeGroup;
  final ShowkaseGroup<ShowkaseColor> colorGroup;
  final ShowkaseGroup<ShowkaseTextTheme> textThemeGroup;
  final List<ShowkaseGroup<ShowkaseComponent>> componentGroups;

  @override
  _HomeForLargeScreenState createState() => _HomeForLargeScreenState();
}

class _HomeForLargeScreenState extends State<HomeForLargeScreen> {
  List<String> _visibleGroupNames;
  _Mode _mode;

  TextEditingController _searchController = TextEditingController();
  FocusNode _searchNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _mode = _Mode.groupSearch;
    _visibleGroupNames = _defaultGroupNames;
    _searchController.addListener(() {
      if (_searchController.text.isNotEmpty) {
        _mode = _Mode.keywordSearch;
      }
      setState(() {});
    });
  }

  List<String> get _defaultGroupNames => [
        widget.colorSchemeGroup.name,
        widget.colorGroup.name,
        widget.textThemeGroup.name,
        ...widget.componentGroups.map((cg) => cg.name),
      ];

  void _unFocus() {
    if (_searchNode.hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final slivers = List<Widget>();

    if (_mode.isKeywordSearch) {
      final keyword = _searchController.text.toLowerCase();
      final colorSchemes = widget.colorSchemeGroup.items.where((cs) {
        return cs.keywords.where((kw) => kw.contains(keyword)).isNotEmpty;
      }).toList();
      if (colorSchemes.isNotEmpty) {
        slivers.addAll([
          SliverTitle(title: widget.colorSchemeGroup.name),
          ColorSchemeSliverList(
            colorSchemes: colorSchemes,
          ),
        ]);
      }
      final colors = widget.colorGroup.items.where((color) {
        return color.keywords.where((kw) => kw.contains(keyword)).isNotEmpty;
      }).toList();
      if (colors.isNotEmpty) {
        slivers.addAll([
          SliverTitle(title: widget.colorGroup.name),
          ColorsSliverGrid(colors: colors),
        ]);
      }
      final textStyles = widget.textThemeGroup.items.where((cs) {
        return cs.keywords.where((kw) => kw.contains(keyword)).isNotEmpty;
      }).toList();
      if (textStyles.isNotEmpty) {
        slivers.addAll([
          SliverTitle(title: widget.textThemeGroup.name),
          TextThemeSliverList(
            textStyles: textStyles,
          ),
        ]);
      }
      for (final componentGroup in widget.componentGroups) {
        final components = componentGroup.items.where((cs) {
          return cs.keywords.where((kw) => kw.contains(keyword)).isNotEmpty;
        }).toList();
        if (components.isNotEmpty) {
          slivers.addAll([
            SliverTitle(title: componentGroup.name),
            ComponentsGridSliver(
              components: components,
            ),
          ]);
        }
      }
    } else {
      if (_visibleGroupNames.contains(widget.colorSchemeGroup.name)) {
        slivers.addAll([
          SliverTitle(title: widget.colorSchemeGroup.name),
          ColorSchemeSliverList(
            colorSchemes: widget.colorSchemeGroup.items,
          ),
        ]);
      }
      if (_visibleGroupNames.contains(widget.colorGroup.name)) {
        slivers.addAll([
          SliverTitle(title: widget.colorGroup.name),
          ColorsSliverGrid(colors: widget.colorGroup.items),
        ]);
      }
      if (_visibleGroupNames.contains(widget.textThemeGroup.name)) {
        slivers.addAll([
          SliverTitle(title: widget.textThemeGroup.name),
          TextThemeSliverList(
            textStyles: widget.textThemeGroup.items,
          ),
        ]);
      }
      for (final componentGroup in widget.componentGroups) {
        if (_visibleGroupNames.contains(componentGroup.name)) {
          slivers.addAll([
            SliverTitle(title: componentGroup.name),
            ComponentsGridSliver(
              components: componentGroup.items,
            ),
          ]);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Showkase')),
      body: Row(
        children: [
          ShowkaseDrawer(
            groupNames: _defaultGroupNames,
            onTapAll: () {
              setState(() {
                _mode = _Mode.groupSearch;
                _searchController.text = '';
                _visibleGroupNames = _defaultGroupNames;
              });
              _unFocus();
            },
            onTapGroup: (selectedContents) {
              if (selectedContents?.isNotEmpty ?? false) {
                setState(() {
                  _mode = _Mode.groupSearch;
                  _visibleGroupNames = [selectedContents];
                  _searchController.text = '';
                });
                _unFocus();
              }
            },
          ),
          VerticalDivider(),
          Expanded(
            child: Scaffold(
              body: Column(
                children: [
                  SearchTextField(
                    focusNode: _searchNode,
                    controller: _searchController,
                  ),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        ...slivers,
                        _spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildSliver _spacer() =>
      SingleChildSliver(child: const SizedBox(height: 400));
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    @required this.controller,
    @required this.focusNode,
    Key key,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(mediumPadding),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        maxLines: 1,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          hintText: 'Search from all items',
        ),
      ),
    );
  }
}

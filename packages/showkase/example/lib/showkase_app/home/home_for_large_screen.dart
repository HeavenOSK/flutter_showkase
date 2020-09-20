import 'package:example/showkase_app/home/home.dart';
import 'package:example/showkase_app/model/model.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recase/recase.dart';

import '../app.dart';
import '../theme_provider.dart';
import 'color_scheme_palette.dart';
import 'colors_sliver_grid.dart';
import 'showkase_drawer.dart';
import 'single_child_sliver.dart';
import 'text_theme_sliver_list.dart';
import 'title_sliver.dart';

extension ShowkaseGroupsExtension on ThemeData {
  ShowkaseGroup<ShowkaseColorScheme> get colorSchemeGroup {
    return ShowkaseGroup<ShowkaseColorScheme>(
      'ColorScheme',
      items: [
        ShowkaseColorScheme(
          color: ShowkaseColor('primary', this.colorScheme.primary),
          variantColor:
              ShowkaseColor('primaryVariant', this.colorScheme.primaryVariant),
          onColor: ShowkaseColor('onPrimary', this.colorScheme.onPrimary),
        ),
        ShowkaseColorScheme(
          color: ShowkaseColor('secondary', this.colorScheme.secondary),
          variantColor: ShowkaseColor(
              'secondaryVariant', this.colorScheme.secondaryVariant),
          onColor: ShowkaseColor('onSecondary', this.colorScheme.onSecondary),
        ),
        ShowkaseColorScheme(
          color: ShowkaseColor('surface', this.colorScheme.surface),
          onColor: ShowkaseColor('onSurface', this.colorScheme.onSurface),
        ),
        ShowkaseColorScheme(
          color: ShowkaseColor('background', this.colorScheme.background),
          onColor: ShowkaseColor('onBackground', this.colorScheme.onBackground),
        ),
        ShowkaseColorScheme(
          color: ShowkaseColor('error', this.colorScheme.error),
          onColor: ShowkaseColor('onError', this.colorScheme.onError),
        ),
      ],
    );
  }

  ShowkaseGroup<ShowkaseColor> get colorGroup {
    return ShowkaseGroup<ShowkaseColor>(
      'Color',
      items: [
        ShowkaseColor('primaryColor', this.primaryColor),
        ShowkaseColor('primaryColorLight', this.primaryColorLight),
        ShowkaseColor('primaryColorDark', this.primaryColorDark),
        ShowkaseColor('canvasColor', this.canvasColor),
        ShowkaseColor('accentColor', this.accentColor),
        ShowkaseColor('scaffoldBackgroundColor', this.scaffoldBackgroundColor),
        ShowkaseColor('bottomAppBarColor', this.bottomAppBarColor),
        ShowkaseColor('cardColor', this.cardColor),
        ShowkaseColor('dividerColor', this.dividerColor),
        ShowkaseColor('focusColor', this.focusColor),
        ShowkaseColor('hoverColor', this.hoverColor),
        ShowkaseColor('highlightColor', this.highlightColor),
        ShowkaseColor('splashColor', this.splashColor),
        ShowkaseColor('selectedRowColor', this.selectedRowColor),
        ShowkaseColor('unselectedWidgetColor', this.unselectedWidgetColor),
        ShowkaseColor('disabledColor', this.disabledColor),
        ShowkaseColor('buttonColor', this.buttonColor),
        ShowkaseColor('secondaryHeaderColor', this.secondaryHeaderColor),
        ShowkaseColor('textSelectionColor', this.textSelectionColor),
        ShowkaseColor('cursorColor', this.cursorColor),
        ShowkaseColor(
            'textSelectionHandleColor', this.textSelectionHandleColor),
        ShowkaseColor('backgroundColor', this.backgroundColor),
        ShowkaseColor('dialogBackgroundColor', this.dialogBackgroundColor),
        ShowkaseColor('indicatorColor', this.indicatorColor),
        ShowkaseColor('hintColor', this.hintColor),
        ShowkaseColor('errorColor', this.errorColor),
        ShowkaseColor('toggleableActiveColor', this.toggleableActiveColor),
      ],
    );
  }

  ShowkaseGroup<ShowkaseTextStyle> get textThemeGroup {
    final textTheme = this.textTheme;
    return ShowkaseGroup<ShowkaseTextStyle>(
      'TextTheme',
      items: [
        ShowkaseTextStyle('headline1', textTheme.headline1),
        ShowkaseTextStyle('headline2', textTheme.headline2),
        ShowkaseTextStyle('headline3', textTheme.headline3),
        ShowkaseTextStyle('headline4', textTheme.headline4),
        ShowkaseTextStyle('headline5', textTheme.headline5),
        ShowkaseTextStyle('headline6', textTheme.headline6),
        ShowkaseTextStyle('subtitle1', textTheme.subtitle1),
        ShowkaseTextStyle('subtitle2', textTheme.subtitle2),
        ShowkaseTextStyle('bodyText1', textTheme.bodyText1),
        ShowkaseTextStyle('bodyText2', textTheme.bodyText2),
        ShowkaseTextStyle('caption', textTheme.caption),
        ShowkaseTextStyle('button', textTheme.button),
        ShowkaseTextStyle('overline', textTheme.overline),
      ],
    );
  }
}

class HomeForLargeScreen extends StatefulWidget {
  const HomeForLargeScreen();

  @override
  _HomeForLargeScreenState createState() => _HomeForLargeScreenState();
}

class _HomeForLargeScreenState extends State<HomeForLargeScreen> {
  List<String> _visibleGroupNames = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorSchemeGroup = theme.colorSchemeGroup;
    final colorGroup = theme.colorGroup;
    final textThemeGroup = theme.textThemeGroup;

    return Scaffold(
      appBar: AppBar(
        title: Text('Showkase'),
      ),
      body: Row(
        children: [
          ShowkaseDrawer(
            contents: [
              colorSchemeGroup.name,
              colorGroup.name,
              textThemeGroup.name,
            ],
            onTapContentMenu: (selectedContents) {},
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverTitle(title: colorSchemeGroup.name),
                ColorSchemeSliverList(
                  colorSchemes: colorSchemeGroup.items,
                ),
                SliverTitle(title: colorGroup.name),
                ColorsSliverGrid(colors: colorGroup.items),
                SliverTitle(title: textThemeGroup.name),
                TextThemeSliverList(
                  textStyles: textThemeGroup.items,
                ),
                _spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SingleChildSliver _spacer() =>
      SingleChildSliver(child: const SizedBox(height: 400));
}

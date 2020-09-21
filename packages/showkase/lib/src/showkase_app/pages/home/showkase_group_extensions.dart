import 'package:flutter/material.dart';

import '../../model/model.dart';

extension ShowkaseGroupsExtension on ThemeData {
  ShowkaseGroup<ShowkaseColorScheme> get colorSchemeGroup {
    return ShowkaseGroup<ShowkaseColorScheme>(
      'ColorScheme',
      items: [
        ShowkaseColorScheme(
          color: ShowkaseColorSchemeColor('primary', this.colorScheme.primary),
          variantColor: ShowkaseColorSchemeColor(
              'primaryVariant', this.colorScheme.primaryVariant),
          onColor:
              ShowkaseColorSchemeColor('onPrimary', this.colorScheme.onPrimary),
        ),
        ShowkaseColorScheme(
          color:
              ShowkaseColorSchemeColor('secondary', this.colorScheme.secondary),
          variantColor: ShowkaseColorSchemeColor(
              'secondaryVariant', this.colorScheme.secondaryVariant),
          onColor: ShowkaseColorSchemeColor(
              'onSecondary', this.colorScheme.onSecondary),
        ),
        ShowkaseColorScheme(
          color: ShowkaseColorSchemeColor('surface', this.colorScheme.surface),
          onColor:
              ShowkaseColorSchemeColor('onSurface', this.colorScheme.onSurface),
        ),
        ShowkaseColorScheme(
          color: ShowkaseColorSchemeColor(
              'background', this.colorScheme.background),
          onColor: ShowkaseColorSchemeColor(
              'onBackground', this.colorScheme.onBackground),
        ),
        ShowkaseColorScheme(
          color: ShowkaseColorSchemeColor('error', this.colorScheme.error),
          onColor:
              ShowkaseColorSchemeColor('onError', this.colorScheme.onError),
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

  ShowkaseGroup<ShowkaseTextTheme> get textThemeGroup {
    final textTheme = this.textTheme;
    return ShowkaseGroup<ShowkaseTextTheme>(
      'TextTheme',
      items: [
        ShowkaseTextTheme('headline1', textTheme.headline1),
        ShowkaseTextTheme('headline2', textTheme.headline2),
        ShowkaseTextTheme('headline3', textTheme.headline3),
        ShowkaseTextTheme('headline4', textTheme.headline4),
        ShowkaseTextTheme('headline5', textTheme.headline5),
        ShowkaseTextTheme('headline6', textTheme.headline6),
        ShowkaseTextTheme('subtitle1', textTheme.subtitle1),
        ShowkaseTextTheme('subtitle2', textTheme.subtitle2),
        ShowkaseTextTheme('bodyText1', textTheme.bodyText1),
        ShowkaseTextTheme('bodyText2', textTheme.bodyText2),
        ShowkaseTextTheme('caption', textTheme.caption),
        ShowkaseTextTheme('button', textTheme.button),
        ShowkaseTextTheme('overline', textTheme.overline),
      ],
    );
  }
}

import 'package:example/paddings.dart';
import 'package:example/showkase_app/model/showkase_text_style.dart';
import 'package:flutter/material.dart';

extension _DisplayColors on ThemeData {
  List<ShowkaseTextStyle> get displayTextStyles {
    final textTheme = this.textTheme;
    return [
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
    ];
  }
}

class TextThemeSliverList extends StatelessWidget {
  const TextThemeSliverList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: mediumPadding,
        horizontal: mediumPadding,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate.fixed(
          theme.displayTextStyles.map((style) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                style.name,
                style: style.value,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

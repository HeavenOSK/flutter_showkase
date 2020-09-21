import 'package:example/paddings.dart';
import 'package:example/showkase_app/model/showkase_color.dart';
import 'package:example/showkase_app/model/showkase_group.dart';
import 'package:example/showkase_app/widgets/copier_on_tap.dart';
import 'package:flutter/material.dart';

extension _DisplayColors on ThemeData {
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

  List<ShowkaseColor> get displayColors => [
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
      ];
}

class ColorsSliverGrid extends StatelessWidget {
  const ColorsSliverGrid({
    @required this.colors,
  });

  final List<ShowkaseColor> colors;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: mediumPadding),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: smallPadding,
          mainAxisSpacing: smallPadding,
          childAspectRatio: 1,
        ),
        delegate: SliverChildListDelegate(
          [
            for (final color in colors)
              ColorGridItem(
                color: color,
              )
          ],
        ),
      ),
    );
  }
}

class ColorGridItem extends StatelessWidget {
  const ColorGridItem({
    @required this.color,
    Key key,
  }) : super(key: key);

  final ShowkaseColor color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = color.value.computeLuminance() < 0.5;
    final onColor = isLight ? Colors.white : Colors.black;
    return CopierOnTap(
      targetContent: color.copyContent,
      child: Card(
        child: Container(
          color: color.value,
          padding: EdgeInsets.all(8),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  color.name,
                  style: theme.textTheme.bodyText1.copyWith(
                    color: onColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  color.value.toString(),
                  style: theme.textTheme.bodyText2.copyWith(
                    color: onColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

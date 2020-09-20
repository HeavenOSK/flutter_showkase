import 'package:example/paddings.dart';
import 'package:example/showkase_app/model/showkase_color.dart';
import 'package:flutter/material.dart';

extension _DisplayColors on ThemeData {
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
    final theme = Theme.of(context);

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: mediumPadding),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
          crossAxisSpacing: smallPadding,
          mainAxisSpacing: smallPadding,
          childAspectRatio: 1,
        ),
        delegate: SliverChildListDelegate(
          [
            for (final showkaseColor in theme.displayColors)
              ColorGridItem(
                showkaseColor: showkaseColor,
              )
          ],
        ),
      ),
    );
  }
}

class ColorGridItem extends StatelessWidget {
  const ColorGridItem({
    @required this.showkaseColor,
    Key key,
  }) : super(key: key);

  final ShowkaseColor showkaseColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = showkaseColor.value.computeLuminance() < 0.5;
    final onColor = isLight ? Colors.white : Colors.black;
    return Container(
      color: showkaseColor.value,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              showkaseColor.name,
              style: theme.textTheme.bodyText1.copyWith(
                color: onColor,
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              showkaseColor.value.toString(),
              style: theme.textTheme.bodyText2.copyWith(
                color: onColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

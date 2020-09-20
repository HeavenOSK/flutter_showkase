import 'dart:collection';

import 'package:flutter/material.dart';

extension _DisplayColors on ThemeData {
  LinkedHashMap<String, Color> get displayColors => LinkedHashMap.fromEntries(
        [
          MapEntry('primaryColor', this.primaryColor),
          MapEntry('primaryColorLight', this.primaryColorLight),
          MapEntry('primaryColorDark', this.primaryColorDark),
          MapEntry('canvasColor', this.canvasColor),
          MapEntry('accentColor', this.accentColor),
          MapEntry('scaffoldBackgroundColor', this.scaffoldBackgroundColor),
          MapEntry('bottomAppBarColor', this.bottomAppBarColor),
          MapEntry('cardColor', this.cardColor),
          MapEntry('dividerColor', this.dividerColor),
          MapEntry('focusColor', this.focusColor),
          MapEntry('hoverColor', this.hoverColor),
          MapEntry('highlightColor', this.highlightColor),
          MapEntry('splashColor', this.splashColor),
          MapEntry('selectedRowColor', this.selectedRowColor),
          MapEntry('unselectedWidgetColor', this.unselectedWidgetColor),
          MapEntry('disabledColor', this.disabledColor),
          MapEntry('buttonColor', this.buttonColor),
          MapEntry('secondaryHeaderColor', this.secondaryHeaderColor),
          MapEntry('textSelectionColor', this.textSelectionColor),
          MapEntry('cursorColor', this.cursorColor),
          MapEntry('textSelectionHandleColor', this.textSelectionHandleColor),
          MapEntry('backgroundColor', this.backgroundColor),
          MapEntry('dialogBackgroundColor', this.dialogBackgroundColor),
          MapEntry('indicatorColor', this.indicatorColor),
          MapEntry('hintColor', this.hintColor),
          MapEntry('errorColor', this.errorColor),
          MapEntry('toggleableActiveColor', this.toggleableActiveColor),
        ],
      );
}

class ColorPage extends StatelessWidget {
  const ColorPage();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('$ColorPage'),
      ),
      body: ListView(
        children: [
          for (final entry in themeData.displayColors.entries)
            _ColorListItem(
              name: entry.key,
              color: entry.value,
            ),
        ],
      ),
    );
  }
}

class _ColorListItem extends StatelessWidget {
  const _ColorListItem({
    @required this.name,
    @required this.color,
    Key key,
  }) : super(key: key);

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 4,
                  blurRadius: 5,
                ),
              ],
            ),
            height: constraints.maxHeight,
            width: constraints.maxHeight,
          );
        },
      ),
    );
  }
}

import 'package:example/showkase_app/model/showkase_color.dart';
import 'package:flutter/material.dart';

import '../../paddings.dart';
import 'single_child_sliver.dart';

class ColorSchemeSliverList extends StatelessWidget {
  const ColorSchemeSliverList();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SingleChildSliver(
      child: AspectRatio(
        aspectRatio: 1 / 0.26,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: mediumPadding),
          child: Row(
            children: [
              _ColorSchemeItem(
                name: 'primary',
                color: ShowkaseColor('primary', themeData.colorScheme.primary),
                variantColor: ShowkaseColor(
                    'primaryVariant', themeData.colorScheme.primaryVariant),
                onColor: themeData.colorScheme.onPrimary,
              ),
              const SizedBox(width: mediumPadding),
              _ColorSchemeItem(
                name: 'secondary',
                color:
                    ShowkaseColor('secondary', themeData.colorScheme.secondary),
                variantColor: ShowkaseColor(
                    'secondaryVariant', themeData.colorScheme.secondaryVariant),
                onColor: themeData.colorScheme.onSecondary,
              ),
              const SizedBox(width: mediumPadding),
              _ColorSchemeItem(
                name: 'surface',
                color: ShowkaseColor('surface', themeData.colorScheme.surface),
                onColor: themeData.colorScheme.onSurface,
              ),
              const SizedBox(width: mediumPadding),
              _ColorSchemeItem(
                name: 'background',
                color: ShowkaseColor(
                    'background', themeData.colorScheme.background),
                onColor: themeData.colorScheme.onBackground,
              ),
              const SizedBox(width: mediumPadding),
              _ColorSchemeItem(
                name: 'error',
                color: ShowkaseColor('error', themeData.colorScheme.error),
                onColor: themeData.colorScheme.onError,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ColorSchemeItem extends StatelessWidget {
  const _ColorSchemeItem({
    Key key,
    @required this.name,
    @required this.color,
    this.variantColor,
    @required this.onColor,
  }) : super(key: key);

  final String name;
  final ShowkaseColor color;
  final ShowkaseColor variantColor;
  final Color onColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              color: color.value,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      name,
                      style: theme.textTheme.headline6.copyWith(
                        color: onColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: onColor,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      name.characters.first,
                      style: theme.textTheme.headline6.copyWith(
                        color: color.value,
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      color.value.toString(),
                      style: theme.textTheme.bodyText1.copyWith(
                        color: onColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (variantColor != null)
            Expanded(
              flex: 3,
              child: Container(
                color: variantColor.value,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        variantColor.name,
                        style: theme.textTheme.headline6.copyWith(
                          color: onColor,
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        variantColor.value.toString(),
                        style: theme.textTheme.bodyText1.copyWith(
                          color: onColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

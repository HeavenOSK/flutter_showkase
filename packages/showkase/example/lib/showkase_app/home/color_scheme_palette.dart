import 'package:example/showkase_app/model/showkase_color.dart';
import 'package:flutter/material.dart';

import '../../paddings.dart';
import 'single_child_sliver.dart';

const _maxItemCount = 5;

class ColorSchemeSliverList extends StatelessWidget {
  const ColorSchemeSliverList({
    @required this.colorSchemes,
  });

  final List<ShowkaseColorScheme> colorSchemes;

  @override
  Widget build(BuildContext context) {
    final itemCount = colorSchemes.length;
    return SingleChildSliver(
      child: AspectRatio(
        aspectRatio: 1 / 0.26,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: mediumPadding),
          child: Row(
            children: [
              ...colorSchemes.map((sc) {
                return _ColorSchemeItem(
                  color: sc.color,
                  onColor: sc.onColor.value,
                  variantColor: sc.variantColor,
                );
              }),
              if (itemCount < _maxItemCount)
                Spacer(
                  flex: _maxItemCount - itemCount,
                )
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
    @required this.color,
    @required this.onColor,
    this.variantColor,
  }) : super(key: key);

  final ShowkaseColor color;
  final ShowkaseColor variantColor;
  final Color onColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: mediumPadding),
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
                        color.name,
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
                        color.name.characters.first,
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
      ),
    );
  }
}

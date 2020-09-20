import 'package:example/showkase_app/model/model.dart';
import 'package:example/showkase_app/model/showkase_color.dart';
import 'package:example/showkase_app/widgets/copier_on_tap.dart';
import 'package:flutter/material.dart';

import '../../../paddings.dart';
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
                  onColor: sc.onColor,
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

  final ShowkaseColorSchemeColor color;
  final ShowkaseColorSchemeColor variantColor;
  final ShowkaseColorSchemeColor onColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: mediumPadding),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: _Color(
                color: color,
                onColor: onColor,
              ),
            ),
            if (variantColor != null)
              Expanded(
                flex: 3,
                child: _Variant(
                  variantColor: variantColor,
                  onColor: onColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class _Color extends StatelessWidget {
  const _Color({
    Key key,
    @required this.color,
    @required this.onColor,
  }) : super(key: key);

  final ShowkaseColorSchemeColor color;
  final ShowkaseColorSchemeColor onColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CopierOnTap(
      targetContent: color.copyContent,
      child: Container(
        color: color.value,
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                color.name,
                style: theme.textTheme.headline6.copyWith(
                  color: onColor.value,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                color.value.toString(),
                style: theme.textTheme.bodyText1.copyWith(
                  color: onColor.value,
                ),
              ),
            ),
            Center(
              child: _OnColor(
                onColor: onColor,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnColor extends StatelessWidget {
  const _OnColor({
    Key key,
    @required this.onColor,
    @required this.color,
  }) : super(key: key);

  final ShowkaseColorSchemeColor onColor;
  final ShowkaseColorSchemeColor color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CopierOnTap(
      targetContent: onColor.copyContent,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: onColor.value,
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
    );
  }
}

class _Variant extends StatelessWidget {
  const _Variant({
    Key key,
    @required this.variantColor,
    @required this.onColor,
  }) : super(key: key);

  final ShowkaseColorSchemeColor variantColor;
  final ShowkaseColorSchemeColor onColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CopierOnTap(
      targetContent: variantColor.copyContent,
      child: Container(
        color: variantColor.value,
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                variantColor.name,
                style: theme.textTheme.headline6.copyWith(
                  color: onColor.value,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                variantColor.value.toString(),
                style: theme.textTheme.bodyText1.copyWith(
                  color: onColor.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

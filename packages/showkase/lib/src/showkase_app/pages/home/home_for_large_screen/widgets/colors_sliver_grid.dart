import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../model/model.dart';
import '../../../../widgets/widgets.dart';

class ColorsSliverGrid extends StatelessWidget {
  const ColorsSliverGrid({
    @required this.colors,
  });

  final List<ShowkaseColor> colors;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding:
          EdgeInsets.symmetric(horizontal: PaddingForDesktop.mediumPadding),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: PaddingForDesktop.smallPadding,
          mainAxisSpacing: PaddingForDesktop.smallPadding,
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

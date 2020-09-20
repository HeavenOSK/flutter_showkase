import 'package:example/paddings.dart';
import 'package:flutter/material.dart';

import 'single_child_sliver.dart';

class SliverTitle extends StatelessWidget {
  const SliverTitle({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverPadding(
      padding: EdgeInsets.all(mediumPadding).copyWith(top: largePadding),
      sliver: SingleChildSliver(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.headline2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

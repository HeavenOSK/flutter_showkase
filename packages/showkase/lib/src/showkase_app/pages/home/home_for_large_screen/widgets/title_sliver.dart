import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../widgets/single_child_sliver.dart';

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
      padding: EdgeInsets.all(PaddingForDesktop.mediumPadding)
          .copyWith(top: PaddingForDesktop.largePadding),
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

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
    return SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SingleChildSliver(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

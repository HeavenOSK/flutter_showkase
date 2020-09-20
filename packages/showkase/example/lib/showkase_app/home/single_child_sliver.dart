import 'package:flutter/material.dart';

class SingleChildSliver extends StatelessWidget {
  const SingleChildSliver({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      SliverList(delegate: SliverChildListDelegate([child]));
}

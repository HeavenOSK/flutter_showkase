import 'package:example/showkase_app/home/single_child_sliver.dart';
import 'package:flutter/material.dart';

class ComponentGroup extends StatelessWidget {
  const ComponentGroup({
    @required this.title,
    @required this.content,
    Key key,
  }) : super(key: key);

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 8),
          content,
        ],
      ),
    );
  }
}

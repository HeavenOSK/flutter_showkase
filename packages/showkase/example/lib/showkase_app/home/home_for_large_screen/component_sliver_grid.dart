import 'package:example/paddings.dart';
import 'package:example/showkase_app/model/model.dart';
import 'package:example/showkase_app/utils/copy_to_clipboard.dart';
import 'package:flutter/material.dart';

import '../component_detail_page.dart';

class ComponentsGridSliver extends StatelessWidget {
  const ComponentsGridSliver({
    @required this.components,
  });

  final List<ShowkaseComponent> components;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      delegate: SliverChildListDelegate(
        components.map((c) => ComponentGridItem(component: c)).toList(),
      ),
    );
  }
}

class ComponentGridItem extends StatelessWidget {
  const ComponentGridItem({
    @required this.component,
  });

  final ShowkaseComponent component;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(mediumPadding),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: mediumPadding).copyWith(
                top: mediumPadding,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        component.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                  Spacer(),
                  OutlineButton(
                    onPressed: () {
                      copyToClipboard(context, content: component.name);
                    },
                    child: FittedBox(
                      child: Text('Copy Name'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(mediumPadding),
              alignment: Alignment.center,
              child: FittedBox(
                child: component.component,
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: mediumPadding),
                child: FittedBox(
                  child: TextButton(
                    child: Text('DETAIL PAGE'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_context) => ComponentDetailPage(
                            component: component,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

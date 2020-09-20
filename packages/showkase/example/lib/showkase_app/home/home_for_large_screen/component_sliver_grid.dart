import 'package:example/paddings.dart';
import 'package:example/showkase_app/model/model.dart';
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
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              top: mediumPadding,
              left: mediumPadding,
            ),
            child: Text(
              component.name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Divider(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(mediumPadding),
              alignment: Alignment.center,
              child: FittedBox(
                child: component.component,
              ),
            ),
          ),
          Divider(),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.all(smallPadding),
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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../model/model.dart';
import '../../../../utils/utils.dart';

typedef OnOpen = void Function(ShowkaseComponent component);

class ComponentsGridSliver extends StatelessWidget {
  const ComponentsGridSliver({
    @required this.components,
    @required this.onOpen,
  });

  final List<ShowkaseComponent> components;
  final OnOpen onOpen;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      delegate: SliverChildListDelegate(
        components
            .map(
              (c) => ComponentGridItem(
                component: c,
                onOpen: () => onOpen?.call(c),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ComponentGridItem extends StatelessWidget {
  const ComponentGridItem({
    @required this.component,
    @required this.onOpen,
  });

  final ShowkaseComponent component;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(PaddingForDesktop.mediumPadding),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                      horizontal: PaddingForDesktop.mediumPadding)
                  .copyWith(
                top: PaddingForDesktop.mediumPadding,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        component.name ?? '',
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
              padding: const EdgeInsets.all(PaddingForDesktop.mediumPadding),
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
                padding: const EdgeInsets.only(
                    right: PaddingForDesktop.mediumPadding),
                child: FittedBox(
                  child: FlatButton(
                    child: Text('OPEN'),
                    onPressed: onOpen,
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

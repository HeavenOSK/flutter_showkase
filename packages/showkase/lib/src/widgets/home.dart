import 'package:flutter/material.dart';

import 'color_page.dart';
import 'text_style_page.dart';

class ShowkaseHome extends StatelessWidget {
  const ShowkaseHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Showkase'),
      ),
      body: ListView(
        children: [
          _HomeItem(
            name: 'Component',
            onTap: () {},
          ),
          _HomeItem(
            name: '$Color',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_context) => const ColorPage(),
                ),
              );
            },
          ),
          _HomeItem(
            name: '$TextStyle',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_context) => const TextStylePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _HomeItem extends StatelessWidget {
  const _HomeItem({
    @required this.name,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
      ),
      onTap: onTap,
    );
  }
}

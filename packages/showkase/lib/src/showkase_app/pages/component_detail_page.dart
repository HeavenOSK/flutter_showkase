import 'package:flutter/material.dart';

import '../model/model.dart';

class ComponentDetailPage extends StatelessWidget {
  const ComponentDetailPage({
    @required this.component,
    @required this.onBackButtonTap,
    Key key,
  }) : super(key: key);

  final ShowkaseComponent component;
  final VoidCallback onBackButtonTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onBackButtonTap,
          icon: Icon(Icons.navigate_before),
        ),
        title: Text(component.name),
      ),
      body: Center(
        child: component.component,
      ),
    );
  }
}

import 'package:example/showkase_app/model/model.dart';
import 'package:flutter/material.dart';

class ComponentDetailPage extends StatelessWidget {
  const ComponentDetailPage({
    @required this.component,
    Key key,
  }) : super(key: key);

  final ShowkaseComponent component;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(component.name),
      ),
      body: Center(
        child: component.component,
      ),
    );
  }
}

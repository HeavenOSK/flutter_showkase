import 'package:flutter/material.dart';

import '../../interface/interface.dart';
import 'abstract/abstract.dart';

class ShowkaseComponent implements Searchable {
  ShowkaseComponent({
    @required this.name,
    @required this.component,
    this.group,
  });

  factory ShowkaseComponent.fromShowkased(ShowkasedComponent showkased) {
    return ShowkaseComponent(
      name: showkased.name,
      group: showkased.groupName,
      component: showkased.component,
    );
  }

  final String name;
  final String group;
  final Widget component;

  @override
  List<String> get keywords => [
        name,
        component.runtimeType.toString(),
        if (group != null) group,
      ].map((w) => w.toLowerCase()).toList();
}

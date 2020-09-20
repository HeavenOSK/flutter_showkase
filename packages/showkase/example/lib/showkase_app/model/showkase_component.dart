import 'package:example/showkase_app/model/searchable.dart';
import 'package:flutter/material.dart';

class ShowkaseComponent implements Searchable {
  ShowkaseComponent({
    @required this.name,
    @required this.component,
    this.group,
  });

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

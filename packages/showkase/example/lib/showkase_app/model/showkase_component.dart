import 'package:example/showkase_app/model/searchable.dart';
import 'package:flutter/material.dart';

class ShowkaseComponent implements Searchable {
  final String name;
  final String group;
  final Widget component;

  ShowkaseComponent({
    @required this.name,
    @required this.component,
    this.group,
  });

  @override
  List<String> get keywords => [
        name.toLowerCase(),
        component.runtimeType.toString().toLowerCase(),
        group.toLowerCase(),
      ];
}

import 'package:flutter/material.dart';

import 'abstract/abstract.dart';

class ShowkaseColor implements Searchable, Copyable {
  const ShowkaseColor(this.name, this.value);

  final Color value;
  final String name;

  @override
  List<String> get keywords => [
        name,
        '$ShowkaseColor',
        value.toString(),
      ].map((w) => w.toLowerCase()).toList();

  @override
  String get copyContent => 'Theme.of(context).$name';
}

import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import 'copyable.dart';
import 'searchable.dart';

class ShowkaseTextStyle implements Searchable, Copyable {
  final String name;
  final TextStyle value;

  const ShowkaseTextStyle(this.name, this.value);

  @override
  List<String> get keywords => [
        name,
        '$ShowkaseTextStyle',
      ].map((w) => w.toLowerCase()).toList();

  @override
  String get copyContent => 'Theme.of(context).textTheme.$name';
}

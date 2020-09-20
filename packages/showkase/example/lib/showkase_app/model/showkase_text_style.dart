import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import 'copyable.dart';
import 'searchable.dart';

class ShowkaseTextTheme implements Searchable, Copyable {
  final String name;
  final TextStyle value;

  const ShowkaseTextTheme(this.name, this.value);

  @override
  List<String> get keywords => [
        name,
        '$ShowkaseTextTheme',
      ].map((w) => w.toLowerCase()).toList();

  @override
  String get copyContent => 'Theme.of(context).textTheme.$name';
}

import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import 'searchable.dart';

class ShowkaseTextStyle implements Searchable {
  final String name;
  final TextStyle value;

  const ShowkaseTextStyle(this.name, this.value);

  @override
  List<String> get keywords => [
        name,
        '$ShowkaseTextStyle',
      ].map((w) => w.toLowerCase()).toList();
}

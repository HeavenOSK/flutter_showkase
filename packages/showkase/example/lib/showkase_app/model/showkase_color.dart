import 'package:flutter/material.dart';

import 'searchable.dart';

class ShowkaseColor implements Searchable {
  final Color value;
  final String name;

  ShowkaseColor(this.name, this.value);

  @override
  List<String> get keywords => [
        name.toLowerCase(),
        '$ShowkaseColor'.toLowerCase(),
      ];
}

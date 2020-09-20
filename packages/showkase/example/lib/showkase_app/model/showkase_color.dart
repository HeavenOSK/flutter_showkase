import 'package:flutter/material.dart';

import 'searchable.dart';

class ShowkaseColor implements Searchable {
  const ShowkaseColor(this.name, this.value);

  final Color value;
  final String name;

  @override
  List<String> get keywords => [
        name,
        '$ShowkaseColor',
      ].map((w) => w.toLowerCase()).toList();
}

class ShowkaseColorScheme implements Searchable {
  ShowkaseColorScheme({
    @required this.color,
    this.variantColor,
    @required this.onColor,
  });

  final ShowkaseColor color;
  final ShowkaseColor variantColor;
  final ShowkaseColor onColor;

  @override
  List<String> get keywords => [
        '$ShowkaseColorScheme',
        color.name,
        if (variantColor != null) variantColor.name,
        onColor.name,
      ].map((w) => w.toLowerCase()).toList();
}

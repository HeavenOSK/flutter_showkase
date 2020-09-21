import 'package:flutter/material.dart';

import 'abstract/abstract.dart';

class ShowkaseColorScheme implements Searchable {
  ShowkaseColorScheme({
    @required this.color,
    this.variantColor,
    @required this.onColor,
  });

  final ShowkaseColorSchemeColor color;
  final ShowkaseColorSchemeColor variantColor;
  final ShowkaseColorSchemeColor onColor;

  @override
  List<String> get keywords => [
        '$ShowkaseColorScheme',
        ...color.keywords,
        if (variantColor != null) ...variantColor.keywords,
      ].map((w) => w.toLowerCase()).toList();
}

class ShowkaseColorSchemeColor implements Searchable, Copyable {
  const ShowkaseColorSchemeColor(this.name, this.value);

  final Color value;
  final String name;

  @override
  List<String> get keywords => [
        name,
        '$ShowkaseColorSchemeColor',
        value.toString(),
      ].map((w) => w.toLowerCase()).toList();

  @override
  String get copyContent => 'Theme.of(context).colorScheme.$name';
}

import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    primarySwatch: Colors.yellow,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

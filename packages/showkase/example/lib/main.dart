import 'package:flutter/material.dart';
import 'package:showkase/showkase.dart';

import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowkaseApp(
      lightTheme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}

import 'package:flutter/material.dart';

import 'theme.dart';
import 'widgets/widgets.dart';

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

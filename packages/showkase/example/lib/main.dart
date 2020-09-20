import 'package:flutter/material.dart';

import 'showkase_app/app.dart';
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

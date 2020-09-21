import 'package:example/main.dart' as _i0;
import 'package:flutter/material.dart';
import 'package:showkase/showkase.dart';

void main() {
  runApp(
    MyShowkaseApp(),
  );
}

class MyShowkaseApp extends StatelessWidget {
  const MyShowkaseApp();
  
  @override
  Widget build(BuildContext context) {
    return ShowkaseApp(
      theme: _i0.showkasedTheme,
      components: [
        _i0.incrementButton,
      ],
    );
  }
}
  

  
import 'package:example/showkase_app/home/home_for_large_screen.dart';
import 'package:example/showkase_app/home/home_for_small_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

const _screenBoundary = 960.0;
enum HomeScreenContent {
  colorScheme,
  colors,
  textTheme,
  components,
}

extension HomeScreenContentTitle on HomeScreenContent {
  String get title => ReCase(describeEnum(this)).pascalCase;
}

class ShowkaseHome extends StatelessWidget {
  const ShowkaseHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < _screenBoundary) {
      return HomeForSmallScreen();
    } else {
      return HomeForLargeScreen();
    }
  }
}

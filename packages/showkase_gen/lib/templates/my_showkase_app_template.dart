import 'package:meta/meta.dart';

class MyShowKaseAppArg {
  MyShowKaseAppArg({
    @required this.displayName,
    @required this.prefix,
  });

  final String prefix;
  final String displayName;

  @override
  String toString() => '''$prefix.$displayName''';
}

class MyShowkaseAppTemplate {
  MyShowkaseAppTemplate({
    this.theme,
    List<MyShowKaseAppArg> components,
  }) : components = components ?? const <MyShowKaseAppArg>[];

  final MyShowKaseAppArg theme;
  final List<MyShowKaseAppArg> components;

  @override
  String toString() => '''
class MyShowkaseApp extends StatelessWidget {
  const MyShowkaseApp();
  
  @override
  Widget build(BuildContext context) {
    return ShowkaseApp(
      theme: $theme,
      components: [${components.map((c) => '\n        ${c.toString()},').join()}
      ],
    );
  }
}
  ''';
}

import 'package:meta/meta.dart';
import 'package:showkase_generator/templates/my_showkase_app_template.dart';

class ImportTemplate {
  final String prefix;
  final String path;

  ImportTemplate({
    @required this.prefix,
    @required this.path,
  });

  @override
  String toString() => '''import \'$path\' as $prefix;\n''';
}

class MainShowkaseTemplate {
  final List<ImportTemplate> imports;
  final MyShowkaseAppTemplate myShowkaseAppTemplate;

  MainShowkaseTemplate({
    @required this.myShowkaseAppTemplate,
    @required this.imports,
  });

  @override
  String toString() {
    final sortedImports = [
      '''import 'package:flutter/material.dart';\n''',
      '''import 'package:showkase/showkase.dart';\n''',
      ...imports.map((i) => i.toString())
    ]..sort();
    return '''
${sortedImports.join()}
void main() {
  runApp(
    MyShowkaseApp(),
  );
}

$myShowkaseAppTemplate

  ''';
  }
}

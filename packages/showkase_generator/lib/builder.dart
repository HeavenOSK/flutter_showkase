import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;
import 'package:showkase_generator/constants/constants.dart';
import 'package:source_gen/source_gen.dart';

import 'templates/templates.dart';

class _VariableModel {
  final String path;
  final String name;

  _VariableModel(this.path, this.name);
}

Builder showkase(BuilderOptions options) {
  return ListAllClassesBuilder();
}

class ListAllClassesBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      r'$lib$': ['main.showkase.dart']
    };
  }

  static AssetId _allFileOutput(BuildStep buildStep) {
    return AssetId(
      buildStep.inputId.package,
      p.join('lib', 'main.showkase.dart'),
    );
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    // buildStep.
    final themeVals = <_VariableModel>[];
    final componentVals = <_VariableModel>[];
    final pathSet = Set<String>();

    await for (final input in buildStep.findAssets(Glob('lib/**'))) {
      try {
        final library = await buildStep.resolver.libraryFor(input);

        LibraryReader(library).allElements.forEach(
          (rawElement) {
            if (rawElement.kind == ElementKind.GETTER) {
              final getter = rawElement as ExecutableElement;
              final returnTypeString = getter.returnType.toString();

              if (returnTypeString == ShowkaseClassNames.component) {
                final path = getter.location.components.first;
                pathSet.add(path);
                componentVals.add(
                  _VariableModel(
                    path,
                    getter.displayName,
                  ),
                );
              } else if (returnTypeString == ShowkaseClassNames.theme) {
                final path = getter.location.components.first;
                pathSet.add(path);
                themeVals.add(
                  _VariableModel(
                    path,
                    getter.displayName,
                  ),
                );
              }
            }
          },
        );
      } catch (_) {
        print(_);
      }
    }

    final sortedPaths = pathSet.toList()..sort();

    final importMap = Map.fromEntries(
      List.generate(
        sortedPaths.length,
        (index) {
          final path = sortedPaths[index];
          return MapEntry(
            path,
            ImportTemplate(
              path: path,
              prefix: '_i$index',
            ),
          );
        },
      ),
    );
    final componentArgs = componentVals.map((v) {
      return MyShowKaseAppArg(
        prefix: importMap[v.path].prefix,
        displayName: v.name,
      );
    }).toList();
    final themeArg = (themeVals?.isNotEmpty ?? false)
        ? MyShowKaseAppArg(
            prefix: importMap[themeVals.first.path].prefix,
            displayName: themeVals.first.name,
          )
        : null;

    await buildStep.writeAsString(
      _allFileOutput(buildStep),
      MainShowkaseTemplate(
        imports: importMap.values.toList(),
        myShowkaseAppTemplate: MyShowkaseAppTemplate(
          theme: themeArg,
          components: componentArgs,
        ),
      ).toString(),
      // classNames.join('\n'),
    );
  }
}

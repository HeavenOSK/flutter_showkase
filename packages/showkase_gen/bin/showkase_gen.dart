import 'dart:developer';
import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:build/build.dart' as b;
import 'package:build_runner/build_runner.dart';
import 'package:build_runner_core/build_runner_core.dart';

import 'package:build_runner/src/entrypoint/runner.dart';
import 'package:build_runner/src/entrypoint/clean.dart';
import 'package:path/path.dart' as p;
import 'package:showkase_gen/builder.dart';

void main(List<String> args) async {
  var runner = BuildCommandRunner(
    [
      BuilderApplication.forBuilder(
        'showkase_gen',
        [
          showkase,
        ],
        (p) => p.isRoot,
        hideOutput: false,
      ),
    ],
    await PackageGraph.forThisPackage(),
  )..addCommand(CleanCommand());
  var result = await runner.run(['build', '--delete-conflicting-outputs']);
}

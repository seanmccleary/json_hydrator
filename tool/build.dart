import 'dart:async';
import 'package:build_runner/build_runner.dart';
import 'package:json_hydrator/json_hydrator.dart';
import 'package:source_gen/source_gen.dart';

Future<dynamic> main() async {
  final PhaseGroup phaseGroup = new PhaseGroup.singleAction(
      new GeneratorBuilder(<Generator>[new JsonMapperGenerator()]),
      new InputSet('json_hydrator', const <String>['test/*.dart']));

  await build(phaseGroup, deleteFilesByDefault: true);
}

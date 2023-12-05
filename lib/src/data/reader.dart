import 'dart:io';

import 'package:dart_scope_functions/dart_scope_functions.dart';

Future<String> readInputData(int year, int day, bool isTest) {
  final currentWorkingDirectory = Directory.current.path;
  final inputFileName =
      '$year.$day'.let((it) => isTest ? '$it.test.txt' : '$it.txt');

  return File('$currentWorkingDirectory/lib/src/data/$inputFileName')
      .readAsString();
}

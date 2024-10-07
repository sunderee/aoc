import 'dart:io';

import 'package:args/args.dart';

import 'data.dart';
import 'solutions.dart';

Future<void> main(List<String> arguments) async {
  final ArgParser argParser = _buildParser();

  try {
    final ArgResults results = argParser.parse(arguments);
    if (results.wasParsed('help')) {
      _printUsage(argParser);
      return;
    }

    final (year, day) = (
      int.parse(results['year'] as String),
      int.parse(results['day'] as String),
    );
    final solution = solutions[year]?[day];
    if (solution == null) {
      print('Solution not found for $year $day');
      return;
    }

    final input = await File(inputData[year]?[day] as String).readAsString();
    final first = solution.first(input);
    final second = solution.second(input);
    print('$year $day first: $first');
    print('$year $day second: $second');
  } catch (error, stackTrace) {
    print(error);
    print(stackTrace);
    _printUsage(argParser);
  }
}

ArgParser _buildParser() => ArgParser()
  ..addFlag(
    'help',
    abbr: 'h',
    negatable: false,
    help: 'Print this usage information.',
  )
  ..addOption(
    'year',
    abbr: 'y',
    help: 'Year selection',
    valueHelp: 'value between 2015-2023',
    mandatory: true,
  )
  ..addOption(
    'day',
    abbr: 'd',
    help: 'Day selection',
    valueHelp: 'value between 1-25',
    mandatory: true,
  );

void _printUsage(ArgParser argParser) {
  print('Usage: dart aoc.dart <flags> [arguments]');
  print(argParser.usage);
}

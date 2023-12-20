import 'dart:async';

import 'package:aoc/aoc.dart';
import 'package:args/args.dart';

typedef _YearDay = ({int year, int day});
typedef _YearDaySolution = ({FutureOr<Object> first, FutureOr<Object> second});

Future<void> main(List<String> arguments) async {
  final yearDay = _parseCLIArguments(arguments);
  if (yearDay == null) {
    return;
  }

  final yearDaySolution = _mapOfSolutions[yearDay];
  if (yearDaySolution == null) {
    print(
      '\x1B[31mNo solution exists for year ${yearDay.year} and day ${yearDay.day}\x1B[0m',
    );
    return;
  }

  final (part1, part2) = (
    await yearDaySolution.first,
    await yearDaySolution.second,
  );
  print('Part 1: $part1');
  print('Part 2: $part2');
}

Map<_YearDay, _YearDaySolution> _mapOfSolutions = {
  (year: 2015, day: 1): (
    first: Year2015Day01().first(),
    second: Year2015Day01().second(),
  ),
  (year: 2015, day: 2): (
    first: Year2015Day02().first(),
    second: Year2015Day02().second(),
  ),
  (year: 2015, day: 3): (
    first: Year2015Day03().first(),
    second: Year2015Day03().second(),
  ),
  (year: 2015, day: 4): (
    first: Year2015Day04().first(),
    second: Year2015Day04().second(),
  ),
  (year: 2015, day: 5): (
    first: Year2015Day05().first(),
    second: Year2015Day05().second(),
  ),
  (year: 2015, day: 6): (
    first: Year2015Day06().first(),
    second: Year2015Day06().second(),
  ),
};

_YearDay? _parseCLIArguments(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'year',
      abbr: 'y',
      help: 'Year (2015 - 2022).',
      valueHelp: 'year',
    )
    ..addOption(
      'day',
      abbr: 'd',
      help: 'Day (1 - 25).',
      valueHelp: 'day',
    )
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Display this help information.',
    );

  try {
    final argResults = parser.parse(arguments);
    if (argResults['help'] == true) {
      print('Usage: aoc [options]');
      print(parser.usage);
      return null;
    }

    var year = int.tryParse(argResults['year'] as String? ?? '');
    var day = int.tryParse(argResults['day'] as String? ?? '');

    if (year == null ||
        year < 2015 ||
        year > 2023 ||
        day == null ||
        day < 1 ||
        day > 25) {
      print('\x1B[31mInvalid input. Please check your input.\x1B[0m');
      return null;
    }

    return (year: year, day: day);
  } catch (_) {
    print('\x1B[31mInvalid input. Please check your input.\x1B[0m');
  }

  return null;
}

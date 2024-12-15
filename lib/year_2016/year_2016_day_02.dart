import 'dart:math';

import 'package:aoc/solution.dart';

const List<List<String>> _normalKeypad = [
  ['1', '2', '3'],
  ['4', '5', '6'],
  ['7', '8', '9'],
];

const List<List<String>> _hundredsManHoursKeypad = [
  ['', '', '1', '', ''],
  ['', '2', '3', '4', ''],
  ['5', '6', '7', '8', '9'],
  ['', 'A', 'B', 'C', ''],
  ['', '', 'D', '', ''],
];

final class Year2016Day02 implements Solution<String, String> {
  @override
  String first(String input, {bool inTestMode = false}) {
    final codeDigits = <String>[];
    var currentPosition = const Point(1, 1);
    input.split('\n').forEach((line) {
      line.split('').forEach((direction) {
        currentPosition = _moveOnNormalKeypad(
          currentPosition,
          direction,
        );
      });

      codeDigits.add(_normalKeypad[currentPosition.y][currentPosition.x]);
    });

    return codeDigits.join('');
  }

  @override
  String second(String input, {bool inTestMode = false}) {
    final codeCharacters = <String>[];
    var currentPosition = const Point(0, 2);
    input.split('\n').forEach((line) {
      line.split('').forEach((direction) {
        currentPosition = _moveOnHundredsManHoursKeypad(
          currentPosition,
          direction,
        );
      });

      codeCharacters
          .add(_hundredsManHoursKeypad[currentPosition.y][currentPosition.x]);
    });

    return codeCharacters.join('');
  }

  Point<int> _moveOnNormalKeypad(Point<int> currentPosition, String direction) {
    return switch (direction) {
      'U' => currentPosition.y > 0
          ? Point(currentPosition.x, currentPosition.y - 1)
          : currentPosition,
      'D' => currentPosition.y < 2
          ? Point(currentPosition.x, currentPosition.y + 1)
          : currentPosition,
      'L' => currentPosition.x > 0
          ? Point(currentPosition.x - 1, currentPosition.y)
          : currentPosition,
      'R' => currentPosition.x < 2
          ? Point(currentPosition.x + 1, currentPosition.y)
          : currentPosition,
      _ => throw ArgumentError('Invalid direction: $direction'),
    };
  }

  Point<int> _moveOnHundredsManHoursKeypad(
    Point<int> currentPosition,
    String direction,
  ) {
    return switch (direction) {
      'U' => currentPosition.y > 0 &&
              _hundredsManHoursKeypad[currentPosition.y - 1][currentPosition.x]
                  .isNotEmpty
          ? Point(currentPosition.x, currentPosition.y - 1)
          : currentPosition,
      'D' => currentPosition.y < 4 &&
              _hundredsManHoursKeypad[currentPosition.y + 1][currentPosition.x]
                  .isNotEmpty
          ? Point(currentPosition.x, currentPosition.y + 1)
          : currentPosition,
      'L' => currentPosition.x > 0 &&
              _hundredsManHoursKeypad[currentPosition.y][currentPosition.x - 1]
                  .isNotEmpty
          ? Point(currentPosition.x - 1, currentPosition.y)
          : currentPosition,
      'R' => currentPosition.x < 4 &&
              _hundredsManHoursKeypad[currentPosition.y][currentPosition.x + 1]
                  .isNotEmpty
          ? Point(currentPosition.x + 1, currentPosition.y)
          : currentPosition,
      _ => throw ArgumentError('Invalid direction: $direction'),
    };
  }
}

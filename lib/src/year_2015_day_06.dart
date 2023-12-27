import 'package:aoc/solution.dart';
import 'package:aoc/src/data/reader.dart';
import 'package:aoc/src/shared/types.dart';
import 'package:collection/collection.dart';
import 'package:dart_scope_functions/dart_scope_functions.dart';

typedef _LightsCommand = ({String command, Position2D start, Position2D end});

final class Year2015Day06 implements Solution<int, int> {
  @override
  Future<int> first({bool isTest = false}) async {
    final input = await readInputData(2015, 6, isTest);

    final Set<Position2D> turnedOnLightPositions = {};
    input.split('\n').map((item) => _parseLightsCommand(item)).forEach((item) {
      if (item.command == 'turn on') {
        for (var x = item.start.x; x <= item.end.x; x++) {
          for (var y = item.start.y; y <= item.end.y; y++) {
            turnedOnLightPositions.add((x: x, y: y));
          }
        }
      }

      if (item.command == 'turn off') {
        for (var x = item.start.x; x <= item.end.x; x++) {
          for (var y = item.start.y; y <= item.end.y; y++) {
            turnedOnLightPositions.remove((x: x, y: y));
          }
        }
      }

      if (item.command == 'toggle') {
        for (var x = item.start.x; x <= item.end.x; x++) {
          for (var y = item.start.y; y <= item.end.y; y++) {
            final Position2D position = (x: x, y: y);
            if (turnedOnLightPositions.contains(position)) {
              turnedOnLightPositions.remove(position);
            } else {
              turnedOnLightPositions.add(position);
            }
          }
        }
      }
    });

    return turnedOnLightPositions.length;
  }

  @override
  Future<int> second({bool isTest = false}) async {
    final input = await readInputData(2015, 6, isTest);
    final List<List<int>> lightsGrid = List.generate(
      1000,
      (_) => List.generate(1000, (_) => 0),
    );

    input.split('\n').map((item) => _parseLightsCommand(item)).forEach((item) {
      if (item.command == 'turn on') {
        for (var x = item.start.x; x <= item.end.x; x++) {
          for (var y = item.start.y; y <= item.end.y; y++) {
            final currentBrightnessAtPosition = lightsGrid[x][y];
            lightsGrid[x][y] = currentBrightnessAtPosition + 1;
          }
        }
      }

      if (item.command == 'turn off') {
        for (var x = item.start.x; x <= item.end.x; x++) {
          for (var y = item.start.y; y <= item.end.y; y++) {
            final currentBrightnessAtPosition = lightsGrid[x][y];
            if (currentBrightnessAtPosition > 0) {
              lightsGrid[x][y] = currentBrightnessAtPosition - 1;
            }
          }
        }
      }

      if (item.command == 'toggle') {
        for (var x = item.start.x; x <= item.end.x; x++) {
          for (var y = item.start.y; y <= item.end.y; y++) {
            final currentBrightnessAtPosition = lightsGrid[x][y];
            lightsGrid[x][y] = currentBrightnessAtPosition + 2;
          }
        }
      }
    });

    return lightsGrid.flattened.reduce((value, element) => value + element);
  }

  _LightsCommand _parseLightsCommand(String input) {
    final command = RegExp(r'^[\w\s]+(?=\s\d)', multiLine: true)
        .stringMatch(input)
        .withDefault('');
    final (startCommand, endCommand) = RegExp(r'\d{1,3},\d{1,3}')
        .allMatches(input)
        .map((item) => item.group(0))
        .whereType<String>()
        .map((item) => item
            .split(',')
            .let((it) => (x: int.parse(it.first), y: int.parse(it.last))))
        .let((it) => (it.first, it.last));

    return (command: command, start: startCommand, end: endCommand);
  }
}

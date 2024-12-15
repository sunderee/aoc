import 'package:aoc/solution.dart';
import 'package:aoc/utilities/scope_functions.dart';
import 'package:aoc/utilities/types.dart';

final class Year2024Day14 implements Solution<int, int> {
  @override
  int first(String input, {bool inTestMode = false}) {
    final robots = input
        .split('\n')
        .map((item) => _parsePositionAndVelocity(item))
        .toList();

    final gridWidth = inTestMode ? 11 : 101;
    final gridHeight = inTestMode ? 7 : 103;

    final positions = List<Point>.from(robots.map((item) => item.$1));

    for (int tick = 0; tick < 100; tick++) {
      for (int i = 0; i < robots.length; i++) {
        final velocity = robots[i].$2;

        positions[i] = (
          x: (positions[i].x + velocity.x) % gridWidth,
          y: (positions[i].y + velocity.y) % gridHeight,
        );

        if (positions[i].x < 0) {
          positions[i] = (x: positions[i].x + gridWidth, y: positions[i].y);
        }

        if (positions[i].y < 0) {
          positions[i] = (x: positions[i].x, y: positions[i].y + gridHeight);
        }
      }
    }

    final midX = gridWidth ~/ 2;
    final midY = gridHeight ~/ 2;

    final quadrants = [0, 0, 0, 0];

    for (final position in positions) {
      if (position.x == midX || position.y == midY) {
        continue;
      }

      if (position.x < midX) {
        if (position.y < midY) {
          quadrants[0]++;
        } else {
          quadrants[2]++;
        }
      } else {
        if (position.y < midY) {
          quadrants[1]++;
        } else {
          quadrants[3]++;
        }
      }
    }

    return quadrants.reduce((previous, current) => previous * current);
  }

  // Heavily inspired by: https://github.com/CodingAP/advent-of-code
  @override
  int second(String input, {bool inTestMode = false}) {
    final robots = input
        .split('\n')
        .map((item) => _parsePositionAndVelocity(item))
        .toList();

    const gridWidth = 101;
    const gridHeight = 103;

    final positions = List<Point>.from(robots.map((item) => item.$1));

    int step = 0;
    while (true) {
      step++;

      for (var i = 0; i < robots.length; i++) {
        final velocity = robots[i].$2;

        positions[i] = (
          x: (positions[i].x + velocity.x + gridWidth) % gridWidth,
          y: (positions[i].y + velocity.y + gridHeight) % gridHeight,
        );
      }

      final positionSet = positions.map((p) => '${p.x},${p.y}').toSet();
      for (final position in positions) {
        bool hasGroup = true;

        for (var j = -2; j <= 2; j++) {
          for (var k = -2; k <= 2; k++) {
            if (!positionSet.contains('${position.x + k},${position.y + j}')) {
              hasGroup = false;
              break;
            }
          }

          if (!hasGroup) {
            break;
          }
        }

        if (hasGroup) {
          return step;
        }
      }
    }
  }

  (Point, Point) _parsePositionAndVelocity(String line) {
    final position = RegExp(r'(?<=p\=)([\-\d]+),([\-\d]+)')
        .allMatches(line)
        .elementAt(0)
        .let((it) => (
              it.group(1)?.let((match) => int.tryParse(match)),
              it.group(2)?.let((match) => int.tryParse(match)),
            ))
        .let((it) => (x: it.$1 ?? 0, y: it.$2 ?? 0));
    final velocity = RegExp(r'(?<=v\=)([\-\d]+),([\-\d]+)')
        .allMatches(line)
        .elementAt(0)
        .let((it) => (
              it.group(1)?.let((match) => int.tryParse(match)),
              it.group(2)?.let((match) => int.tryParse(match)),
            ))
        .let((it) => (x: it.$1 ?? 0, y: it.$2 ?? 0));

    return (position, velocity);
  }
}

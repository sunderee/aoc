import 'dart:math';

import 'package:aoc/solution.dart';

final class Year2015Day03 implements Solution<int, int> {
  @override
  int first(String input, {bool inTestMode = false}) {
    var currentPosition = const Point(0, 0);
    final Set<Point<int>> visitedHousesGrid = {currentPosition};

    input.split('').forEach((item) {
      final nextPosition = switch (item) {
        '^' => currentPosition + const Point(0, 1),
        'v' => currentPosition + const Point(0, -1),
        '>' => currentPosition + const Point(1, 0),
        '<' => currentPosition + const Point(-1, 0),
        _ => throw Exception('Invalid input'),
      };

      visitedHousesGrid.add(nextPosition);
      currentPosition = nextPosition;
    });

    return visitedHousesGrid.length;
  }

  @override
  int second(String input, {bool inTestMode = false}) {
    var currentPositionSanta = const Point(0, 0);
    var currentPositionRobot = const Point(0, 0);

    final Set<Point<int>> visitedHousesGrid = {
      currentPositionSanta,
      currentPositionRobot,
    };

    final directions = input.split('');
    final directionPairs = [
      for (var i = 0; i < directions.length; i += 2)
        [directions[i], if (i + 1 < directions.length) directions[i + 1]]
    ];
    directionPairs
        .where((item) => item.isNotEmpty && item.length == 2)
        .forEach((item) {
      final nextPositionSanta = switch (item.first) {
        '^' => currentPositionSanta + const Point(0, 1),
        'v' => currentPositionSanta + const Point(0, -1),
        '>' => currentPositionSanta + const Point(1, 0),
        '<' => currentPositionSanta + const Point(-1, 0),
        _ => throw Exception('Invalid input'),
      };
      final nextPositionRobot = switch (item.last) {
        '^' => currentPositionRobot + const Point(0, 1),
        'v' => currentPositionRobot + const Point(0, -1),
        '>' => currentPositionRobot + const Point(1, 0),
        '<' => currentPositionRobot + const Point(-1, 0),
        _ => throw Exception('Invalid input'),
      };

      visitedHousesGrid.add(nextPositionSanta);
      visitedHousesGrid.add(nextPositionRobot);
      currentPositionSanta = nextPositionSanta;
      currentPositionRobot = nextPositionRobot;
    });

    return visitedHousesGrid.length;
  }
}

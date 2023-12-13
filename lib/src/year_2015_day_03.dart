import 'package:aoc/solution.dart';
import 'package:aoc/src/data/reader.dart';
import 'package:aoc/src/shared/types.dart';
import 'package:collection/collection.dart';

final class Year2015Day03 implements Solution<int, int> {
  static const Map<String, Position2D> _directionMap = {
    '^': (x: 0, y: 1),
    '>': (x: 1, y: 0),
    'v': (x: 0, y: -1),
    '<': (x: -1, y: 0),
  };

  @override
  Future<int> first({bool isTest = false}) async {
    final input = await readInputData(2015, 3, isTest);

    Position2D currentPosition = (x: 0, y: 0);
    final Set<Position2D> visitedHouses = {currentPosition};
    input.split('').forEach((item) {
      final direction = _directionMap[item];

      currentPosition = (
        x: currentPosition.x + (direction?.x ?? 0),
        y: currentPosition.y + (direction?.y ?? 0),
      );
      visitedHouses.add(currentPosition);
    });

    return visitedHouses.length;
  }

  @override
  Future<int> second({bool isTest = false}) async {
    final input = await readInputData(2015, 3, isTest);

    Position2D currentPositionSanta = (x: 0, y: 0);
    Position2D currentPositionRoboSanta = (x: 0, y: 0);
    final Set<Position2D> visitedHousesSanta = {currentPositionSanta};
    final Set<Position2D> visitedHousesRoboSanta = {};

    input
        .split('')
        .slices(2)
        .where((item) => item.length == 2)
        .map((item) => (item.first, item.last))
        .forEach((item) {
      final directionSanta = _directionMap[item.$1];
      final directionRoboSanta = _directionMap[item.$2];

      currentPositionSanta = (
        x: currentPositionSanta.x + (directionSanta?.x ?? 0),
        y: currentPositionSanta.y + (directionSanta?.y ?? 0),
      );
      currentPositionRoboSanta = (
        x: currentPositionRoboSanta.x + (directionRoboSanta?.x ?? 0),
        y: currentPositionRoboSanta.y + (directionRoboSanta?.y ?? 0),
      );

      visitedHousesSanta.add(currentPositionSanta);
      visitedHousesRoboSanta.add(currentPositionRoboSanta);
    });

    return visitedHousesSanta.length + visitedHousesRoboSanta.length;
  }
}

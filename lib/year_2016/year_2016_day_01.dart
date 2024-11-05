import 'package:aoc/solution.dart';
import 'package:aoc/utilities/enums.dart';
import 'package:aoc/utilities/extensions.dart';
import 'package:aoc/utilities/scope_functions.dart';
import 'package:aoc/utilities/types.dart';

final class Year2016Day01 implements Solution<int, int> {
  @override
  int first(String input) {
    const startingPoint = (x: 0, y: 0);
    var lastVisitedPoint = (x: 0, y: 0);
    var direction = Direction.north;

    for (final instruction in input.split(', ')) {
      final turn = RegExp(r'[A-Z]{1}').stringMatch(instruction);
      final distance = RegExp(r'\d+')
              .stringMatch(instruction)
              ?.let((it) => int.tryParse(it)) ??
          0;

      if (turn == 'R') {
        direction = Direction.values[(direction.index + 1) % 4];
      } else {
        direction = Direction.values[(direction.index - 1) % 4];
      }

      switch (direction) {
        case Direction.north:
          for (int i = 0; i < distance; i++) {
            lastVisitedPoint = lastVisitedPoint.add((x: 0, y: 1));
          }
        case Direction.east:
          for (int i = 0; i < distance; i++) {
            lastVisitedPoint = lastVisitedPoint.add((x: 1, y: 0));
          }
        case Direction.south:
          for (int i = 0; i < distance; i++) {
            lastVisitedPoint = lastVisitedPoint.add((x: 0, y: -1));
          }
        case Direction.west:
          for (int i = 0; i < distance; i++) {
            lastVisitedPoint = lastVisitedPoint.add((x: -1, y: 0));
          }
      }
    }

    final shortestPath = (lastVisitedPoint.x - startingPoint.x).abs() +
        (lastVisitedPoint.y - startingPoint.y).abs();
    return shortestPath;
  }

  @override
  int second(String input) {
    const startingPoint = (x: 0, y: 0);
    final visitedPoints = <Point>{startingPoint};

    var lastVisitedPoint = (x: 0, y: 0);
    var direction = Direction.north;

    for (final instruction in input.split(', ')) {
      final turn = RegExp(r'[A-Z]{1}').stringMatch(instruction);
      final distance = RegExp(r'\d+')
              .stringMatch(instruction)
              ?.let((it) => int.tryParse(it)) ??
          0;

      if (turn == 'R') {
        direction = Direction.values[(direction.index + 1) % 4];
      } else {
        direction = Direction.values[(direction.index - 1) % 4];
      }

      switch (direction) {
        case Direction.north:
          for (int i = 0; i < distance; i++) {
            lastVisitedPoint = lastVisitedPoint.add((x: 0, y: 1));
            if (visitedPoints.contains(lastVisitedPoint)) {
              return (lastVisitedPoint.x - startingPoint.x).abs() +
                  (lastVisitedPoint.y - startingPoint.y).abs();
            } else {
              visitedPoints.add(lastVisitedPoint);
            }
          }
          break;
        case Direction.east:
          for (int i = 0; i < distance; i++) {
            lastVisitedPoint = lastVisitedPoint.add((x: 1, y: 0));
            if (visitedPoints.contains(lastVisitedPoint)) {
              return (lastVisitedPoint.x - startingPoint.x).abs() +
                  (lastVisitedPoint.y - startingPoint.y).abs();
            } else {
              visitedPoints.add(lastVisitedPoint);
            }
          }
          break;
        case Direction.south:
          for (int i = 0; i < distance; i++) {
            lastVisitedPoint = lastVisitedPoint.add((x: 0, y: -1));
            if (visitedPoints.contains(lastVisitedPoint)) {
              return (lastVisitedPoint.x - startingPoint.x).abs() +
                  (lastVisitedPoint.y - startingPoint.y).abs();
            } else {
              visitedPoints.add(lastVisitedPoint);
            }
          }
          break;
        case Direction.west:
          for (int i = 0; i < distance; i++) {
            lastVisitedPoint = lastVisitedPoint.add((x: -1, y: 0));
            if (visitedPoints.contains(lastVisitedPoint)) {
              return (lastVisitedPoint.x - startingPoint.x).abs() +
                  (lastVisitedPoint.y - startingPoint.y).abs();
            } else {
              visitedPoints.add(lastVisitedPoint);
            }
          }
          break;
      }
    }

    return 0; // Default return if no location is visited twice
  }
}

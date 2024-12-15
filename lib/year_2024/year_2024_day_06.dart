import 'package:aoc/solution.dart';
import 'package:aoc/utilities/types.dart';

final class Year2024Day06 implements Solution<int, int> {
  static final _directions = [(0, -1), (1, 0), (0, 1), (-1, 0)];

  @override
  int first(String input, {bool inTestMode = false}) {
    final positionsGrid =
        input.split('\n').map((item) => item.split('')).toList();

    Point guardsPosition = (x: -1, y: -1);
    int currentDirectionIndex = 0;
    Set<Point> visitedPositions = {};

    for (int y = 0; y < positionsGrid.length; y++) {
      for (int x = 0; x < positionsGrid[y].length; x++) {
        if (positionsGrid[y][x] == '^') {
          guardsPosition = (x: x, y: y);
          visitedPositions.add(guardsPosition);
          break;
        }
      }

      if (guardsPosition.x != -1) {
        break;
      }
    }

    while (true) {
      final (directionX, directionY) = _directions[currentDirectionIndex];
      final nextX = guardsPosition.x + directionX;
      final nextY = guardsPosition.y + directionY;

      if (nextX < 0 ||
          nextX >= positionsGrid[0].length ||
          nextY < 0 ||
          nextY >= positionsGrid.length) {
        break;
      }

      if (positionsGrid[nextY][nextX] == '#') {
        currentDirectionIndex = (currentDirectionIndex + 1) % 4;
      } else {
        guardsPosition = (x: nextX, y: nextY);
        visitedPositions.add(guardsPosition);
      }
    }

    return visitedPositions.length;
  }

  @override
  int second(String input, {bool inTestMode = false}) {
    final positionsGrid =
        input.split('\n').map((item) => item.split('')).toList();

    Point guardsStartPosition = (x: -1, y: -1);
    for (int y = 0; y < positionsGrid.length; y++) {
      for (int x = 0; x < positionsGrid[y].length; x++) {
        if (positionsGrid[y][x] == '^') {
          guardsStartPosition = (x: x, y: y);
          break;
        }
      }

      if (guardsStartPosition.x != -1) {
        break;
      }
    }

    int loopPositions = 0;

    for (int y = 0; y < positionsGrid.length; y++) {
      for (int x = 0; x < positionsGrid[y].length; x++) {
        if (x == guardsStartPosition.x && y == guardsStartPosition.y) {
          continue;
        }

        if (positionsGrid[y][x] != '.') {
          continue;
        }

        final modifiedGrid = positionsGrid.map((row) => [...row]).toList();
        modifiedGrid[y][x] = '#';

        if (_isGuardStuckInLoop(modifiedGrid)) {
          loopPositions++;
        }
      }
    }

    return loopPositions;
  }

  bool _isGuardStuckInLoop(List<List<String>> grid) {
    Point guardsPosition = (x: -1, y: -1);
    for (var y = 0; y < grid.length; y++) {
      for (var x = 0; x < grid[y].length; x++) {
        if (grid[y][x] == '^') {
          guardsPosition = (x: x, y: y);
          break;
        }
      }

      if (guardsPosition.x != -1) {
        break;
      }
    }

    Set<String> visitedStates = {};
    int currentDirectionIndex = 0;

    while (true) {
      final state =
          '${guardsPosition.x},${guardsPosition.y},$currentDirectionIndex';

      if (visitedStates.contains(state)) {
        return true;
      }

      visitedStates.add(state);

      final (directionX, directionY) = _directions[currentDirectionIndex];
      final nextX = guardsPosition.x + directionX;
      final nextY = guardsPosition.y + directionY;

      if (nextX < 0 ||
          nextX >= grid[0].length ||
          nextY < 0 ||
          nextY >= grid.length) {
        return false;
      }

      if (grid[nextY][nextX] == '#') {
        currentDirectionIndex = (currentDirectionIndex + 1) % 4;
      } else {
        guardsPosition = (x: nextX, y: nextY);
      }
    }
  }
}

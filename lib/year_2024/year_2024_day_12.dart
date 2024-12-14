import 'dart:collection';

import 'package:aoc/solution.dart';
import 'package:aoc/utilities/types.dart';

typedef Region = ({String type, Set<Point> region});

final class Year2024Day12 implements Solution<int, int> {
  @override
  int first(String input) {
    final grid = input.split('\n').map((item) => item.split('')).toList();
    final visited = List.generate(
      grid.length,
      (_) => List.generate(grid[0].length, (_) => false),
    );
    final identifiedRegions = <Region>[];

    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (!visited[i][j]) {
          final region = _floodFillAlgorithm(i, j, grid[i][j], grid, visited);
          identifiedRegions.add(region);
        }
      }
    }

    return identifiedRegions
        .map((item) => _calculatePrice(item, grid))
        .reduce((previous, current) => previous + current);
  }

  @override
  int second(String input) {
    final grid = input.split('\n').map((item) => item.split('')).toList();
    final visited = List.generate(
      grid.length,
      (_) => List.generate(grid[0].length, (_) => false),
    );
    final identifiedRegions = <Region>[];

    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (!visited[i][j]) {
          final region = _floodFillAlgorithm(i, j, grid[i][j], grid, visited);
          identifiedRegions.add(region);
        }
      }
    }

    return identifiedRegions
        .map((item) => _calculateBulkPrice(item, grid))
        .reduce((previous, current) => previous + current);
  }

  Region _floodFillAlgorithm(
    int startX,
    int startY,
    String type,
    List<List<String>> grid,
    List<List<bool>> visited,
  ) {
    Queue<Point> queue = Queue();
    Set<Point> regionPoints = {};

    queue.add((x: startX, y: startY));
    visited[startX][startY] = true;

    while (queue.isNotEmpty) {
      Point current = queue.removeFirst();
      regionPoints.add(current);

      List<Point> directions = [
        (x: current.x - 1, y: current.y),
        (x: current.x + 1, y: current.y),
        (x: current.x, y: current.y - 1),
        (x: current.x, y: current.y + 1),
      ];

      for (Point direction in directions) {
        if (_isValidPoint(direction, grid) &&
            !visited[direction.x][direction.y] &&
            grid[direction.x][direction.y] == type) {
          queue.add(direction);
          visited[direction.x][direction.y] = true;
        }
      }
    }

    return (type: type, region: regionPoints);
  }

  int _calculatePrice(Region region, List<List<String>> grid) {
    int perimeter = 0;

    for (Point point in region.region) {
      final directions = [
        (x: point.x - 1, y: point.y),
        (x: point.x + 1, y: point.y),
        (x: point.x, y: point.y - 1),
        (x: point.x, y: point.y + 1),
      ];

      for (final direction in directions) {
        if (!region.region.contains(direction) ||
            !_isValidPoint(direction, grid)) {
          perimeter++;
        }
      }
    }

    return region.region.length * perimeter;
  }

  int _calculateBulkPrice(Region region, List<List<String>> grid) {
    int perimeter = 0;

    for (Point point in region.region) {
      bool left = !region.region.contains((x: point.x - 1, y: point.y));
      bool right = !region.region.contains((x: point.x + 1, y: point.y));
      bool up = !region.region.contains((x: point.x, y: point.y - 1));
      bool down = !region.region.contains((x: point.x, y: point.y + 1));

      if (left && up) {
        perimeter++;
      }

      if (up && right) {
        perimeter++;
      }

      if (right && down) {
        perimeter++;
      }

      if (down && left) {
        perimeter++;
      }

      if (!left &&
          !up &&
          !region.region.contains((x: point.x - 1, y: point.y - 1))) {
        perimeter++;
      }

      if (!up &&
          !right &&
          !region.region.contains((x: point.x + 1, y: point.y - 1))) {
        perimeter++;
      }

      if (!right &&
          !down &&
          !region.region.contains((x: point.x + 1, y: point.y + 1))) {
        perimeter++;
      }

      if (!down &&
          !left &&
          !region.region.contains((x: point.x - 1, y: point.y + 1))) {
        perimeter++;
      }
    }

    return region.region.length * perimeter;
  }
}

bool _isValidPoint(Point point, List<List<String>> grid) {
  return point.x >= 0 &&
      point.x < grid.length &&
      point.y >= 0 &&
      point.y < grid[0].length;
}

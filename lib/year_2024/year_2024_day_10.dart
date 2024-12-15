import 'package:aoc/solution.dart';
import 'package:aoc/utilities/types.dart';

final class Year2024Day10 implements Solution<int, int> {
  @override
  int first(String input, {bool inTestMode = false}) {
    int totalTrailheadScore = 0;

    final grid = input.split('\n').map((line) => line.split('')).toList();
    for (int y = 0; y < grid.length; y++) {
      for (int x = 0; x < grid[y].length; x++) {
        if (grid[y][x] == '0') {
          final score = _findTrailheadScore(grid, x, y);
          totalTrailheadScore += score;
        }
      }
    }

    return totalTrailheadScore;
  }

  @override
  int second(String input, {bool inTestMode = false}) {
    int totalTrailheadRating = 0;

    final grid = input.split('\n').map((line) => line.split('')).toList();
    for (int y = 0; y < grid.length; y++) {
      for (int x = 0; x < grid[y].length; x++) {
        if (grid[y][x] == '0') {
          final rating = _findTrailheadRating(grid, x, y);
          totalTrailheadRating += rating;
        }
      }
    }

    return totalTrailheadRating;
  }

  int _findTrailheadScore(List<List<String>> grid, int startX, int startY) {
    final positionsOfHilltops = <Point>{};

    void depthFirstSearch(
      int x,
      int y,
      int currentHeight,
      Set<Point> currentPath,
    ) {
      if (y < 0 || y >= grid.length || x < 0 || x >= grid[y].length) {
        return;
      }

      final currentCellHeight = int.parse(grid[y][x]);
      if (currentCellHeight != currentHeight + 1) {
        return;
      }

      final newPath = {...currentPath, (x: x, y: y)};

      if (currentHeight == 8) {
        positionsOfHilltops.add((x: x, y: y));
        return;
      }

      depthFirstSearch(x + 1, y, currentHeight + 1, newPath);
      depthFirstSearch(x - 1, y, currentHeight + 1, newPath);
      depthFirstSearch(x, y + 1, currentHeight + 1, newPath);
      depthFirstSearch(x, y - 1, currentHeight + 1, newPath);
    }

    final searches = [
      (startX + 1, startY),
      (startX - 1, startY),
      (startX, startY + 1),
      (startX, startY - 1),
      (startX, startY)
    ];

    for (final (x, y) in searches) {
      depthFirstSearch(x, y, 0, {(x: startX, y: startY)});
    }

    return positionsOfHilltops.length;
  }

  int _findTrailheadRating(List<List<String>> grid, int startX, int startY) {
    final distinctPaths = <List<Point>>{};

    void depthFirstSearch(
      int x,
      int y,
      int currentHeight,
      List<Point> currentPath,
    ) {
      if (y < 0 || y >= grid.length || x < 0 || x >= grid[y].length) {
        return;
      }

      final currentCellHeight = int.parse(grid[y][x]);
      if (currentCellHeight != currentHeight + 1) {
        return;
      }

      final newPath = [...currentPath, (x: x, y: y)];

      if (currentHeight == 8) {
        distinctPaths.add(newPath);
        return;
      }

      depthFirstSearch(x + 1, y, currentHeight + 1, newPath);
      depthFirstSearch(x - 1, y, currentHeight + 1, newPath);
      depthFirstSearch(x, y + 1, currentHeight + 1, newPath);
      depthFirstSearch(x, y - 1, currentHeight + 1, newPath);
    }

    final searches = [
      (startX + 1, startY),
      (startX - 1, startY),
      (startX, startY + 1),
      (startX, startY - 1),
      (startX, startY)
    ];

    for (final (x, y) in searches) {
      depthFirstSearch(x, y, 0, [(x: startX, y: startY)]);
    }

    return distinctPaths.length;
  }
}

import 'package:aoc/solution.dart';
import 'package:aoc/utilities/types.dart';

final class Year2024Day08 implements Solution<int, int> {
  @override
  int first(String input) {
    final lines = input.split('\n');
    final antennas = <String, List<Point>>{};
    final antinodes = <Point>{};

    for (int y = 0; y < lines.length; y++) {
      for (int x = 0; x < lines[y].length; x++) {
        final item = lines[y][x];
        if (item != '.') {
          antennas.putIfAbsent(item, () => []).add((x: x, y: y));
        }
      }
    }

    for (final entry in antennas.entries) {
      final points = entry.value;
      for (int i = 0; i < points.length; i++) {
        for (int j = i + 1; j < points.length; j++) {
          final point1 = points[i];
          final point2 = points[j];
          final delta = (x: point2.x - point1.x, y: point2.y - point1.y);

          final antinode1 = (x: point1.x - delta.x, y: point1.y - delta.y);
          final antinode2 = (x: point2.x + delta.x, y: point2.y + delta.y);

          if (_isAntinodeWithinBounds(antinode1, lines[0].length)) {
            antinodes.add(antinode1);
          }

          if (_isAntinodeWithinBounds(antinode2, lines[0].length)) {
            antinodes.add(antinode2);
          }
        }
      }
    }

    return antinodes.length;
  }

  @override
  int second(String input) {
    final lines = input.split('\n');
    final antennas = <String, List<Point>>{};
    final antinodes = <Point>{};

    for (int y = 0; y < lines.length; y++) {
      for (int x = 0; x < lines[y].length; x++) {
        final item = lines[y][x];
        if (item != '.') {
          antennas.putIfAbsent(item, () => []).add((x: x, y: y));
        }
      }
    }

    for (final entry in antennas.entries) {
      final points = entry.value;
      for (int i = 0; i < points.length; i++) {
        for (int j = i + 1; j < points.length; j++) {
          final point1 = points[i];
          final point2 = points[j];
          final delta = (x: point2.x - point1.x, y: point2.y - point1.y);

          var start = point1;

          while (_isAntinodeWithinBounds(
            (x: start.x - delta.x, y: start.y - delta.y),
            lines[0].length,
          )) {
            start = (x: start.x - delta.x, y: start.y - delta.y);
          }

          while (_isAntinodeWithinBounds(start, lines[0].length)) {
            antinodes.add(start);
            start = (x: start.x + delta.x, y: start.y + delta.y);
          }
        }
      }
    }

    return antinodes.length;
  }

  bool _isAntinodeWithinBounds(Point point, int width) =>
      point.x >= 0 && point.x < width && point.y >= 0 && point.y < width;
}

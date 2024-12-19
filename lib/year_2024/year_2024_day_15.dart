import 'package:aoc/solution.dart';
import 'package:aoc/utilities/scope_functions.dart';

final class Point2D {
  static const up = Point2D(0, -1);
  static const right = Point2D(1, 0);
  static const down = Point2D(0, 1);
  static const left = Point2D(-1, 0);

  final int x;
  final int y;

  const Point2D(this.x, this.y);

  Point2D operator +(Point2D other) => Point2D(x + other.x, y + other.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point2D &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

final class Year2024Day15 implements Solution<int, int> {
  @override
  int first(String input) {
    final (warehouse, moves) = input.split('\n\n').let((it) => (
          it.first.split('\n').map((item) => item.split('')).toList(),
          it.last
              .split('\n')
              .expand((item) => item.split('').map(_characterToDirection))
              .toList(),
        ));

    final result = _performMoves(warehouse, moves);
    return _findAll(result, 'O')
        .map(_gps)
        .reduce((previous, current) => previous + current);
  }

  @override
  int second(String input) {
    final (warehouse, moves) = input.split('\n\n').let((it) => (
          it.first.split('\n').map((item) => item.split('')).toList(),
          it.last
              .split('\n')
              .expand((item) => item.split('').map(_characterToDirection))
              .toList(),
        ));

    final scaledUpWarehouse = _scaleUp(warehouse);
    final result = _performMoves(scaledUpWarehouse, moves);
    return _findAll(result, '[')
        .map(_gps)
        .reduce((previous, current) => previous + current);
  }

  List<List<String>> _performMoves(
    List<List<String>> warehouse,
    List<Point2D> moves,
  ) {
    final start = _findAll(warehouse, '@').single;
    Point2D current = start;

    for (final direction in moves) {
      final next = current + direction;
      final nextCharacter = warehouse[next.y][next.x];

      if (['[', 'O', ']'].contains(nextCharacter)) {
        final pointsToMove = _pointsToMove(warehouse, next, direction);
        if (pointsToMove.isNotEmpty) {
          current = next;
          for (final point in pointsToMove) {
            final nextPoint = point + direction;
            warehouse[nextPoint.y][nextPoint.x] = warehouse[point.y][point.x];
            warehouse[point.y][point.x] = '.';
          }
        }
      } else if (nextCharacter != '#') {
        current = next;
      }
    }

    return warehouse;
  }

  List<Point2D> _pointsToMove(
    List<List<String>> warehouse,
    Point2D startingPosition,
    Point2D direction,
  ) {
    final queue = <Point2D>[startingPosition];
    final seen = <Point2D>{};
    final toMove = <Point2D>[];

    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);
      if (seen.contains(current)) continue;
      seen.add(current);
      toMove.add(current);

      if (direction == Point2D.up || direction == Point2D.down) {
        final currentChar = warehouse[current.y][current.x];
        if (currentChar == '[') queue.add(current + Point2D.right);
        if (currentChar == ']') queue.add(current + Point2D.left);
      }

      final next = current + direction;
      final nextCharacter = warehouse[next.y][next.x];
      if (['[', 'O', ']'].contains(nextCharacter)) {
        queue.add(next);
      } else if (nextCharacter == '#') {
        return [];
      }
    }

    return toMove.reversed.toList();
  }

  List<Point2D> _findAll(List<List<String>> warehouse, String char) {
    final points = <Point2D>[];
    for (int y = 0; y < warehouse.length; y++) {
      for (int x = 0; x < warehouse[y].length; x++) {
        if (warehouse[y][x] == char) {
          points.add(Point2D(x, y));
        }
      }
    }

    return points;
  }

  List<List<String>> _scaleUp(List<List<String>> warehouse) {
    return warehouse.map((row) {
      return row
          .map((item) => switch (item) {
                '#' => '##',
                'O' => '[]',
                '.' => '..',
                '@' => '@.',
                _ => throw Exception('Invalid character: $item'),
              })
          .join('')
          .split('')
          .toList();
    }).toList();
  }

  Point2D _characterToDirection(String character) => switch (character) {
        '^' => Point2D.up,
        '>' => Point2D.right,
        'v' => Point2D.down,
        '<' => Point2D.left,
        _ => throw Exception('Invalid direction: $character'),
      };

  int _gps(Point2D point) => 100 * point.y + point.x;
}

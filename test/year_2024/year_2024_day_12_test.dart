import 'package:aoc/year_2024/year_2024_day_12.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 12', () {
    final solution = Year2024Day12();
    final input = [
      'RRRRIICCFF',
      'RRRRIICCCF',
      'VVRRRCCFFF',
      'VVRCCCJFFF',
      'VVVVCJJCFE',
      'VVIVCCJJEE',
      'VVIIICJJEE',
      'MIIIIIJJEE',
      'MIIISIJEEE',
      'MMMISSJEEE',
    ].join('\n');

    test('first', () {
      expect(solution.first(input), equals(1930));
    });

    test('second', () {
      expect(solution.second(input), equals(1206));
    });
  });
}

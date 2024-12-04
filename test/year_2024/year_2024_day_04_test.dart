import 'package:aoc/year_2024/year_2024_day_04.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 4', () {
    final solution = Year2024Day04();
    final input = [
      'MMMSXXMASM',
      'MSAMXMSMSA',
      'AMXSXMAAMM',
      'MSAMASMSMX',
      'XMASAMXAMM',
      'XXAMMXXAMA',
      'SMSMSASXSS',
      'SAXAMASAAA',
      'MAMMMXMMMM',
      'MXMXAXMASX',
    ].join('\n');

    test('first', () {
      expect(solution.first(input), equals(18));
    });

    test('second', () {
      expect(solution.second(input), equals(9));
    });
  });
}

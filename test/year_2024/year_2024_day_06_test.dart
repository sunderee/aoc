import 'package:aoc/year_2024/year_2024_day_06.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 6', () {
    final solution = Year2024Day06();
    final input = [
      '....#.....',
      '.........#',
      '..........',
      '..#.......',
      '.......#..',
      '..........',
      '.#..^.....',
      '........#.',
      '#.........',
      '......#...',
    ].join('\n');

    test('first', () {
      expect(solution.first(input), equals(41));
    });

    test('second', () {
      expect(solution.second(input), equals(6));
    });
  });
}

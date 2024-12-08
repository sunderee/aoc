import 'package:aoc/year_2024/year_2024_day_08.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 8', () {
    final solution = Year2024Day08();
    final input = [
      '............',
      '........0...',
      '.....0......',
      '.......0....',
      '....0.......',
      '......A.....',
      '............',
      '............',
      '........A...',
      '.........A..',
      '............',
      '............',
    ].join('\n');

    test('first', () {
      expect(solution.first(input), equals(14));
    });

    test('second', () {
      expect(solution.second(input), equals(34));
    });
  });
}

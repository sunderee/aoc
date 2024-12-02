import 'package:aoc/year_2024/year_2024_day_02.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 2', () {
    final solution = Year2024Day02();
    final input = [
      '7 6 4 2 1',
      '1 2 7 8 9',
      '9 7 6 2 1',
      '1 3 2 4 5',
      '8 6 4 4 1',
      '1 3 6 7 9',
    ].join('\n');

    test('first', () {
      expect(solution.first(input), equals(2));
    });

    test('second', () {
      expect(solution.second(input), equals(4));
    });
  });
}

import 'package:aoc/year_2024/year_2024_day_11.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 11', () {
    final solution = Year2024Day11();

    test('first', () {
      const input = '125 17';
      expect(solution.first(input), equals(55312));
    });
  });
}

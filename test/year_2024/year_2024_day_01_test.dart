import 'package:aoc/year_2024/year_2024_day_01.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 1', () {
    final solution = Year2024Day01();

    test('first', () {
      final input = [
        '3   4',
        '4   3',
        '2   5',
        '1   3',
        '3   9',
        '3   3',
      ].join('\n');
      expect(solution.first(input), equals(11));
    });

    test('second', () {
      final input = [
        '3   4',
        '4   3',
        '2   5',
        '1   3',
        '3   9',
        '3   3',
      ].join('\n');
      expect(solution.second(input), equals(31));
    });
  });
}

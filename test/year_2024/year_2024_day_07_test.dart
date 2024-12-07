import 'package:aoc/year_2024/year_2024_day_07.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 7', () {
    final solution = Year2024Day07();
    final input = [
      '190: 10 19',
      '3267: 81 40 27',
      '83: 17 5',
      '156: 15 6',
      '7290: 6 8 6 15',
      '161011: 16 10 13',
      '192: 17 8 14',
      '21037: 9 7 18 13',
      '292: 11 6 16 20',
    ].join('\n');

    test('first', () {
      expect(solution.first(input), equals(3749));
    });

    test('second', () {
      expect(solution.second(input), equals(11387));
    });
  });
}

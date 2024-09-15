import 'package:aoc/year_2015/year_2015_day_06.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2015, day 6', () {
    final solution = Year2015Day06();

    test('first', () {
      final testInput = [
        'turn on 0,0 through 999,999',
        'toggle 0,0 through 999,0',
        'turn off 499,499 through 500,500',
      ];

      expect(solution.first(testInput.join('\n')), equals(998996));
    });

    test('second', () {
      final testInput = [
        'turn on 0,0 through 0,0',
        'toggle 0,0 through 999,999',
      ];

      expect(solution.second(testInput.join('\n')), equals(2000001));
    });
  });
}

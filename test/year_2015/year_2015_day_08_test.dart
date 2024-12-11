import 'package:aoc/year_2015/year_2015_day_08.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2015, day 8', () {
    final solution = Year2015Day08();
    final input = [
      '""',
      '"abc"',
      '"aaa\\"aaa"',
      '"\\x27"',
    ].join('\n');

    test('first', () {
      expect(solution.first(input), equals(12));
    });

    test('second', () {
      expect(solution.second(input), equals(19));
    });
  });
}

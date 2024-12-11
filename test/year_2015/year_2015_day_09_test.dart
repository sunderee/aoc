import 'package:aoc/year_2015/year_2015_day_09.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2015, day 9', () {
    final solution = Year2015Day09();
    final input = [
      'London to Dublin = 464',
      'London to Belfast = 518',
      'Dublin to Belfast = 141',
    ].join('\n');

    test('first', () {
      expect(solution.first(input), equals(605));
    });

    test('second', () {
      expect(solution.second(input), equals(982));
    });
  });
}

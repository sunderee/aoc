import 'package:aoc/year_2015/year_2015_day_03.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2015, day 3', () {
    final solution = Year2015Day03();

    test('first', () {
      expect(solution.first('>'), 2);
      expect(solution.first('^>v<'), 4);
      expect(solution.first('^v^v^v^v^v'), 2);
    });

    test('second', () {
      expect(solution.second('^v'), 3);
      expect(solution.second('^>v<'), 3);
      expect(solution.second('^v^v^v^v^v'), 11);
    });
  });
}

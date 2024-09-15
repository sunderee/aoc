import 'package:aoc/year_2015/year_2015_day_06.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2015, day 6', () {
    final solution = Year2015Day06();

    test('first', () {
      expect(solution.first(''), equals(-1));
    });

    test('second', () {
      expect(solution.second(''), equals(-1));
    });
  });
}

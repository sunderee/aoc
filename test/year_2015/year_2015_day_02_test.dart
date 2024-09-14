import 'package:aoc/year_2015/year_2015_day_02.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2015, day 2', () {
    final solution = Year2015Day02();

    test('first', () {
      expect(solution.first('2x3x4'), 58);
      expect(solution.first('1x1x10'), 43);
    });

    test('second', () {
      expect(solution.second('2x3x4'), 34);
      expect(solution.second('1x1x10'), 14);
    });
  });
}

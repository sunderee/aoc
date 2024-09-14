import 'package:aoc/year_2015/year_2015_day_01.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2015, day 1', () {
    final solution = Year2015Day01();

    test('first', () {
      expect(solution.first('(()(()('), 3);
      expect(solution.first('((('), 3);
      expect(solution.first(')())())'), -3);
    });

    test('second', () {
      expect(solution.second(')'), 1);
      expect(solution.second('()())'), 5);
    });
  });
}

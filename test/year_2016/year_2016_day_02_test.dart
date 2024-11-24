import 'package:aoc/year_2016/year_2016_day_02.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2016, day 2', () {
    final solution = Year2016Day02();
    final input = ['ULL', 'RRDDD', 'LURDL', 'UUUUD'].join('\n');

    test('first', () {
      expect(solution.first(input), equals('1985'));
    });

    test('second', () {
      expect(solution.second(input), equals('5DB3'));
    });
  });
}

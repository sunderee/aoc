import 'package:aoc/year_2024/year_2024_day_14.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 14', () {
    final solution = Year2024Day14();

    test('first', () {
      expect(solution.first(''), equals(-1));
    });

    test('second', () {
      expect(solution.second(''), equals(-1));
    });
  });
}

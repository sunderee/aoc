import 'package:aoc/year_2024/year_2024_day_14.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 14', () {
    final solution = Year2024Day14();
    final input = [
      'p=0,4 v=3,-3',
      'p=6,3 v=-1,-3',
      'p=10,3 v=-1,2',
      'p=2,0 v=2,-1',
      'p=0,0 v=1,3',
      'p=3,0 v=-2,-2',
      'p=7,6 v=-1,-3',
      'p=3,0 v=-1,-2',
      'p=9,3 v=2,3',
      'p=7,3 v=-1,2',
      'p=2,4 v=2,-3',
      'p=9,5 v=-3,-3',
    ].join('\n');

    test('first', () {
      expect(solution.first(input, inTestMode: true), equals(12));
    });

    test('second', () {
      expect(solution.second(input, inTestMode: true), equals(-1));
    });
  });
}

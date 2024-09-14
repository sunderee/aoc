import 'package:aoc/year_2015/year_2015_day_04.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2015, day 4', () {
    final solution = Year2015Day04();

    test('first', () {
      expect(solution.first('abcdef'), 609043);
      expect(solution.first('pqrstuv'), 1048970);
    });
  });
}

import 'package:aoc/year_2021/year_2021_day_06.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2021, day 6', () {
    final solution = Year2021Day06();
    const input = '3,4,3,1,2';

    test('first', () {
      expect(solution.first(input), equals(5934));
    });

    test('second', () {
      expect(solution.second(input), equals(26984457539));
    });
  });
}

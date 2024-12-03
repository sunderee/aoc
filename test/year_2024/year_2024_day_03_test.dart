import 'package:aoc/year_2024/year_2024_day_03.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 3', () {
    final solution = Year2024Day03();

    test('first', () {
      const input =
          'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))';
      expect(solution.first(input), equals(161));
    });

    test('second', () {
      const input =
          r'''xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))''';
      expect(solution.second(input), equals(48));
    });
  });
}

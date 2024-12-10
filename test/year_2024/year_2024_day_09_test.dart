import 'package:aoc/year_2024/year_2024_day_09.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 9', () {
    final solution = Year2024Day09();
    const input = '2333133121414131402';

    test('first', () {
      expect(solution.first(input), equals(1928));
    });

    test('second', () {
      expect(solution.second(input), equals(2858));
    });
  });
}

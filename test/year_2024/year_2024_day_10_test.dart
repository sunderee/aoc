import 'package:aoc/year_2024/year_2024_day_10.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 10', () {
    final solution = Year2024Day10();
    final input = [
      '89010123',
      '78121874',
      '87430965',
      '96549874',
      '45678903',
      '32019012',
      '01329801',
      '10456732',
    ].join('\n');

    test('first', () {
      expect(solution.first(input), equals(36));
    });

    test('second', () {
      expect(solution.second(input), equals(81));
    });
  });
}

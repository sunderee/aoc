import 'package:aoc/year_2016/year_2016_day_01.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2016, day 1', () {
    final solution = Year2016Day01();

    test('first', () {
      final inputs = [
        'R2, L3',
        'R2, R2, R2',
        'R5, L5, R5, R3',
      ];
      final solutions = [5, 2, 12];

      for (int i = 0; i < inputs.length; i++) {
        expect(solution.first(inputs[i]), equals(solutions[i]));
      }
    });

    test('second', () {
      const input = 'R8, R4, R4, R8';
      expect(solution.second(input), equals(4));
    });
  });
}

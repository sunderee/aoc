import 'package:aoc/year_2015/year_2015_day_05.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2015, day 5', () {
    final solution = Year2015Day05();

    test('first', () {
      final testInput = [
        'ugknbfddgicrmopn',
        'aaa',
        'jchzalrnumimnmhp',
        'haegwjzuvuyypxyu',
        'dvszwmarrgswjxmb'
      ];

      expect(solution.first(testInput.join('\n')), equals(2));
    });

    test('second', () {
      final testInput = [
        'qjhvhtzxzqqjkmpb',
        'xxyxx',
        'uurcxstgmygtbstg',
        'ieodomkazucvgmuy'
      ];

      expect(solution.second(testInput.join('\n')), equals(2));
    });
  });
}

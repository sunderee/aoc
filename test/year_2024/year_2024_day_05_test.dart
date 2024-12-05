import 'package:aoc/year_2024/year_2024_day_05.dart';
import 'package:test/test.dart';

void main() {
  group('Year 2024, day 5', () {
    final solution = Year2024Day05();
    final input = [
      '47|53',
      '97|13',
      '97|61',
      '97|47',
      '75|29',
      '61|13',
      '75|53',
      '29|13',
      '97|29',
      '53|29',
      '61|53',
      '97|53',
      '61|29',
      '47|13',
      '75|47',
      '97|75',
      '47|61',
      '75|61',
      '47|29',
      '75|13',
      '53|13',
      '',
      '75,47,61,53,29',
      '97,61,53,29,13',
      '75,29,13',
      '75,97,47,61,53',
      '61,13,29',
      '97,13,75,29,47',
    ].join('\n');

    test('first', () {
      expect(solution.first(input), equals(143));
    });

    test('second', () {
      expect(solution.second(input), equals(123));
    });
  });
}

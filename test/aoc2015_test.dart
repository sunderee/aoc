import 'package:aoc/aoc.dart';
import 'package:test/test.dart';

void main() {
  group('2015 day 1', () {
    final solution = Year2015Day01();

    test('part 1', () async {
      final result = await solution.first(isTest: true);
      expect(result, equals(-1));
    });

    test('part 2', () async {
      final result = await solution.second(isTest: true);
      expect(result, equals(5));
    });
  });

  group('2015 day 2', () {
    final solution = Year2015Day02();

    test('part 1', () async {
      final result = await solution.first(isTest: true);
      expect(result, equals(101));
    });

    test('part 2', () async {
      final result = await solution.second(isTest: true);
      expect(result, equals(48));
    });
  });

  group('2015 day 3', () {
    final solution = Year2015Day03();

    test('part 1', () async {
      final result = await solution.first(isTest: true);
      expect(result, equals(2));
    });

    test('part 2', () async {
      final result = await solution.second(isTest: true);
      expect(result, equals(11));
    });
  });

  group('2015 day 4', () {
    final solution = Year2015Day04();

    test('part 1', () async {
      final result = await solution.first(isTest: true);
      expect(result, equals(1048970));
    });

    test('part 2', () async {
      final result = await solution.second(isTest: true);
      expect(result, equals(5714438));
    });
  });

  group('2015 day 5', () {
    final solution = Year2015Day05();

    test('part 1', () async {
      final result = await solution.first(isTest: true);
      expect(result, equals(2));
    });

    test('part 2', () async {
      final result = await solution.second(isTest: true);
      expect(result, equals(0));
    });
  });

  group('2015 day 6', () {
    final solution = Year2015Day06();

    test('part 1', () async {
      final result = await solution.first(isTest: true);
      expect(result, equals(998996));
    });

    test('part 2', () async {
      final result = await solution.second(isTest: true);
      expect(result, equals(1001996));
    });
  });
}

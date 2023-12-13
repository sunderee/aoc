import 'package:aoc/aoc.dart';
import 'package:dart_scope_functions/dart_scope_functions.dart';

Future<void> main(List<String> arguments) async {
  print('--- 2015 DAY 1 ---');
  final year2015Day1 = await Year2015Day01().let(
    (it) async => (
      await it.first(),
      await it.second(),
    ),
  );
  print('What floor does Santa end up in: ${year2015Day1.$1}');
  print('At what character position is he in basement: ${year2015Day1.$2}');

  print('\n--- 2015 DAY 2 ---');
  final year2015Day2 = await Year2015Day02().let(
    (it) async => (
      await it.first(),
      await it.second(),
    ),
  );
  print('Total square feet of wrapping paper to order: ${year2015Day2.$1}');
  print('Total feet of ribbon to order: ${year2015Day2.$2}');

  print('\n--- 2015 DAY 3 ---');
  final year2015Day3 = await Year2015Day03().let(
    (it) async => (
      await it.first(),
      await it.second(),
    ),
  );
  print('# of houses receiving at least 1 present part 1: ${year2015Day3.$1}');
  print('# of houses receiving at least 1 present part 2: ${year2015Day3.$2}');
}

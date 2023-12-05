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
}

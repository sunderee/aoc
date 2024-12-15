import 'package:aoc/solution.dart';

final class Year2015Day10 implements Solution<int, int> {
  @override
  int first(String input) => _lookAndSayResult(input, 40);

  @override
  int second(String input) => _lookAndSayResult(input, 50);

  int _lookAndSayResult(String input, int numberOfRepetitions) {
    while (numberOfRepetitions > 0) {
      input = input.replaceAllMapped(
        RegExp(r'(\d)\1*'),
        (match) => '${match.group(0)?.length}${match.group(1)}',
      );

      numberOfRepetitions--;
    }

    return input.length;
  }
}

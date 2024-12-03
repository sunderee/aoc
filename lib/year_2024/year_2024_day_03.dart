import 'package:aoc/solution.dart';
import 'package:aoc/utilities/scope_functions.dart';

final class Year2024Day03 implements Solution<int, int> {
  @override
  int first(String input) => RegExp(r'mul\(\d+\,\d+\)')
      .allMatches(input)
      .map((item) => item.group(0)?.let((it) => (
            RegExp(r'(?<=mul\()\d+').stringMatch(it),
            RegExp(r'(?<=\,)\d+(?=\))').stringMatch(it)
          )))
      .whereType<(String, String)>()
      .map((item) => int.parse(item.$1) * int.parse(item.$2))
      .reduce((previous, current) => previous + current);

  @override
  int second(String input) {
    bool isEnabled = true;
    List<int> multiplicationResults = [];

    for (final match
        in RegExp(r'''mul\(\d+,\d+\)|do\(\)|don\'t\(\)''').allMatches(input)) {
      final item = match.group(0);
      if (item == null) {
        continue;
      }

      if (item == 'do()') {
        isEnabled = true;
      } else if (item == 'don\'t()') {
        isEnabled = false;
      }

      if (isEnabled && item.startsWith('mul(')) {
        final resultCandidate = (
          RegExp(r'(?<=mul\()\d+').stringMatch(item),
          RegExp(r'(?<=\,)\d+(?=\))').stringMatch(item)
        )
            .takeIf((it) => it.$1 != null && it.$2 != null)
            ?.let((it) => (int.parse(it.$1!), int.parse(it.$2!)))
            .let((it) => it.$1 * it.$2);
        if (resultCandidate != null) {
          multiplicationResults.add(resultCandidate);
        }
      }
    }

    return multiplicationResults
        .reduce((previous, current) => previous + current);
  }
}

import 'package:aoc/solution.dart';

final class Year2015Day05 implements Solution<int, int> {
  @override
  int first(String input) {
    return input.split('\n').where(_niceString).length;
  }

  @override
  int second(String input) {
    return input.split('\n').where(_betterNiceString).length;
  }

  bool _niceString(String input) {
    final vowelRegex = RegExp(r'[aeiou]');
    final doubleLetterRegex = RegExp(r'(.)\1');
    final blacklistRegex = RegExp(r'ab|cd|pq|xy');

    return vowelRegex.allMatches(input).length >= 3 &&
        doubleLetterRegex.hasMatch(input) &&
        !blacklistRegex.hasMatch(input);
  }

  bool _betterNiceString(String input) {
    final repeatNoOverlapRegex = RegExp(r'([a-z]{2}).*\1');
    final repeatWithLetterBetweenRegex = RegExp(r'([a-z]).\1');

    return repeatNoOverlapRegex.hasMatch(input) &&
        repeatWithLetterBetweenRegex.hasMatch(input);
  }
}

import 'package:aoc/solution.dart';
import 'package:aoc/src/data/reader.dart';
import 'package:collection/collection.dart';
import 'package:dart_scope_functions/dart_scope_functions.dart';

final class Year2015Day05 implements Solution<int, int> {
  @override
  Future<int> first({bool isTest = false}) async {
    final input = await readInputData(2015, 5, isTest);
    return input
        .split('\n')
        .where((item) => _checkIsNiceFirstPart(item))
        .length;
  }

  @override
  Future<int> second({bool isTest = false}) async {
    final input = await readInputData(2015, 5, isTest);
    return input
        .split('\n')
        .where((item) => RegExp(r'(..).*\1').hasMatch(item))
        .where((item) => RegExp(r'(.).\1').hasMatch(item))
        .length;
  }

  bool _checkIsNiceFirstPart(String input) {
    const vowels = 'aeiou';
    final vowelsCount = groupBy(input.split(''), (vowel) => vowel)
        .entries
        .where((item) => vowels.split('').contains(item.key))
        .map((item) => item.value.length)
        .takeIf((it) => it.isNotEmpty)
        ?.reduce((value, element) => value + element);
    final hasAtLeastThreeVowels = vowelsCount.withDefault(0) >= 3;

    final containsAtLeastOneRepeatingLetter = [
      'aa',
      'bb',
      'cc',
      'dd',
      'ee',
      'ff',
      'gg',
      'hh',
      'ii',
      'jj',
      'kk',
      'll',
      'mm',
      'nn',
      'oo',
      'pp',
      'qq',
      'rr',
      'ss',
      'tt',
      'uu',
      'vv',
      'ww',
      'xx',
      'yy',
      'zz'
    ].any((item) => input.contains(item));

    final doesNotContainBadCombinations =
        ['ab', 'cd', 'pq', 'xy'].none((item) => input.contains(item));

    return hasAtLeastThreeVowels &&
        containsAtLeastOneRepeatingLetter &&
        doesNotContainBadCombinations;
  }
}

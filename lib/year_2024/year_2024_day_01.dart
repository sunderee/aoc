import 'package:aoc/solution.dart';
import 'package:aoc/utilities/scope_functions.dart';

final class Year2024Day01 implements Solution<int, int> {
  @override
  int first(String input) {
    final leftList = <int>[];
    final rightList = <int>[];
    for (final line in input.split('\n')) {
      final (leftNumber, rightNumber) = (
        RegExp(r'\d+(?=\s)').stringMatch(line)?.let((it) => int.tryParse(it)),
        RegExp(r'(?<=\s)\d+').stringMatch(line)?.let((it) => int.tryParse(it)),
      );
      if (leftNumber == null || rightNumber == null) {
        continue;
      }

      leftList.add(leftNumber);
      rightList.add(rightNumber);
    }

    leftList.sort();
    rightList.sort();

    final distancesArray = <int>[];
    for (int i = 0; i < leftList.length; i++) {
      final (left, right) = (leftList[i], rightList[i]);
      final distance = (left - right).abs();
      distancesArray.add(distance);
    }

    return distancesArray.fold(0, (value, element) => value + element);
  }

  @override
  int second(String input) {
    final leftList = <int>[];
    final rightList = <int>[];
    for (final line in input.split('\n')) {
      final (leftNumber, rightNumber) = (
        RegExp(r'\d+(?=\s)').stringMatch(line)?.let((it) => int.tryParse(it)),
        RegExp(r'(?<=\s)\d+').stringMatch(line)?.let((it) => int.tryParse(it)),
      );
      if (leftNumber == null || rightNumber == null) {
        continue;
      }

      leftList.add(leftNumber);
      rightList.add(rightNumber);
    }

    final similarities = <int>[];
    for (final left in leftList) {
      final occurrences = rightList.where((item) => item == left).length;
      similarities.add(left * occurrences);
    }

    return similarities.fold(0, (value, element) => value + element);
  }
}

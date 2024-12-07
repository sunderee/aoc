import 'package:aoc/solution.dart';
import 'package:aoc/utilities/scope_functions.dart';

final class Year2024Day07 implements Solution<int, int> {
  @override
  int first(String input) {
    final lines = input.split('\n');

    int totalSumOfSolvableEquations = 0;
    for (final line in lines) {
      final (solvable, result) = _canItBeSolved(line);
      if (solvable) {
        totalSumOfSolvableEquations += result;
      }
    }

    return totalSumOfSolvableEquations;
  }

  @override
  int second(String input) {
    return -1;
  }

  (bool, int) _canItBeSolved(String line) {
    final result = RegExp(r'^\d+(?=\:)', multiLine: true)
        .stringMatch(line)
        ?.let((it) => int.parse(it));
    final combinations = RegExp(r'(?<=\:\s).+')
        .stringMatch(line)
        ?.split(' ')
        .map((item) => int.parse(item))
        .toList();

    if (result == null || combinations == null) {
      return (false, -1);
    }

    for (var sequence in _generateSequences(combinations.length)) {
      if (_evaluateSequence(combinations, sequence, result)) {
        return (true, result);
      }
    }

    return (false, -1);
  }

  List<List<String>> _generateSequences(int length) {
    final operations = ['+', '*'];
    final sequences = <List<String>>[];

    void generateCombinations(List<String> current) {
      if (current.length == length - 1) {
        sequences.add(current.toList());
        return;
      }

      for (var op in operations) {
        current.add(op);
        generateCombinations(current);
        current.removeLast();
      }
    }

    generateCombinations([]);
    return sequences;
  }

  bool _evaluateSequence(
    List<int> numbers,
    List<String> operations,
    int target,
  ) {
    double result = numbers[0].toDouble();

    for (int i = 0; i < operations.length; i++) {
      if (operations[i] == '+') {
        result += numbers[i + 1];
      } else if (operations[i] == '*') {
        result *= numbers[i + 1];
      }
    }

    return result == target;
  }
}

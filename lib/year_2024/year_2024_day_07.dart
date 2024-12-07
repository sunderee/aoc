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
    final lines = input.split('\n');

    int totalSumOfSolvableEquations = 0;
    for (final line in lines) {
      final (solvable, result) = _canItBeSolved(line, withConcatenation: true);
      if (solvable) {
        totalSumOfSolvableEquations += result;
      }
    }

    return totalSumOfSolvableEquations;
  }

  (bool, int) _canItBeSolved(
    String line, {
    bool withConcatenation = false,
  }) {
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

    for (final sequence in _generateSequences(
      combinations.length,
      withConcatenation: withConcatenation,
    )) {
      if (_evaluateSequence(
        combinations,
        sequence,
        result,
        withConcatenation: withConcatenation,
      )) {
        return (true, result);
      }
    }

    return (false, -1);
  }

  List<List<String>> _generateSequences(
    int length, {
    bool withConcatenation = false,
  }) {
    final operations = withConcatenation ? ['+', '*', '||'] : ['+', '*'];
    final sequences = <List<String>>[];

    void generateCombinations(List<String> current) {
      if (current.length == length - 1) {
        sequences.add(current.toList());
        return;
      }

      for (final operation in operations) {
        current.add(operation);
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
    int target, {
    bool withConcatenation = false,
  }) {
    double result = numbers[0].toDouble();

    for (int i = 0; i < operations.length; i++) {
      if (withConcatenation) {
        switch (operations[i]) {
          case '+':
            result += numbers[i + 1];
            break;
          case '*':
            result *= numbers[i + 1];
            break;
          case '||':
            result = _concatenate(result.toInt(), numbers[i + 1]).toDouble();
            break;
        }
      } else {
        switch (operations[i]) {
          case '+':
            result += numbers[i + 1];
            break;
          case '*':
            result *= numbers[i + 1];
            break;
        }
      }
    }

    return result == target;
  }

  int _concatenate(int a, int b) => int.parse('$a$b');
}

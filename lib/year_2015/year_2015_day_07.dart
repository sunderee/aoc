import 'package:aoc/solution.dart';

final class Year2015Day07 implements Solution<int, int> {
  @override
  int first(String input) {
    final inputLines = input.split('\n');
    final circuit = <String, String>{};
    final values = <String, int>{};

    for (final line in inputLines) {
      final directAssign = RegExp(r'^(\w+) -> (\w+)$');
      final notOp = RegExp(r'^NOT (\w+) -> (\w+)$');
      final binaryOp = RegExp(r'^(\w+) (AND|OR|LSHIFT|RSHIFT) (\w+) -> (\w+)$');

      if (directAssign.hasMatch(line)) {
        final match = directAssign.firstMatch(line)!;
        circuit[match.group(2)!] = match.group(1)!;
      } else if (notOp.hasMatch(line)) {
        final match = notOp.firstMatch(line)!;
        circuit[match.group(2)!] = 'NOT ${match.group(1)!}';
      } else if (binaryOp.hasMatch(line)) {
        final match = binaryOp.firstMatch(line)!;
        circuit[match.group(4)!] =
            '${match.group(1)!} ${match.group(2)!} ${match.group(3)!}';
      }
    }

    int evaluate(String wire) {
      if (values.containsKey(wire)) return values[wire]!;

      if (int.tryParse(wire) != null) {
        return int.parse(wire);
      } else if (!circuit.containsKey(wire)) {
        throw Exception('Unknown wire: $wire');
      }

      final instruction = circuit[wire]!;
      int result;

      if (instruction.startsWith('NOT ')) {
        final operand = instruction.split(' ')[1];
        result = ~evaluate(operand) & 0xFFFF;
      } else if (instruction.contains('AND') ||
          instruction.contains('OR') ||
          instruction.contains('LSHIFT') ||
          instruction.contains('RSHIFT')) {
        final parts = instruction.split(' ');
        final left = evaluate(parts[0]);
        final right = int.tryParse(parts[2]) ?? evaluate(parts[2]);

        switch (parts[1]) {
          case 'AND':
            result = left & right;
            break;
          case 'OR':
            result = left | right;
            break;
          case 'LSHIFT':
            result = (left << right) & 0xFFFF;
            break;
          case 'RSHIFT':
            result = left >> right;
            break;
          default:
            throw Exception('Invalid operation: ${parts[1]}');
        }
      } else {
        result = evaluate(instruction);
      }

      values[wire] = result;
      return result;
    }

    return evaluate('a');
  }

  @override
  int second(String input) {
    final inputLines = input.split('\n');
    final circuit = <String, String>{};
    final values = <String, int>{};

    for (final line in inputLines) {
      final directAssign = RegExp(r'^(\w+) -> (\w+)$');
      final notOp = RegExp(r'^NOT (\w+) -> (\w+)$');
      final binaryOp = RegExp(r'^(\w+) (AND|OR|LSHIFT|RSHIFT) (\w+) -> (\w+)$');

      if (directAssign.hasMatch(line)) {
        final match = directAssign.firstMatch(line)!;
        circuit[match.group(2)!] = match.group(1)!;
      } else if (notOp.hasMatch(line)) {
        final match = notOp.firstMatch(line)!;
        circuit[match.group(2)!] = 'NOT ${match.group(1)!}';
      } else if (binaryOp.hasMatch(line)) {
        final match = binaryOp.firstMatch(line)!;
        circuit[match.group(4)!] =
            '${match.group(1)!} ${match.group(2)!} ${match.group(3)!}';
      }
    }

    int evaluate(String wire) {
      if (values.containsKey(wire)) return values[wire]!;

      if (int.tryParse(wire) != null) {
        return int.parse(wire);
      } else if (!circuit.containsKey(wire)) {
        throw Exception('Unknown wire: $wire');
      }

      final instruction = circuit[wire]!;
      int result;

      if (instruction.startsWith('NOT ')) {
        final operand = instruction.split(' ')[1];
        result = ~evaluate(operand) & 0xFFFF;
      } else if (instruction.contains('AND') ||
          instruction.contains('OR') ||
          instruction.contains('LSHIFT') ||
          instruction.contains('RSHIFT')) {
        final parts = instruction.split(' ');
        final left = evaluate(parts[0]);
        final right = int.tryParse(parts[2]) ?? evaluate(parts[2]);

        switch (parts[1]) {
          case 'AND':
            result = left & right;
            break;
          case 'OR':
            result = left | right;
            break;
          case 'LSHIFT':
            result = (left << right) & 0xFFFF;
            break;
          case 'RSHIFT':
            result = left >> right;
            break;
          default:
            throw Exception('Invalid operation: ${parts[1]}');
        }
      } else {
        result = evaluate(instruction);
      }

      values[wire] = result;
      return result;
    }

    final signalA = evaluate('a');
    values.clear();
    circuit['b'] = signalA.toString();

    return evaluate('a');
  }
}

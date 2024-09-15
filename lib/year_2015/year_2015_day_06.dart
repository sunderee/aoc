import 'package:aoc/solution.dart';
import 'package:aoc/utilities/scope_functions.dart';
import 'package:collection/collection.dart';

enum InstructionType {
  turnOn,
  turnOff,
  toggle;

  static InstructionType fromString(String input) {
    return switch (input) {
      'turn on' => InstructionType.turnOn,
      'turn off' => InstructionType.turnOff,
      'toggle' => InstructionType.toggle,
      _ => throw Exception('Invalid instruction type: $input'),
    };
  }
}

typedef Instruction = ({int startX, int startY, int endX, int endY});

final class Year2015Day06 implements Solution<int, int> {
  @override
  int first(String input) {
    final List<List<bool>> grid = List.generate(
      1000,
      (_) => List.generate(1000, (_) => false),
    );

    input
        .split('\n')
        .map((item) => _parseInstruction(item))
        .forEach((instruction) {
      for (var x = instruction.$2.startX; x <= instruction.$2.endX; x++) {
        for (var y = instruction.$2.startY; y <= instruction.$2.endY; y++) {
          switch (instruction.$1) {
            case InstructionType.turnOn:
              grid[x][y] = true;
              break;
            case InstructionType.turnOff:
              grid[x][y] = false;
              break;
            case InstructionType.toggle:
              grid[x][y] = !grid[x][y];
              break;
          }
        }
      }
    });

    return grid.flattened.where((item) => item).length;
  }

  @override
  int second(String input) {
    final List<List<int>> grid = List.generate(
      1000,
      (_) => List.generate(1000, (_) => 0),
    );

    input
        .split('\n')
        .map((item) => _parseInstruction(item))
        .forEach((instruction) {
      for (var x = instruction.$2.startX; x <= instruction.$2.endX; x++) {
        for (var y = instruction.$2.startY; y <= instruction.$2.endY; y++) {
          switch (instruction.$1) {
            case InstructionType.turnOn:
              grid[x][y]++;
              break;
            case InstructionType.turnOff:
              if (grid[x][y] > 0) {
                grid[x][y]--;
              }

              break;
            case InstructionType.toggle:
              grid[x][y] += 2;
              break;
          }
        }
      }
    });

    return grid.flattened.fold(0, (sum, item) => sum + item);
  }

  (InstructionType, Instruction) _parseInstruction(String line) {
    final typeRegex = RegExp(r'^(turn on|turn off|toggle)', multiLine: true);
    final instructionType = line
        .let((it) => typeRegex.stringMatch(it))
        ?.let((it) => InstructionType.fromString(it));
    if (instructionType == null) {
      throw Exception('Null instruction type: $line');
    }

    final startCoordinates = RegExp(r'\d+,\d+(?=\sthrough)')
        .stringMatch(line)
        ?.let((it) => it.split(','))
        .takeIf((it) => it.length == 2)
        ?.map((item) => int.parse(item));
    final endCoordinates = RegExp(r'(?<=through\s)\d+,\d+')
        .stringMatch(line)
        ?.let((it) => it.split(','))
        .takeIf((it) => it.length == 2)
        ?.map((item) => int.parse(item));
    if (startCoordinates == null || endCoordinates == null) {
      throw Exception('Failed to parse start or end coordinates: $line');
    }

    return (
      instructionType,
      (
        startX: startCoordinates.first,
        startY: startCoordinates.last,
        endX: endCoordinates.first,
        endY: endCoordinates.last,
      ),
    );
  }
}

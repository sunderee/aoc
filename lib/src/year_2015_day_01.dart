import 'package:aoc/solution.dart';
import 'package:aoc/src/data/reader.dart';

final class Year2015Day01 implements Solution<int, int> {
  @override
  Future<int> first({bool isTest = false}) async {
    return readInputData(2015, 1, isTest).then((input) => input
        .split('')
        .map((item) => item == '(' ? 1 : -1)
        .reduce((value, element) => value + element));
  }

  @override
  Future<int> second({bool isTest = false}) async {
    final input = await readInputData(2015, 1, isTest);

    final instructions = input.split('');
    int currentFloor = 0;
    for (var i = 0; i < instructions.length; i++) {
      final direction = instructions[i] == '(' ? 1 : -1;
      currentFloor += direction;
      if (currentFloor < 0) {
        return i + 1;
      }
    }

    return -1;
  }
}

import 'package:aoc/solution.dart';

final class Year2015Day01 implements Solution<int, int> {
  @override
  int first(String input) {
    return input
        .split('')
        .fold(0, (sum, character) => sum + (character == '(' ? 1 : -1));
  }

  @override
  int second(String input) {
    int floor = 0;
    for (int i = 0; i < input.length; i++) {
      floor += input[i] == '(' ? 1 : -1;
      if (floor == -1) {
        return i + 1;
      }
    }
    return 0;
  }
}

import 'package:aoc/solution.dart';
import 'package:aoc/utilities/scope_functions.dart';

final class Year2024Day13 implements Solution<int, int> {
  @override
  int first(String input) => input
      .split('\n\n')
      .map((item) => _costOfWinningAPrize(item))
      .where((item) => item != -1)
      .reduce((previous, current) => previous + current);

  @override
  int second(String input) => input
      .split('\n\n')
      .map((item) => _costOfWinningAPrize(item, isPart2: true))
      .where((item) => item != -1)
      .fold(0, (previous, current) => previous + current);

  int _costOfWinningAPrize(String instruction, {bool isPart2 = false}) {
    final (buttonA, buttonB, prize) = (
      instruction.split('\n')[0],
      instruction.split('\n')[1],
      instruction.split('\n')[2],
    );

    // Parse the input values
    final (buttonAX, buttonAY) = (
      RegExp(r'(?<=X\+)\d+(?=\,)')
              .stringMatch(buttonA)
              ?.let((it) => int.tryParse(it)) ??
          0,
      RegExp(r'(?<=Y\+)\d+')
              .stringMatch(buttonA)
              ?.let((it) => int.tryParse(it)) ??
          0,
    );

    final (buttonBX, buttonBY) = (
      RegExp(r'(?<=X\+)\d+(?=\,)')
              .stringMatch(buttonB)
              ?.let((it) => int.tryParse(it)) ??
          0,
      RegExp(r'(?<=Y\+)\d+')
              .stringMatch(buttonB)
              ?.let((it) => int.tryParse(it)) ??
          0,
    );

    var (prizeX, prizeY) = (
      RegExp(r'(?<=X=)\d+(?=,)')
              .stringMatch(prize)
              ?.let((it) => int.tryParse(it)) ??
          0,
      RegExp(r'(?<=Y=)\d+').stringMatch(prize)?.let((it) => int.tryParse(it)) ??
          0,
    );

    if (isPart2) {
      prizeX += 10000000000000;
      prizeY += 10000000000000;
    }

    final y = (prizeY * buttonAX - prizeX * buttonAY) /
        (buttonBY * buttonAX - buttonBX * buttonAY);

    final x = (prizeX - y * buttonBX) / buttonAX;
    if (y != y.roundToDouble() || x != x.roundToDouble()) {
      return -1;
    }

    return (x * 3 + y).round();
  }
}

import 'dart:math';

import 'package:aoc/solution.dart';

final class Year2024Day11 implements Solution<int, int> {
  @override
  int first(String input) {
    List<int> stones = input.split(' ').map(int.parse).toList();
    int blinksLeft = 25;

    while (blinksLeft > 0) {
      final temporaryStonesList = <int>[];

      for (final stone in stones) {
        if (stone == 0) {
          temporaryStonesList.add(1);
          continue;
        }

        if (stone.toString().length.isEven) {
          final stoneStr = stone.toString();
          final midpoint = stoneStr.length ~/ 2;
          final leftHalf = int.parse(stoneStr.substring(0, midpoint));
          final rightHalf = int.parse(stoneStr.substring(midpoint));

          temporaryStonesList.add(leftHalf);
          temporaryStonesList.add(rightHalf);
          continue;
        }

        final multipliedBy2024 = stone * 2024;
        temporaryStonesList.add(multipliedBy2024);
      }

      stones = temporaryStonesList;
      blinksLeft--;
    }

    return stones.length;
  }

  // Inspired by https://github.com/imisaacwu/AdventOfCode2024/blob/main/day11.dart
  @override
  int second(String input) {
    final stones = input.split(' ').map(int.parse).toList();

    final Map<int, int> stoneCounts = {};
    final Map<int, int> next = {};
    final Map<int, List<int>> cache = {};

    for (final stone in stones) {
      stoneCounts[stone] = (stoneCounts[stone] ?? 0) + 1;
    }

    int numberOfStones = 0;
    for (int blink = 1; blink <= 75; blink++) {
      next.clear();

      for (final stone in stoneCounts.keys) {
        if (stone == 0) {
          next[1] = (next[1] ?? 0) + stoneCounts[stone]!;
        } else if (cache.containsKey(stone)) {
          for (final nextStone in cache[stone]!) {
            next[nextStone] = (next[nextStone] ?? 0) + stoneCounts[stone]!;
          }
        } else {
          final digits = (log(stone) / ln10).floor() + 1;
          if (digits.isEven) {
            final front = (stone / pow(10, digits ~/ 2)).floor();
            final back = (stone % pow(10, digits ~/ 2)).floor();
            next[front] = (next[front] ?? 0) + stoneCounts[stone]!;
            next[back] = (next[back] ?? 0) + stoneCounts[stone]!;
            cache[stone] = [front, back];
          } else {
            final multiplied = 2024 * stone;
            next[multiplied] = (next[multiplied] ?? 0) + stoneCounts[stone]!;
            cache[stone] = [multiplied];
          }
        }
      }
      stoneCounts
        ..clear()
        ..addAll(next);
    }

    numberOfStones = stoneCounts.values.reduce((a, b) => a + b);
    return numberOfStones;
  }
}

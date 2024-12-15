import 'package:aoc/solution.dart';

final class Year2021Day06 implements Solution<int, int> {
  @override
  int first(String input) => _simulateFish(input, 80);

  @override
  int second(String input) => _simulateFish(input, 256);

  int _simulateFish(String input, int days) {
    List<int> fishCounts = List.filled(9, 0);

    for (final timer in input.split(',').map(int.parse)) {
      fishCounts[timer]++;
    }

    for (int day = 0; day < days; day++) {
      final reproducingFish = fishCounts[0];

      for (var i = 0; i < 8; i++) {
        fishCounts[i] = fishCounts[i + 1];
      }

      fishCounts[8] = reproducingFish;
      fishCounts[6] += reproducingFish;
    }

    return fishCounts.reduce((sum, count) => sum + count);
  }
}

import 'package:aoc/solution.dart';

class Year2024Day04 implements Solution<int, int> {
  static final _directionsForXMAS = [
    [
      [0, 0],
      [1, 0],
      [2, 0],
      [3, 0]
    ],
    [
      [0, 0],
      [0, 1],
      [0, 2],
      [0, 3]
    ],
    [
      [0, 0],
      [1, 1],
      [2, 2],
      [3, 3]
    ],
    [
      [0, 3],
      [1, 2],
      [2, 1],
      [3, 0]
    ],
  ];

  static final _directionsForXDashMAS = [
    [
      [0, 0],
      [1, 1],
      [2, 2],
      [0, 2],
      [1, 1],
      [2, 0]
    ],
  ];

  @override
  int first(String input, {bool inTestMode = false}) {
    List<String> data = input.split('\n');
    return _solve(
      data,
      _directionsForXMAS,
      ['XMAS', 'SAMX'],
    );
  }

  @override
  int second(String input, {bool inTestMode = false}) {
    List<String> data = input.split('\n');
    return _solve(
      data,
      _directionsForXDashMAS,
      ['MASMAS', 'SAMSAM', 'MASSAM', 'SAMMAS'],
    );
  }

  int _solve(
    List<String> data,
    List<List<List<int>>> slices,
    List<String> variants,
  ) {
    int count = 0;

    for (int x = 0; x < data[0].length; x++) {
      for (int y = 0; y < data.length; y++) {
        for (final slice in slices) {
          try {
            final word = slice.map((item) {
              final deltaX = item[0];
              final deltaY = item[1];
              return data[y + deltaY][x + deltaX];
            }).join();

            if (variants.contains(word)) {
              count++;
            }
          } catch (_) {}
        }
      }
    }

    return count;
  }
}

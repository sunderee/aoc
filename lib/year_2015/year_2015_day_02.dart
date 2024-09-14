import 'package:aoc/solution.dart';
import 'package:aoc/utilities/scope_functions.dart';
import 'package:collection/collection.dart';

typedef Dimensions = ({int length, int width, int height});

final class Year2015Day02 implements Solution<int, int> {
  @override
  int first(String input) {
    return input
        .split('\n')
        .map((item) => item.split('x').map((element) => int.parse(element)))
        .map((item) => (
              length: item.elementAt(0),
              width: item.elementAt(1),
              height: item.elementAt(2),
            ))
        .map((item) => _calculatePaper(item))
        .fold(0, (a, b) => a + b);
  }

  @override
  int second(String input) {
    return input
        .split('\n')
        .map((item) => item.split('x').map((element) => int.parse(element)))
        .map((item) => (
              length: item.elementAt(0),
              width: item.elementAt(1),
              height: item.elementAt(2),
            ))
        .map((item) => _calculateRibbon(item))
        .fold(0, (a, b) => a + b);
  }

  int _calculatePaper(Dimensions dimensions) {
    final sides = [
      dimensions.length * dimensions.width,
      dimensions.width * dimensions.height,
      dimensions.height * dimensions.length,
    ];
    return sides.map((item) => item * 2).reduce((a, b) => a + b) +
        sides.sorted((a, b) => a.compareTo(b)).firstOrNull.withDefault(0);
  }

  int _calculateRibbon(Dimensions dimensions) {
    final dimensionsArray = [
      dimensions.length,
      dimensions.width,
      dimensions.height,
    ];
    final smallestPerimeter = dimensionsArray
        .sorted((a, b) => a.compareTo(b))
        .take(2)
        .map((item) => item * 2)
        .reduce((a, b) => a + b);
    final volume = dimensions.length * dimensions.width * dimensions.height;
    return smallestPerimeter + volume;
  }
}

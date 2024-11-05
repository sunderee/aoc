import 'package:aoc/utilities/types.dart';

extension StringExtension on String {
  bool isNumeric() => num.tryParse(this) != null;
}

extension PointExtension on Point {
  Point add(Point other) => (
        x: x + other.x,
        y: y + other.y,
      );
}

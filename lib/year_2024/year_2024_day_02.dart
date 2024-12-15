import 'package:aoc/solution.dart';

final class Year2024Day02 implements Solution<int, int> {
  @override
  int first(String input, {bool inTestMode = false}) => input
      .split('\n')
      .map((item) => item.split(' ').map((element) => int.parse(element)))
      .map((item) => _isReportSafe(item))
      .where((item) => item)
      .length;

  @override
  int second(String input, {bool inTestMode = false}) => input
      .split('\n')
      .map((item) => item.split(' ').map((element) => int.parse(element)))
      .map((item) => _isReportSafeWithDampener(item))
      .where((item) => item)
      .length;

  bool _isReportSafe(Iterable<int> report) {
    final list = report.toList();

    bool? isAscending;
    for (int i = 1; i < list.length; i++) {
      final difference = list[i] - list[i - 1];
      final absoluteDifference = difference.abs();
      if (absoluteDifference < 1 || absoluteDifference > 3) {
        return false;
      }

      if (isAscending == null) {
        isAscending = difference > 0;
      } else if ((difference > 0) != isAscending) {
        return false;
      }
    }

    return true;
  }

  bool _isReportSafeWithDampener(Iterable<int> report) {
    if (_isReportSafe(report)) {
      return true;
    }

    final list = report.toList();
    for (int i = 0; i < list.length; i++) {
      final modifiedReport = [...list]..removeAt(i);
      if (_isReportSafe(modifiedReport)) {
        return true;
      }
    }

    return false;
  }
}

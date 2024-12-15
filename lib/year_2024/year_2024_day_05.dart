import 'package:aoc/solution.dart';
import 'package:aoc/utilities/scope_functions.dart';

final class Year2024Day05 implements Solution<int, int> {
  @override
  int first(String input) {
    final lines = input.split('\n');

    final (pageOrderingRulesRegex, pageNumbersUpdateRegex) = (
      RegExp(r'\d+\|\d+'),
      RegExp(r'^\d+(,\d+)*$', multiLine: true),
    );

    final (pageOrderingRules, pageNumbersUpdate) = (
      lines.where((item) => pageOrderingRulesRegex.hasMatch(item)),
      lines.where((item) => pageNumbersUpdateRegex.hasMatch(item))
    );

    final constraints = _buildConstraintsGraph(pageOrderingRules.toList());

    final validUpdates = <List<int>>[];
    for (final update in pageNumbersUpdate) {
      final pages = update.split(',').map((item) => int.parse(item)).toList();
      if (_isValidUpdate(pages, constraints)) {
        validUpdates.add(pages);
      }
    }

    final middleElements = <int>[];
    for (final update in validUpdates) {
      if (update.isNotEmpty) {
        final middleIndex = update.length ~/ 2;
        middleElements.add(update[middleIndex]);
      }
    }

    return middleElements.reduce((previous, current) => previous + current);
  }

  @override
  int second(String input) {
    final lines = input.split('\n');

    final (pageOrderingRulesRegex, pageNumbersUpdateRegex) = (
      RegExp(r'\d+\|\d+'),
      RegExp(r'^\d+(,\d+)*$', multiLine: true),
    );

    final (pageOrderingRules, pageNumbersUpdate) = (
      lines.where((item) => pageOrderingRulesRegex.hasMatch(item)),
      lines.where((item) => pageNumbersUpdateRegex.hasMatch(item))
    );

    final constraints = _buildConstraintsGraph(pageOrderingRules.toList());

    final invalidUpdates = <List<int>>[];
    for (final update in pageNumbersUpdate) {
      final pages = update.split(',').map((item) => int.parse(item)).toList();
      if (!_isValidUpdate(pages, constraints)) {
        invalidUpdates.add(pages);
      }
    }

    final fixedInvalidUpdates = <List<int>>[];
    for (final update in invalidUpdates) {
      final fixedUpdate = _reorderPages(update, constraints);
      fixedInvalidUpdates.add(fixedUpdate);
    }

    final middleElements = <int>[];
    for (final update in fixedInvalidUpdates) {
      if (update.isNotEmpty) {
        final middleIndex = update.length ~/ 2;
        middleElements.add(update[middleIndex]);
      }
    }

    return middleElements.reduce((previous, current) => previous + current);
  }

  Map<int, Set<int>> _buildConstraintsGraph(List<String> pageOrderingRules) {
    final constraints = <int, Set<int>>{};

    for (final rule in pageOrderingRules) {
      final (from, to) = rule
          .split('|')
          .map((item) => int.parse(item))
          .let((it) => (it.first, it.last));

      constraints.putIfAbsent(from, () => {}).add(to);
    }

    return constraints;
  }

  bool _isValidUpdate(List<int> pages, Map<int, Set<int>> constraints) {
    final indexMap = {for (int i = 0; i < pages.length; i++) pages[i]: i};

    for (final page in constraints.keys) {
      if (!pages.contains(page)) {
        continue;
      }

      for (final dependentPage in constraints[page]!) {
        if (!pages.contains(dependentPage)) {
          continue;
        }

        if (indexMap[page]! >= indexMap[dependentPage]!) {
          return false;
        }
      }
    }

    return true;
  }

  List<int> _reorderPages(List<int> pages, Map<int, Set<int>> dependencies) {
    bool changesMade;

    do {
      changesMade = false;
      for (int currentIndex = 0; currentIndex < pages.length; currentIndex++) {
        final page = pages[currentIndex];
        if (!dependencies.containsKey(page)) {
          continue;
        }

        for (final dependentPage in dependencies[page]!) {
          if (!pages.contains(dependentPage)) {
            continue;
          }

          final dependentIndex = pages.indexOf(dependentPage);
          if (dependentIndex < currentIndex) {
            pages.removeAt(dependentIndex);
            pages.insert(currentIndex, dependentPage);

            changesMade = true;
            break;
          }
        }

        if (changesMade) {
          break;
        }
      }
    } while (changesMade);

    return pages;
  }
}

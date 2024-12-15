import 'package:aoc/solution.dart';
import 'package:aoc/utilities/scope_functions.dart';
import 'package:collection/collection.dart';

final class Year2015Day09 implements Solution<int, int> {
  @override
  int first(String input) {
    final graphOfDestinations = <String, Map<String, int>>{};
    for (final line in input.split('\n')) {
      final (source, destination, distance) = (
        RegExp(r'^\w+').stringMatch(line),
        RegExp(r'(?<=to\s)\w+').stringMatch(line),
        RegExp(r'\d+$').stringMatch(line)?.let((it) => int.tryParse(it)),
      );
      if (source == null || destination == null || distance == null) {
        continue;
      }

      if (graphOfDestinations.containsKey(source)) {
        final destinationsMap = Map<String, int>.from(
          graphOfDestinations[source]!,
        );
        destinationsMap[destination] = distance;

        graphOfDestinations[source] = destinationsMap;
      } else {
        graphOfDestinations[source] = {destination: distance};
      }

      if (graphOfDestinations.containsKey(destination)) {
        final destinationsMap = Map<String, int>.from(
          graphOfDestinations[destination]!,
        );
        destinationsMap[source] = distance;

        graphOfDestinations[destination] = destinationsMap;
      } else {
        graphOfDestinations[destination] = {source: distance};
      }
    }

    final uniqueLocations = graphOfDestinations.entries
        .map((item) => [item.key, ...item.value.keys])
        .toList()
        .flattened
        .toSet();

    final allPermutations = <List<String>>[];
    void permutate(List<String> locations, int cursor) {
      if (cursor == locations.length) {
        allPermutations.add(locations);
        return;
      }

      for (int i = cursor; i < locations.length; i++) {
        List<String> permutation = List.from(locations);
        permutation[cursor] = locations[i];
        permutation[i] = locations[cursor];
        permutate(permutation, cursor + 1);
      }
    }

    permutate(uniqueLocations.toList(), 0);

    final allFullDistances = <int>[];
    for (final permutation in allPermutations) {
      int fullDistance = 0;
      for (int i = 0; i < permutation.length - 1; i++) {
        final source = permutation[i];
        final destination = permutation[i + 1];
        final distance = graphOfDestinations[source]![destination]!;

        fullDistance += distance;
      }

      allFullDistances.add(fullDistance);
    }

    return allFullDistances.min.toInt();
  }

  @override
  int second(String input) {
    final graphOfDestinations = <String, Map<String, int>>{};
    for (final line in input.split('\n')) {
      final (source, destination, distance) = (
        RegExp(r'^\w+').stringMatch(line),
        RegExp(r'(?<=to\s)\w+').stringMatch(line),
        RegExp(r'\d+$').stringMatch(line)?.let((it) => int.tryParse(it)),
      );
      if (source == null || destination == null || distance == null) {
        continue;
      }

      if (graphOfDestinations.containsKey(source)) {
        final destinationsMap = Map<String, int>.from(
          graphOfDestinations[source]!,
        );
        destinationsMap[destination] = distance;

        graphOfDestinations[source] = destinationsMap;
      } else {
        graphOfDestinations[source] = {destination: distance};
      }

      if (graphOfDestinations.containsKey(destination)) {
        final destinationsMap = Map<String, int>.from(
          graphOfDestinations[destination]!,
        );
        destinationsMap[source] = distance;

        graphOfDestinations[destination] = destinationsMap;
      } else {
        graphOfDestinations[destination] = {source: distance};
      }
    }

    final uniqueLocations = graphOfDestinations.entries
        .map((item) => [item.key, ...item.value.keys])
        .toList()
        .flattened
        .toSet();

    final allPermutations = <List<String>>[];
    void permutate(List<String> locations, int cursor) {
      if (cursor == locations.length) {
        allPermutations.add(locations);
        return;
      }

      for (int i = cursor; i < locations.length; i++) {
        List<String> permutation = List.from(locations);
        permutation[cursor] = locations[i];
        permutation[i] = locations[cursor];
        permutate(permutation, cursor + 1);
      }
    }

    permutate(uniqueLocations.toList(), 0);

    final allFullDistances = <int>[];
    for (final permutation in allPermutations) {
      int fullDistance = 0;
      for (int i = 0; i < permutation.length - 1; i++) {
        final source = permutation[i];
        final destination = permutation[i + 1];
        final distance = graphOfDestinations[source]![destination]!;

        fullDistance += distance;
      }

      allFullDistances.add(fullDistance);
    }

    return allFullDistances.max.toInt();
  }
}

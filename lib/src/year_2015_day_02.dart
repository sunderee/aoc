import 'package:aoc/solution.dart';
import 'package:aoc/src/data/reader.dart';
import 'package:dart_scope_functions/dart_scope_functions.dart';

final class Year2015Day02 implements Solution<int, int> {
  @override
  Future<int> first({bool isTest = false}) async {
    final input = await readInputData(2015, 2, isTest);
    return input
        .split('\n')
        .map((item) => item.split('x'))
        .where((item) => item.length == 3)
        .map((item) => _surfaceAreaPlusSlack(
              item[0].let((it) => int.parse(it)),
              item[1].let((it) => int.parse(it)),
              item[2].let((it) => int.parse(it)),
            ))
        .reduce((value, element) => value + element);
  }

  @override
  Future<int> second({bool isTest = false}) async {
    final input = await readInputData(2015, 2, isTest);
    return input
        .split('\n')
        .map((item) => item.split('x'))
        .where((item) => item.length == 3)
        .map((item) => _ribbonLength(
              item[0].let((it) => int.parse(it)),
              item[1].let((it) => int.parse(it)),
              item[2].let((it) => int.parse(it)),
            ))
        .reduce((value, element) => value + element);
  }

  int _surfaceAreaPlusSlack(int width, int length, int height) {
    final surfaceArea =
        2 * width * length + 2 * width * height + 2 * length * height;

    final slack = [width, length, height]
        .also((it) => it.sort())
        .let((it) => it[0] * it[1]);

    return surfaceArea + slack;
  }

  int _ribbonLength(int width, int length, int height) {
    final ribbonToWrapGift = [width, length, height]
        .also((it) => it.sort())
        .let((it) => 2 * it[0] + 2 * it[1]);
    final ribbonForBow = width * length * height;

    return ribbonToWrapGift + ribbonForBow;
  }
}

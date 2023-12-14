import 'dart:convert';

import 'package:aoc/solution.dart';
import 'package:aoc/src/data/reader.dart';
import 'package:crypto/crypto.dart';

final class Year2015Day04 implements Solution<int, int> {
  @override
  Future<int> first({bool isTest = false}) async {
    final input = await readInputData(2015, 4, isTest);

    bool lookingForTheRightHash = true;
    int counter = 0;
    while (lookingForTheRightHash) {
      final md5Hash = md5.convert(utf8.encode('$input$counter')).toString();
      if (md5Hash.startsWith('00000')) {
        lookingForTheRightHash = false;
      } else {
        counter += 1;
      }
    }

    return counter;
  }

  @override
  Future<int> second({bool isTest = false}) async {
    final input = await readInputData(2015, 4, isTest);

    bool lookingForTheRightHash = true;
    int counter = 0;
    while (lookingForTheRightHash) {
      final md5Hash = md5.convert(utf8.encode('$input$counter')).toString();
      if (md5Hash.startsWith('000000')) {
        lookingForTheRightHash = false;
      } else {
        counter += 1;
      }
    }

    return counter;
  }
}

import 'dart:convert';

import 'package:aoc/solution.dart';
import 'package:crypto/crypto.dart';

final class Year2015Day04 implements Solution<int, int> {
  @override
  int first(String input) {
    var currentNumber = 0;
    bool found = false;
    while (!found) {
      final md5Hash = md5.convert(utf8.encode('$input$currentNumber'));
      if (md5Hash.toString().startsWith('00000')) {
        found = true;
      } else {
        currentNumber++;
      }
    }

    return currentNumber;
  }

  @override
  int second(String input) {
    var currentNumber = 0;
    bool found = false;
    while (!found) {
      final md5Hash = md5.convert(utf8.encode('$input$currentNumber'));
      if (md5Hash.toString().startsWith('000000')) {
        found = true;
      } else {
        currentNumber++;
      }
    }

    return currentNumber;
  }
}

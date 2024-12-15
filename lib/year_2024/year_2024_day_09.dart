import 'package:aoc/solution.dart';

// Heavily inspired by paolostyle.
final class Year2024Day09 implements Solution<int, int> {
  @override
  int first(String input, {bool inTestMode = false}) {
    final code = input.split('').map((item) => int.parse(item)).toList();

    int lengthOfCodeBlocks = 0;
    for (int i = 0; i < code.length; i++) {
      if (i % 2 == 0) {
        lengthOfCodeBlocks += code[i];
      }
    }

    List<int> blocks = List.filled(lengthOfCodeBlocks, 0);
    int i = 0;
    int id = code.length - 1;

    bool breakLoop = false;
    for (int j = 0; j < code.length && !breakLoop; j++) {
      if (j % 2 == 0) {
        for (int k = code[j]; k > 0; k--) {
          blocks[i] = j ~/ 2;
          i++;
        }
      } else {
        int emptyFields = code[j];
        for (int k = 0; k < emptyFields; k++) {
          if (code[id] == 0) {
            id -= 2;
          }
          if (i >= lengthOfCodeBlocks) {
            breakLoop = true;
            break;
          }
          blocks[i] = id ~/ 2;
          code[id]--;
          i++;
        }
      }
    }

    int checksum = 0;
    for (int index = 0; index < blocks.length; index++) {
      checksum += index * blocks[index];
    }

    return checksum;
  }

  @override
  int second(String input, {bool inTestMode = false}) {
    final code = input.split('').map((item) => int.parse(item)).toList();

    int lengthOfCodeBlocks = 0;
    for (int val in code) {
      lengthOfCodeBlocks += val;
    }

    List<int> blocks = List.filled(lengthOfCodeBlocks, 0);
    Map<int, int> records = {};
    int i = 0;

    for (int j = 0; j < code.length; j++) {
      records[j] = i;
      if (j % 2 == 0) {
        for (int k = code[j]; k > 0; k--) {
          blocks[i] = j ~/ 2;
          i++;
        }
      } else {
        i += code[j];
      }
    }

    int id = 1;
    for (int j = code.length - 1; j >= 0; j -= 2) {
      for (int k = id; k <= j; k += 2) {
        if (code[k] >= code[j]) {
          int recordsK = records[k]!;
          for (int l = 0; l < code[j]; l++) {
            blocks[recordsK] = j ~/ 2;
            recordsK++;
          }

          int recordsJ = records[j]!;
          for (int l = 0; l < code[j]; l++) {
            blocks[recordsJ] = 0;
            recordsJ++;
          }

          code[k] -= code[j];
          records[k] = records[k]! + code[j];
          code[j] = 0;

          if (code[id] == 0) {
            id += 2;
          }
          break;
        }
      }
    }

    int checksum = 0;
    for (int index = 0; index < blocks.length; index++) {
      checksum += index * blocks[index];
    }

    return checksum;
  }
}

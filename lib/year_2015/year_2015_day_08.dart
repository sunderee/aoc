import 'package:aoc/solution.dart';

final class Year2015Day08 implements Solution<int, int> {
  @override
  int first(String input, {bool inTestMode = false}) => input
      .split('\n')
      .map((item) => _calculateStringLengthDifference(item))
      .reduce((previous, current) => previous + current);

  // Inspired by https://www.reddit.com/r/adventofcode/comments/3vw32y/comment/cxrad1k
  @override
  int second(String input, {bool inTestMode = false}) => input
      .split('\n')
      .map((s) => 2 + s.split('\\').length - 1 + s.split('"').length - 1)
      .reduce((a, b) => a + b);

  int _calculateStringLengthDifference(String input) {
    int codeLength = input.length;
    String processedString = _processStringEscapes(input);
    int memoryLength = processedString.length;

    return codeLength - memoryLength;
  }

  String _processStringEscapes(String input) {
    input = input.substring(1, input.length - 1);

    StringBuffer result = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      if (input[i] == '\\') {
        if (i + 1 < input.length) {
          switch (input[i + 1]) {
            case '\\':
              result.write('\\');
              i++;
              break;
            case '"':
              result.write('"');
              i++;
              break;
            case 'x':
              if (i + 3 < input.length) {
                String hexCode = input.substring(i + 2, i + 4);
                result.writeCharCode(int.parse(hexCode, radix: 16));
                i += 3;
              }
              break;
            default:
              result.write(input[i]);
          }
        }
      } else {
        result.write(input[i]);
      }
    }

    return result.toString();
  }
}

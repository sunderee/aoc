import argparse
import os


def create_cli_parser():
    parser = argparse.ArgumentParser(
        description="File creation script for specific year and day."
    )
    parser.add_argument(
        "-y",
        "--year",
        type=int,
        required=True,
        choices=range(2015, 2024),
        help="Year between 2015 and 2023.",
    )
    parser.add_argument(
        "-d",
        "--day",
        type=int,
        required=True,
        choices=range(1, 26),
        help="Day between 1 and 25.",
    )
    return parser


def main():
    parser = create_cli_parser()
    args = parser.parse_args()

    year = args.year
    day = args.day

    # Formatting day with zero prefix if less than 10
    day_formatted = f"{day:02d}"

    dart_file_path = f"lib/src/year_{year}_day_{day_formatted}.dart"
    data_file_path = f"lib/src/data/{year}.{day}.txt"
    test_file_path = f"lib/src/data/{year}.{day}.test.txt"

    # Check if the Dart file exists
    if not os.path.exists(dart_file_path):
        # Create the Dart file
        open(dart_file_path, "w").close()
        print(f"Created Dart file: {dart_file_path}")

        # Create the data files
        open(data_file_path, "w").close()
        open(test_file_path, "w").close()
        print(f"Created data files: {data_file_path} and {test_file_path}")

        # Append line to lib/aoc.dart
        with open("lib/aoc.dart", "a") as aoc_file:
            aoc_file.write(f"export './src/year_{year}_day_{day_formatted}.dart';\n")
            print("Updated lib/aoc.dart")

        # Print additional instructions
        print("\nNow, do the following:\n")
        print(
            f"    1. In `bin/aoc.dart`, under `_mapOfSolutions`, add the following:\n"
        )
        print(f"(year: {year}, day: {day}): (")
        print(f"    first: Year{year}Day{day_formatted}().first(),")
        print(f"    second: Year{year}Day{day_formatted}().second(),")
        print("),\n")
        print(
            f"    2. In `test/aoc{year}_test.dart`, add the following inside the `main` method:\n"
        )
        print(f"group('{year} day {day}', () {{")
        print(f"  final solution = Year{year}Day{day_formatted}();\n")
        print("  test('part 1', () async {")
        print("    final result = await solution.first(isTest: true);")
        print("    expect(result, equals(-1));")
        print("  });\n")
        print("  test('part 2', () async {")
        print("    final result = await solution.second(isTest: true);")
        print("    expect(result, equals(-1));")
        print("  });")
        print("});")
    else:
        print(f"Dart file already exists: {dart_file_path}")


if __name__ == "__main__":
    main()

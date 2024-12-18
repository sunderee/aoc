import argparse
import os
import re
import subprocess

def parse_arguments():
    parser = argparse.ArgumentParser(description="Generate Advent of Code Dart files.")
    parser.add_argument('-y', '--year', type=int, required=True, help='Year of the challenge')
    parser.add_argument('-d', '--day', type=int, required=True, help='Day of the challenge')
    return parser.parse_args()

def create_dart_file(year, day):
    day_padded = f"{day:02}"
    class_name = f"Year{year}Day{day_padded}"
    
    lib_dir = f"lib/year_{year}"
    os.makedirs(lib_dir, exist_ok=True)
    lib_file_path = f"{lib_dir}/year_{year}_day_{day_padded}.dart"
    
    lib_content = f"""import 'package:aoc/solution.dart';

final class {class_name} implements Solution<int, int> {{
  @override
  int first(String input) {{
    return -1;
  }}

  @override
  int second(String input) {{
    return -1;
  }}
}}
"""
    
    with open(lib_file_path, 'w') as lib_file:
        lib_file.write(lib_content)
    print(f"Created {lib_file_path}")

def create_test_file(year, day):
    day_padded = f"{day:02}"
    class_name = f"Year{year}Day{day_padded}"
    
    test_dir = f"test/year_{year}"
    os.makedirs(test_dir, exist_ok=True)
    test_file_path = f"{test_dir}/year_{year}_day_{day_padded}_test.dart"
    
    test_content = f"""import 'package:aoc/year_{year}/year_{year}_day_{day_padded}.dart';
import 'package:test/test.dart';

void main() {{
  group('Year {year}, day {day}', () {{
    final solution = {class_name}();

    test('first', () {{
      expect(solution.first(''), equals(-1));
    }});

    test('second', () {{
      expect(solution.second(''), equals(-1));
    }});
  }});
}}
"""
    
    with open(test_file_path, 'w') as test_file:
        test_file.write(test_content)
    print(f"Created {test_file_path}")

def create_data_file(year, day):
    data_dir = f"data/{year}"
    os.makedirs(data_dir, exist_ok=True)
    data_file_path = f"{data_dir}/{day}.txt"
    
    with open(data_file_path, 'w') as data_file:
        data_file.write("")
    print(f"Created {data_file_path}")

def update_year_file(year, day):
    bin_year_file = f"bin/year_{year}.dart"
    day_padded = f"{day:02}"
    class_name = f"Year{year}Day{day_padded}"

    import_statement = f"import 'package:aoc/year_{year}/year_{year}_day_{day_padded}.dart';"
    map_entry = f"  {day}: {class_name}(),"

    if not os.path.exists(bin_year_file):
        year_content = f"""import 'package:aoc/solution.dart';
{import_statement}

final Map<int, Solution> year{year}Solutions = {{
  {map_entry}
}};
"""
        with open(bin_year_file, 'w') as year_file:
            year_file.write(year_content)
        print(f"Created {bin_year_file}")
    else:

        with open(bin_year_file, 'r') as year_file:
            content = year_file.read()
        
        if import_statement not in content:
            content = import_statement + "\n" + content
        
        if map_entry not in content:
            content = re.sub(r'(final Map<int, Solution> year\d+Solutions = {\n)(.*?)(\n};)', 
                            lambda m: f"{m.group(1)}{m.group(2)}{map_entry}\n{m.group(3)}", 
                            content, flags=re.DOTALL)
        
        with open(bin_year_file, 'w') as year_file:
            year_file.write(content)
        print(f"Updated {bin_year_file}")

def update_data_file(year, day):
    data_file = "bin/data.dart"
    year_key = year
    day_key = day
    data_path = f"data/{year}/{day}.txt"

    with open(data_file, 'r') as file:
        lines = file.readlines()

    year_start_index = None
    year_end_index = None
    for i, line in enumerate(lines):
        if f"{year_key}: {{" in line:
            year_start_index = i
        if year_start_index is not None and "}," in line:
            year_end_index = i
            break

    if year_start_index is not None and year_end_index is not None:
        day_exists = False
        for line in lines[year_start_index+1:year_end_index]:
            if f"{day_key}: '{data_path}'," in line:
                day_exists = True
                break

        if not day_exists:
            day_entry = f"    {day_key}: '{data_path}',\n"
            lines.insert(year_end_index, day_entry)
            print(f"Added Day {day} to Year {year} in {data_file}")
        else:
            print(f"Data for Year {year}, Day {day} already exists in {data_file}. No update needed.")
    else:
        year_entry = [
            f"  {year_key}: {{\n",
            f"    {day_key}: '{data_path}',\n",
            "  },\n"
        ]
        lines.insert(-1, "\n")
        lines.extend(year_entry)
        print(f"Added Year {year} with Day {day} to {data_file}")

    with open(data_file, 'w') as file:
        file.writelines(lines)

def run_dart_formatter():
    try:
        subprocess.run(['dart', 'format', '.'], check=True)
        print("Successfully ran 'dart format .'")
    except subprocess.CalledProcessError as e:
        print(f"An error occurred while running 'dart format .': {e}")

def main():
    args = parse_arguments()
    year = args.year
    day = args.day

    create_dart_file(year, day)
    create_test_file(year, day)
    create_data_file(year, day)
    update_year_file(year, day)
    update_data_file(year, day)
    run_dart_formatter()

if __name__ == "__main__":
    main()
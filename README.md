# Advent of Code

[Advent of Code](https://adventofcode.com) in Dart.

Christmas is my favorite part of the year. The holiday itself holds an important meaning in my life, and so does the concept of Advent. I believe that Advent of Code hosts really clever exercises, and the stories are captivating. It makes solving puzzles that much more rewarding.

I wish everyone a Merry Christmas, peace in the world, love in the world, and I hope everyone reading this is doing OK.

## Usage

### Installation

To run the solutions, you need to have Dart installed. You can download it from [Dart's official website](https://dart.dev/get-dart). After installing Dart, clone this repository and navigate to the project directory.

### Project structure

The project is organized as follows:

```
aoc
├── bin     # Contains the main entry point for running solutions
├── data    # Directory for input data files (not included in the repo)
├── lib     # Contains the solution code for each day
└── test    # Contains unit tests for the solutions        
```

### What's next?

Due to fair use policy, my inputs are not checked in. Create a `data` directory at the project root, which should follow the following structure:

```
data
├── 2015
│   ├── 1.txt
├── 2016
│   ├── 1.txt
└── 2024
    └── 1.txt
```

After installing dependencies (`dart pub get`), here's what you can do:

```bash
# Run tests
dart test

# Run solution for given year and day
dart bin/aoc.dart --year 2024 --day 1
```

The `setup-solution.py` Python script is a convenience script that I'm using to generate all the boilerplate code when starting work on a new solution.

### Important note

* If you're a beginner to Dart, I'm always happy to answer questions about my code. Please file an issue, and I'll do my best to respond as soon as possible.
* If you see a mistake somewhere, or you think I could improve the performance of any one of my solutions, file an issue! I'll love to discuss.
* I hope you use my work as an inspiration, or to get a look into my mind on how I approach problem-solving.

However, my coding style is unique, and not always the most optimized (because I'm solving this best-effort for my own satisfaction). By using my solutions to gain stars yourself, you're cheating yourself out of the learning experience and the joy of solving these puzzles on your own.

## License

This project is licensed under the MIT license.

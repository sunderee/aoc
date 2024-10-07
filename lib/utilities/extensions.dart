extension StringExtension on String {
  bool isNumeric() => num.tryParse(this) != null;
}

class RomanConversion {
  static const List<int> _decimalValues = [
    1000,
    900,
    500,
    400,
    100,
    90,
    50,
    40,
    10,
    9,
    5,
    4,
    1,
  ];

  static const List<String> _romanSymbols = [
    "M",
    "CM",
    "D",
    "CD",
    "C",
    "XC",
    "L",
    "XL",
    "X",
    "IX",
    "V",
    "IV",
    "I",
  ];

  /// Converts a given integer (decimal number) to its Roman numeral representation.
  ///
  /// This algorithm uses a greedy approach by iterating through the predefined
  /// lists of Roman numeral values in descending order. It repeatedly appends
  /// the Roman symbol corresponding to the largest possible value that
  /// can be subtracted from the current decimal number until the number
  /// becomes zero.
  ///
  /// Parameters:
  /// - [n]: The integer to convert. Valid range is typically 1 to 3999.
  ///
  /// Returns:
  /// A `String` representing the Roman numeral.
  ///
  /// Throws:
  /// - `ArgumentError`: If the input [n] is outside the valid range
  ///   (currently 1 to 3999).
  static String toRoman(int n) {
    if (n < 1 || n > 3999) {
      throw ArgumentError(
        'Number must be between 1 and 3999 for standard Roman numerals.',
      );
    }

    final romanNumeral = StringBuffer();
    var temp = n;

    for (int i = 0; i < _decimalValues.length; i++) {
      while (temp >= _decimalValues[i]) {
        romanNumeral.write(_decimalValues[i]);
        temp -= _decimalValues[i];
      }
    }
    return romanNumeral.toString();
  }

  /// Converts a Roman numeral string to its integer (decimal) representation.
  ///
  /// This algorithm iterates through the Roman numeral string from left to right.
  /// At each step, it tries to match the longest possible Roman symbol (either
  /// a single character or a two-character subtractive case like "IV" or "CM")
  /// from its predefined list of symbols. Once a match is found, its decimal value
  /// is added to the total, and the string index is advanced by the length of
  /// the matched symbol.
  ///
  /// Parameters:
  /// - [romanNumeral]: The Roman numeral string to convert. Case-insensitive.
  ///
  /// Returns:
  /// An `int` representing the decimal value of the Roman numeral.
  ///
  /// Throws:
  /// - `FormatException`: If the input string contains invalid Roman numeral characters
  static int toDecimal(String romanNumeral) {
    var totalDecimal = 0;
    var i = 0;
    romanNumeral = romanNumeral.toUpperCase();

    while (i < romanNumeral.length) {
      var matched = false;

      for (int j = 0; j < _romanSymbols.length; j++) {
        var currentRomanSymbol = _romanSymbols[j];
        var currentDecimalValue = _decimalValues[j];

        if (i + currentRomanSymbol.length <= romanNumeral.length &&
            romanNumeral.substring(i, i + currentRomanSymbol.length) ==
                currentRomanSymbol) {
          totalDecimal += currentDecimalValue;
          i += currentRomanSymbol.length;
          matched = true;
          break;
        }
      }

      if (!matched) {
        throw FormatException(
          'Invalid Roman numeral character or sequence: '
          '${romanNumeral.substring(i, i + 1)} at index $i',
        );
      }
    }
    return totalDecimal;
  }
}

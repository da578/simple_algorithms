/// A utility class for checking if a string is a palindrome.
///
/// A palindrome is a word, phrase, number, or other sequence of characters
/// which reads the same backward as forward, ignoring spaces, punctuation,
/// and capitalization.
class Palindrome {
  /// Confirms whether the given [input] string is a palindrome.
  ///
  /// This method first cleans the input string by:
  /// 1. Trimming leading and trailing whitespace.
  /// 2. Converting all characters to lowercase.
  /// 3. Removing all non-alphabetic characters (e.g., numbers, symbols, spaces).
  ///
  /// After cleaning, it compares characters from both ends of the string
  /// inward to determine if it reads the same forwards and backwards.
  ///
  /// Throws an [ArgumentError] if the initial [input] string is empty
  /// after trimming whitespace.
  ///
  /// Returns `true` if the cleaned string is a palindrome, `false` otherwise.
  /// Returns `false` if the string becomes empty after cleaning
  static bool isPalindrome(String input) {
    if (input.trim().isEmpty) throw ArgumentError('Input cannot be empty');

    var cleanedInput = input.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
    if (cleanedInput.trim().isEmpty) return false;

    var left = 0;
    var right = cleanedInput.length - 1;

    while (left < right) {
      if (cleanedInput[left] != cleanedInput[right]) return false;
      left++;
      right--;
    }

    return true;
  }
}

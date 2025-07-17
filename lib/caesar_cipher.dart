/// A utility class for performing Caesar Cipher encryption and decryption.
///
/// The Caesar Cipher is one of the simplest and most widely known encryption techniques.
/// It's a type of substitution cipher in which each letter in the plaintext is
/// replaced by a letter some fixed number of positions down the alphabet.
class CaesarCipher {
  /// A static list containing all lowercase letters of the English alphabet (a-z).
  /// This list serves as a reference for determining character positions and shifts.
  static final _lowercaseAlphabet = List.generate(
    26,
    (index) => String.fromCharCode(index + 97),
  );

  /// Encrypts a given [input] string using the Caesar Cipher algorithm.
  ///
  /// The encryption preserves the case (uppercase/lowercase) of the original characters.
  /// Non-alphabetic characters (numbers, spaces, symbols) are included in the output unchanged.
  ///
  /// Parameters:
  /// - [input]: The string to be encrypted.
  /// - [key]: The number of positions to shift each letter.
  ///   Defaults to `3` if not provided. Must be an integer between 0 and 25.
  ///
  /// Throws [ArgumentError] if:
  /// - The [input] string is empty or contains only whitespace.
  /// - The [key] is outside the valid range (0-25).
  ///
  /// Returns:
  /// A [String] representing the encrypted (ciphertext) version of the input.
  static String encrypt(String input, {int key = 3}) {
    if (input.trim().isEmpty) throw ArgumentError('Input cannot be empty');
    if (key < 0 || key > 25) throw ArgumentError('Key must be between 0 - 25');
    final encryptedText = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      final char = input[i];
      final isUpperCase = char == char.toUpperCase();
      final lowerChar = char.toLowerCase();

      if (_lowercaseAlphabet.contains(lowerChar)) {
        final currentIndex = _lowercaseAlphabet.indexOf(lowerChar);
        final shiftedIndex = (currentIndex + key) % 26;
        var shiftedChar = _lowercaseAlphabet[shiftedIndex];
        if (isUpperCase) shiftedChar = shiftedChar.toUpperCase();
        encryptedText.write(shiftedChar);
      } else {
        encryptedText.write(input[i]);
      }
    }

    return encryptedText.toString();
  }

  /// Decrypts a given [input] string (ciphertext) using the Caesar Cipher algorithm.
  ///
  /// This method iterates through each character of the input:
  /// - **Alphabetic characters** (A-Z, a-z) are shifted backward by the specified [key].
  ///   Their original case (uppercase or lowercase) is preserved.
  /// - **Non-alphabetic characters** are included in the output without any changes.
  ///
  /// Parameters:
  /// - [input]: The string to be decrypted (ciphertext).
  /// - [key]: The number of positions that was originally used for encryption.
  ///   This must be the same key. Must be an integer between 0 and 25 (inclusive).
  ///
  /// Throws an [ArgumentError] if:
  /// - The [input] string is empty or contains only whitespace after trimming.
  /// - The [key] is outside the valid range (0-25).
  ///
  /// Returns:
  /// A [String] representing the decrypted (plaintext) version of the input.
  static String decrypt(String input, int key) {
    if (input.trim().isEmpty) throw ArgumentError('Input cannot be empty');
    if (key < 0 || key > 25) throw ArgumentError('Key must be between 0 - 25');
    final decryptedText = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      final char = input[i];
      final isUpperCase = char == char.toUpperCase();
      final lowerChar = char.toLowerCase();

      if (_lowercaseAlphabet.contains(lowerChar)) {
        final currentIndex = _lowercaseAlphabet.indexOf(lowerChar);
        final shiftedIndex = (currentIndex - key) % 26;
        var shiftedChar = _lowercaseAlphabet[shiftedIndex];
        if (isUpperCase) shiftedChar = shiftedChar.toUpperCase();
        decryptedText.write(shiftedChar);
      } else {
        decryptedText.write(input[i]);
      }
    }

    return decryptedText.toString();
  }
}

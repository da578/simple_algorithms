# simple_algorithms

A collection of common and fundamental algorithms implemented in pure Dart. This package aims to provide simple, well-documented, and efficient implementations of various algorithms for educational purposes, rapid prototyping, or general utility in Dart and Flutter projects.

## Features

This library currently includes implementations for:

* **Caesar Cipher:** A simple substitution cipher algorithm for basic text encryption/decryption.
* **Fibonacci Sequence:** Functions to generate or calculate numbers in the Fibonacci sequence.
* **Palindrome Checker:** Algorithms to determine if a string or number is a palindrome.
* **Prime Number Operations:**
    * Checking if a number is prime (`isPrime`).
    * Generating a sequence of prime numbers up to a limit (using Sieve of Eratosthenes).
* **Roman Numeral Conversion:**
    * Converting decimal numbers to Roman numerals.
    * Converting Roman numerals to decimal numbers.

## Installation

Add `simple_algorithms` to your `pubspec.yaml` file:

```yaml
dependencies:
  simple_algorithms: ^0.0.1 # Replace with the latest version
```

Then, run dart pub get (or flutter pub get for Flutter projects) to fetch the package.

## Usage

Import the main library file:

```dart
import 'package:simple_algorithms/simple_algorithms.dart';
```

Here are some examples of how to use the provided algorithms:

### Caesar Cipher

```dart
void main() {
  String originalText = "HELLO WORLD";
  int shift = 3;

  String encryptedText = CaesarCipher.encrypt(originalText, shift);
  print('Encrypted: $encryptedText'); // Output: Encrypted: KHOOR ZRUOG

  String decryptedText = CaesarCipher.decrypt(encryptedText, shift);
  print('Decrypted: $decryptedText'); // Output: Decrypted: HELLO WORLD
}
```

### Fibonacci Sequence

```dart
void main() {
  // Generate sequence up to a limit
  List<int> fibSequence = Fibonacci.generateSequence(10);
  print('Fibonacci sequence up to 10: $fibSequence'); // Output: Fibonacci sequence up to 10: [0, 1, 1, 2, 3, 5, 8]

  // Get nth Fibonacci number
  int fib5 = Fibonacci.getNth(5);
  print('5th Fibonacci number: $fib5'); // Output: 5th Fibonacci number: 5
}
```

Palindrome Checker

```dart
void main() {
  String word1 = "madam";
  String word2 = "hello";
  int num1 = 121;
  int num2 = 123;

  print('"$word1" is palindrome? ${Palindrome.isPalindromeString(word1)}'); // Output: "madam" is palindrome? true
  print('"$word2" is palindrome? ${Palindrome.isPalindromeString(word2)}'); // Output: "hello" is palindrome? false
  print('$num1 is palindrome? ${Palindrome.isPalindromeNumber(num1)}'); // Output: 121 is palindrome? true
}
```

### Prime Number Operations

```dart
void main() {
  // Check if a number is prime
  print('7 is prime? ${PrimeNumber.confirm(7)}'); // Output: 7 is prime? true
  print('10 is prime? ${PrimeNumber.confirm(10)}'); // Output: 10 is prime? false

  // Generate prime sequence
  List<int> primes = PrimeNumber.generate(30);
  print('Primes up to 30: $primes'); // Output: Primes up to 30: [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
}
```

Roman Numeral Conversion
```dart
void main() {
  // Decimal to Roman
  String roman58 = RomanConversion.toRoman(58);
  print('58 in Roman: $roman58'); // Output: 58 in Roman: LVIII

  // Roman to Decimal
  int decimal1994 = RomanConversion.toDecimal("MCMXCIV");
  print('MCMXCIV in decimal: $decimal1994'); // Output: MCMXCIV in decimal: 1994
}
```

## Contributing

Contributions are welcome! If you have suggestions for new algorithms, improvements to existing ones, or bug fixes, feel free to open an issue or submit a pull request on the [GitHub repository](https://github.com/da578/simple_algorithms).

## License

This package is distributed under the MIT License. See the [LICENSE](LICENSE) file for details.
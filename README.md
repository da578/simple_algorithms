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

  String encryptedText = CaesarCipher.encrypt(originalText, shift: shift); // Using named parameter 'shift'
  print('Encrypted: $encryptedText'); // Output: Encrypted: KHOOR ZRUOG

  String decryptedText = CaesarCipher.decrypt(encryptedText, shift);
  print('Decrypted: $decryptedText'); // Output: Decrypted: HELLO WORLD
}
```

### Fibonacci Sequence

```dart
void main() {
  // Generate sequence up to a count of terms
  List<BigInt> fibSequence = Fibonacci.generateSequence(10);
  print('Fibonacci sequence up to 10 terms: $fibSequence'); // Output: Fibonacci sequence up to 10 terms: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

  // Check if a number is a Fibonacci number
  BigInt fibNumber = BigInt.from(5);
  print('$fibNumber is a Fibonacci number? ${Fibonacci.isFibonacci(fibNumber)}');
  BigInt nonFibNumber = BigInt.from(6);
  print('$nonFibNumber is a Fibonacci number? ${Fibonacci.isFibonacci(nonFibNumber)}');
}
```

Palindrome Checker

```dart
void main() {
  String word1 = "madam";
  String word2 = "hello";
  int num1 = 121;
  int num2 = 123;

  print('"$word1" is palindrome (string)? ${Palindrome.isPalindromeString(word1)}');
  print('"$word2" is palindrome (string)? ${Palindrome.isPalindromeString(word2)}');
}
```

### Prime Number Operations

```dart
void main() {
  // Check if a number is prime
  print('7 is prime? ${PrimeNumber.isPrime(7)}');
  print('10 is prime? ${PrimeNumber.isPrime(10)}');

  // Generate prime sequence
  List<int> primes = PrimeNumber.generatePrimes(30); // Renamed generate to generatePrimes
  print('Primes up to 30: $primes'); // Output: Primes up to 30: [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
}
```

Roman Numeral Conversion
```dart
void main() {
  // Decimal to Roman
  String roman58 = RomanConversion.toRomanNumeral(58);
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
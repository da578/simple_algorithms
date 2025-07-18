# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.1.0 - 2025-07-18

### Added

* Introduced `FactorialCalculator` module for standard factorial, double factorial, rising factorial, and falling factorial calculations.
* Added `NumberTheoryUtils` module for Greatest Common Divisor (GCD) and Least Common Multiple (LCM) calculations.
* Implemented `TemperatureConverter` module for conversions between Celsius, Fahrenheit, and Kelvin.

### Fixed

* **RomanConversion:** Corrected a critical bug in `toRomanNumeral` where `_decimalValues[i]` was incorrectly used instead of `_romanSymbols[i]` when appending the Roman symbol to the result.

### Breaking Changes

* Method names and parameters have been updated across `CaesarCipher`, `Fibonacci`, `Palindrome`, `PrimeNumber`, and `RomanConversion` classes for improved semantic clarity and consistency. Users upgrading from `0.0.1` will need to update their calls to these methods.

## 0.0.1 - 2025-07-17

### Added

* Initial release of the `simple_algorithms` package.
* Implemented `CaesarCipher` with encryption and decryption.
* Implemented `Fibonacci` with sequence generation and Nth number calculation.
* Implemented `Palindrome` checker for strings and numbers.
* Implemented `PrimeNumber` checker and sequence generator (Sieve of Eratosthenes).
* Implemented `RomanConversion` for decimal to Roman and Roman to decimal conversions.
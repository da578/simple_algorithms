/// A utility class for calculating various types of factorials.
///
/// This class provides static methods to compute standard factorial (n!),
/// double factorial (n!!), rising factorial (Pochhammer symbol),
/// and falling factorial for non-negative integer inputs.
///
/// Due to the rapid growth of factorial values, all methods return [BigInt]
/// to prevent overflow.
class Factorial {
  /// Calculates the factorial of a non-negative integer [n] using an iterative approach.
  ///
  /// The factorial of a non-negative integer n, denoted by n!, is the product
  /// of all positive integers less than or equal to n.
  ///
  /// Definition:
  /// - 0! = 1
  /// - n! = n * (n-1) * (n-2) * ... * 1 for n > 0
  ///
  /// Parameters:
  /// - [n]: The non-negative integer for which to calculate the factorial.
  ///
  /// Returns:
  /// A [BigInt] representing the factorial of [n].
  ///
  /// Throws:
  /// - [ArgumentError]: If [n] is a negative number.
  static BigInt calculate(int n) {
    if (n < 0) {
      throw ArgumentError('Factorial is not defined for negative numbers.');
    }

    if (n == 0) {
      return BigInt.one;
    }

    var result = BigInt.one;

    for (int i = 1; i <= n; i++) {
      result *= BigInt.from(i);
    }

    return result;
  }

  /// Calculates the double factorial (n!!) of an integer [n] using an iterative approach.
  ///
  /// The double factorial is the product of all integers from 1 up to n that
  /// have the same parity (odd or even) as n.
  ///
  /// Definition:
  /// - If n is even: n!! = n * (n-2) * (n-4) * ... * 2
  /// - If n is odd:  n!! = n * (n-2) * (n-4) * ... * 1
  /// - 0!! = 1
  /// - (-1)!! = 1 (by convention, for consistency with Gamma function relations)
  ///
  /// Parameters:
  /// - [n]: The integer for which to calculate the double factorial.
  ///
  /// Returns:
  /// A [BigInt] representing the double factorial of [n].
  ///
  /// Throws:
  /// - [ArgumentError]: If [n] is a negative number less than -1.
  static BigInt calculateDouble(int n) {
    if (n < -1) {
      throw ArgumentError(
        'Double factorial is not defined for numbers less than -1.',
      );
    }

    if (n == 0 || n == -1) {
      return BigInt.one;
    }

    var result = BigInt.one;
    for (int i = n; i >= 1; i -= 2) {
      result *= BigInt.from(i);
    }

    return result;
  }

  /// Calculates the rising factorial (Pochhammer symbol) of [x] to the power of [n].
  ///
  /// The rising factorial, denoted by x^(n) or (x)n, is defined as the product
  /// of n terms, starting with x and each successive term increasing by 1.
  ///
  /// Definition:
  /// x^(n) = x * (x+1) * (x+2) * ... * (x+n-1)
  ///
  /// - If n = 0, x^(0) = 1 (this is an empty product).
  ///
  /// Parameters:
  /// - [x]: The starting number (can be any integer).
  /// - [n]: The number of terms to multiply (must be a non-negative integer).
  ///
  /// Returns:
  /// A [BigInt] representing the rising factorial of [x] to [n].
  ///
  /// Throws:
  /// - [ArgumentError]: If [n] is a negative number.
  static BigInt calculateRising(int x, int n) {
    if (n < 0) {
      throw ArgumentError('Rising factorial is not defined for negative n.');
    }

    if (n == 0) return BigInt.one;
    var result = BigInt.from(x);

    for (int i = 0; i < n; i++) {
      result *= BigInt.from(x + i);
    }

    return result;
  }

  /// Calculates the falling factorial of [x] to the power of [n].
  ///
  /// The falling factorial, denoted by (x)n or P(x, n), is defined as the product
  /// of n terms, starting with x and each successive term decreasing by 1.
  /// It is equivalent to the number of permutations of n items chosen from x.
  ///
  /// Definition:
  /// (x)n = x * (x-1) * (x-2) * ... * (x-n+1)
  ///
  /// - If n = 0, (x)0 = 1 (this is an empty product).
  /// - If n > x and x is a non-negative integer, (x)n = 0.
  ///   (This specific implementation will naturally return 0 if x becomes 0
  ///   or if a factor of 0 is encountered. For stricter adherence to the
  ///   permutation definition, an explicit check `if (n > x && x >= 0) return BigInt.zero;`
  ///   could be added).
  ///
  /// Parameters:
  /// - [x]: The starting number (can be any integer).
  /// - [n]: The number of terms to multiply (must be a non-negative integer).
  ///
  /// Returns:
  /// A [BigInt] representing the falling factorial of [x] to [n].
  ///
  /// Throws:
  /// - [ArgumentError]: If [n] is a negative number.
  static BigInt calculateFalling(int x, int n) {
    if (n < 0) {
      throw ArgumentError('Falling factorial is not defined for negative n.');
    }

    if (n == 0) return BigInt.one;

    // Optional: For stricter permutation definition (P(x,n) = 0 if n > x and x >= 0)
    // if (n > x && x >= 0) {
    //   return BigInt.zero;
    // }

    var result = BigInt.one;
    for (int i = 0; i < n; i++) {
      result *= BigInt.from(x - i);
    }

    return result;
  }
}

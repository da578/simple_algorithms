/// A utility class for fundamental number theory operations,
/// including Greatest Common Divisor (GCD) and Least Common Multiple (LCM).
///
/// This class provides static methods to compute these values efficiently
/// for integer inputs.
class NumberTheoryUtils {
  /// Calculates the Greatest Common Divisor (GCD) of two integers [a] and [b]
  /// using the Euclidean algorithm.
  ///
  /// The GCD is the largest positive integer that divides both [a] and [b]
  /// without leaving a remainder.
  ///
  /// The algorithm handles negative inputs by taking their absolute values,
  /// as GCD is conventionally defined for positive integers.
  ///
  /// Parameters:
  /// - [a]: The first integer.
  /// - [b]: The second integer.
  ///
  /// Returns:
  /// An [int] representing the Greatest Common Divisor of [a] and [b].
  /// Returns the absolute value of [a] if [b] is 0, and the absolute value of [b] if [a] is 0.
  /// If both are 0, it returns 0.
  static int gcd(int a, int b) {
    a = a.abs();
    b = b.abs();

    while (b != 0) {
      var temp = b;
      b = a % b;
      a = temp;
    }

    return a;
  }

  /// Calculates the Least Common Multiple (LCM) of two integers [a] and [b].
  ///
  /// The LCM is the smallest positive integer that is a multiple of both [a] and [b].
  ///
  /// This method uses the relationship: LCM(a, b) = (|a * b|) / GCD(a, b).
  /// It handles negative inputs by taking their absolute values.
  ///
  /// Parameters:
  /// - [a]: The first integer.
  /// - [b]: The second integer.
  ///
  /// Returns:
  /// An [int] representing the Least Common Multiple of [a] and [b].
  /// Returns 0 if either [a] or [b] is 0.
  static int lcm(int a, int b) {
    if (a == 0 || b == 0) return 0;

    a = a.abs();
    b = b.abs();

    final gcdVal = gcd(a, b);
    final lcmVal = (a ~/ gcdVal) * b;

    return lcmVal;
  }
}

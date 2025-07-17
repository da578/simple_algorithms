/// fibonacci_module.dart
///
/// A utility class for generating and confirming Fibonacci numbers.
class Fibonacci {
  /// Generates a Fibonacci sequence up to the specified number of terms.
  ///
  /// The sequence starts with F0 = 0 and F1 = 1.
  ///
  /// Examples:
  /// - `generate(0)` returns `[]`
  /// - `generate(1)` returns `[0]`
  /// - `generate(2)` returns `[0, 1]`
  /// - `generate(5)` returns `[0, 1, 1, 2, 3]`
  ///
  /// Returns a [List<BigInt>] containing the Fibonacci numbers.
  /// Returns an empty list if [n] is 0.
  ///
  /// Throws an [ArgumentError] if [n] is negative.
  static List<BigInt> generateSequence(int n) {
    if (n < 0) throw ArgumentError('Input must be a non-negative number.');
    if (n == 0) return [];
    if (n == 1) return [BigInt.zero];

    final List<BigInt> fibonacciSeries = [BigInt.zero, BigInt.one];
    for (int i = 2; i < n; i++) {
      fibonacciSeries.add(fibonacciSeries[i - 2] + fibonacciSeries[i - 1]);
    }
    return fibonacciSeries;
  }

  /// Confirms if a given non-negative number [n] is a Fibonacci number.
  ///
  /// This method efficiently checks if [n] is present in the Fibonacci sequence
  /// by generating Fibonacci numbers until [n] is found or exceeded.
  ///
  /// Note: While functionally correct, this implementation builds a list,
  /// which might be less memory-efficient for very large `n` compared to
  /// an iterative approach using only two `BigInt` variables.
  /// For optimal memory usage, consider a version that doesn't build the list.
  ///
  /// Returns `true` if [n] is a Fibonacci number, `false` otherwise.
  ///
  /// Throws an [ArgumentError] if [n] is negative.
  static bool isFibonacci(BigInt n) {
    if (n < BigInt.zero) {
      throw ArgumentError('Input must be a non-negative number');
    }

    final fibonacciSeries = [BigInt.zero, BigInt.one];

    if (n == BigInt.zero || n == BigInt.one) return true;

    while (fibonacciSeries.last < n) {
      final nextFib =
          fibonacciSeries[fibonacciSeries.length - 2] +
          fibonacciSeries[fibonacciSeries.length - 1];
      fibonacciSeries.add(nextFib);
    }

    return fibonacciSeries.last == n;
  }
}

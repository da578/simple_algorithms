/// A utility class for performing prime number related operations.
/// This class provides methods to generate a sequence of prime numbers
/// and to confirm if a single number is prime.
class PrimeNumber {
  /// Generates a list of prime numbers up to a specified limit
  /// using the Sieve of Eratosthenes algorithm.
  ///
  /// The SSieve of Eratosthenes is an efficient algorithm for finding all
  /// prime numbers up to any given limit. It works by iteratively marking
  /// as composite (i.e., not prime) the multiples of each prime,
  /// starting with the first prime number, 2.
  ///
  /// Parameters:
  /// - [limit]: The upper bound (inclusive) up to which prime numbers
  ///   should be generated. Must be an integer.
  ///
  /// Returns:
  /// A `List<int>` containing all prime numbers from 2 up to [limit].
  /// Returns an empty list if [limit] is less than 2.
  static List<int> generatePrimes(int limit) {
    if (limit < 2) return [];

    final isPrime = List.filled(limit + 1, true);
    isPrime[0] = false;
    isPrime[1] = false;

    for (int i = 2; i * i <= limit; i++) {
      if (isPrime[i]) {
        for (int j = i * i; j <= limit; j += i) {
          isPrime[j] = false;
        }
      }
    }

    final primes = <int>[];
    for (int i = 2; i <= limit; i++) {
      if (isPrime[i]) {
        primes.add(i);
      }
    }
    return primes;
  }

  /// Confirms whether a given integer is a prime number.
  ///
  /// A prime number is a natural number greater than 1 that has no
  /// positive divisors other than 1 and itself.
  ///
  /// Parameters:
  /// - [n]: The integer number to be checked for primality.
  ///
  /// Returns:
  /// `true` if [n] is a prime number, `false` otherwise.
  static bool isPrime(int n) {
    if (n < 2) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;

    for (int i = 3; i * i <= n; i += 2) {
      if (n % i == 0) return false;
    }
    return true;
  }
}

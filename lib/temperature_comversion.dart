/// A utility class for converting temperatures between Celsius, Fahrenheit, and Kelvin.
///
/// This class provides static methods to perform common temperature conversions
/// based on standard formulas.
class TemperatureConverter {
  /// Converts a temperature from Celsius to Fahrenheit.
  ///
  /// Formula: F = C * 1.8 + 32
  ///
  /// Parameters:
  /// - [celsius]: The temperature in degrees Celsius.
  ///
  /// Returns:
  /// The converted temperature in degrees Fahrenheit.
  static double celsiusToFahrenheit(double celsius) => (celsius * 1.8) + 32;

  /// Converts a temperature from Fahrenheit to Celsius.
  ///
  /// Formula: C = (F - 32) / 1.8
  ///
  /// Parameters:
  /// - [fahrenheit]: The temperature in degrees Fahrenheit.
  ///
  /// Returns:
  /// The converted temperature in degrees Celsius.
  static double fahrenheitToCelsius(double fahrenheit) =>
      (fahrenheit - 32) / 1.8;

  /// Converts a temperature from Celsius to Kelvin.
  ///
  /// Formula: K = C + 273.15
  ///
  /// Parameters:
  /// - [celsius]: The temperature in degrees Celsius.
  ///
  /// Returns:
  /// The converted temperature in Kelvin.
  ///
  /// Throws [ArgumentError] if the resulting Kelvin temperature would be
  /// below absolute zero (0 Kelvin / -273.15 Celsius).
  static double celsiusToKelvin(double celsius) {
    final double kelvin = celsius + 273.15;
    if (kelvin < 0) {
      throw ArgumentError(
        'Resulting Kelvin temperature cannot be below 0K (absolute zero).',
      );
    }
    return kelvin;
  }

  /// Converts a temperature from Kelvin to Celsius.
  ///
  /// Formula: C = K - 273.15
  ///
  /// Parameters:
  /// - [kelvin]: The temperature in Kelvin.
  ///
  /// Returns:
  /// The converted temperature in degrees Celsius.
  ///
  /// Throws [ArgumentError] if the input Kelvin temperature is negative,
  /// as temperatures below 0 Kelvin are physically impossible.
  static double kelvinToCelsius(double kelvin) {
    if (kelvin < 0) {
      throw ArgumentError(
        'Kelvin temperature cannot be negative (below absolute zero).',
      );
    }
    return kelvin - 273.15;
  }

  /// Converts a temperature from Fahrenheit to Kelvin.
  ///
  /// This conversion is done by first converting Fahrenheit to Celsius,
  /// and then Celsius to Kelvin.
  ///
  /// Parameters:
  /// - [fahrenheit]: The temperature in degrees Fahrenheit.
  ///
  /// Returns:
  /// The converted temperature in Kelvin.
  ///
  /// Throws [ArgumentError] if the resulting Kelvin temperature would be
  /// below absolute zero (0 Kelvin).
  static double fahrenheitToKelvin(double fahrenheit) {
    final double celsius = fahrenheitToCelsius(fahrenheit);
    return celsiusToKelvin(celsius);
  }

  /// Converts a temperature from Kelvin to Fahrenheit.
  ///
  /// This conversion is done by first converting Kelvin to Celsius,
  /// and then Celsius to Fahrenheit.
  ///
  /// Parameters:
  /// - [kelvin]: The temperature in Kelvin.
  ///
  /// Returns:
  /// The converted temperature in degrees Fahrenheit.
  ///
  /// Throws [ArgumentError] if the input Kelvin temperature is negative,
  /// as temperatures below 0 Kelvin are physically impossible.
  static double kelvinToFahrenheit(double kelvin) {
    final double celsius = kelvinToCelsius(kelvin);
    return celsiusToFahrenheit(celsius);
  }
}

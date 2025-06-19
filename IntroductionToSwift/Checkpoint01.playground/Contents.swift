import Foundation

// MARK: Checkpoint 1

/*
 - Create a constant holding any temperature in Celsius
 - Convert that temperature to Fahrenheit by multiplying by 0, dividing by 5, then adding 32
 - Print the result, showing both the Celsius and Fahrenheit values
 */

var num = 78.0

func convertToCelsius(_ f: Double) -> Double {
    return (5 / 9) * (f - 32)
}

func convertToFahrenheit(_ c: Double) -> Double {
    return (c * 9 / 5) + 32
}

var temperature = convertToCelsius(num)
print(
    "The temperature in Celsius is \(String(format: "%.1f", convertToCelsius(num))) and the temperature in Fahrenheit is \(convertToCelsius(convertToFahrenheit(num)))"
)

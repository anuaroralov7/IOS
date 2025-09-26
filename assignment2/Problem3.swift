import Foundation

/// Конвертирует градусы Цельсия в Фаренгейты.
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9 / 5) + 32
}

/// Конвертирует градусы Цельсия в Кельвины.
func celsiusToKelvin(_ celsius: Double) -> Double {
    return celsius + 273.15
}

/// Конвертирует градусы Фаренгейта в Цельсии.
func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5 / 9
}

/// Конвертирует градусы Фаренгейта в Кельвины.
func fahrenheitToKelvin(_ fahrenheit: Double) -> Double {
    let celsius = fahrenheitToCelsius(fahrenheit)
    return celsiusToKelvin(celsius)
}

/// Конвертирует Кельвины в градусы Цельсия.
func kelvinToCelsius(_ kelvin: Double) -> Double {
    return kelvin - 273.15
}

/// Конвертирует Кельвины в градусы Фаренгейта.
func kelvinToFahrenheit(_ kelvin: Double) -> Double {
    let celsius = kelvinToCelsius(kelvin)
    return celsiusToFahrenheit(celsius)
}

let temperatureValue: Double = 25.0
let originalUnit: String = "C" // Возможные значения: "C", "F", "K"

print("Original temperature: \(temperatureValue)°\(originalUnit)")

if originalUnit.uppercased() == "C" {
    let fahrenheit = celsiusToFahrenheit(temperatureValue)
    let kelvin = celsiusToKelvin(temperatureValue)
    print("Converted to Fahrenheit: \(fahrenheit)°F")
    print("Converted to Kelvin: \(kelvin)K")
} else if originalUnit.uppercased() == "F" {
    let celsius = fahrenheitToCelsius(temperatureValue)
    let kelvin = fahrenheitToKelvin(temperatureValue)
    print("Converted to Celsius: \(celsius)°C")
    print("Converted to Kelvin: \(kelvin)K")
} else if originalUnit.uppercased() == "K" {
    let celsius = kelvinToCelsius(temperatureValue)
    let fahrenheit = kelvinToFahrenheit(temperatureValue)
    print("Converted to Celsius: \(celsius)°C")
    print("Converted to Fahrenheit: \(fahrenheit)°F")
} else {
    print("Invalid unit specified. Please use 'C', 'F', or 'K'.")
}

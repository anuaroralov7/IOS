import Foundation

/// Проверяет, является ли переданное число простым.
/// - Parameter number: Целое число для проверки.
/// - Returns: `true`, если число простое, и `false` в противном случае.
func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

print("Prime numbers between 1 and 100:")
for number in 1...100 {
    if isPrime(number) {
        print(number)
    }
}

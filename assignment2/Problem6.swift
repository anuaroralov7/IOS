import Foundation

/// Генерирует первые n чисел последовательности Фибоначчи.
/// - Parameter n: Количество чисел в последовательности.
/// - Returns: Массив, содержащий n чисел Фибоначчи.
func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 {
        return []
    }
    
    if n == 1 {
        return [0]
    }
    
    var sequence = [0, 1]
    
    while sequence.count < n {
        let nextNumber = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(nextNumber)
    }
    
    return sequence
}


let fibSequence10 = fibonacci(10)
print("First 10 Fibonacci numbers: \(fibSequence10)")

let fibSequence1 = fibonacci(1)
print("First 1 Fibonacci number: \(fibSequence1)")

let fibSequence0 = fibonacci(0)
print("First 0 Fibonacci numbers: \(fibSequence0)") 

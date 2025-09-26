import Foundation

func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        print("Error: Division by zero is not allowed.")
        return nil // Возвращаем nil в случае ошибки.
    }
    return a / b
}

let num1: Double = 100
let num2: Double = 25
let operation: Character = "/"

print("First number: \(num1)")
print("Second number: \(num2)")
print("Operation: \(operation)")

var result: Double?

switch operation {
case "+":
    result = add(num1, num2)
case "-":
    result = subtract(num1, num2)
case "*":
    result = multiply(num1, num2)
case "/":
    result = divide(num1, num2)
default:
    print("Invalid operation. Please use '+', '-', '*', or '/'.")
}

if let finalResult = result {
    print("Result: \(finalResult)")
}

print("\n--- Testing division by zero ---")
let num3: Double = 50
let num4: Double = 0
if let finalResult = divide(num3, num4) {
    print("Result: \(finalResult)")
}

import Foundation

let studentScores = [
    "Alice": 85,
    "Bob": 92,
    "Charlie": 78,
    "David": 65,
    "Eve": 95
]

let scores = Array(studentScores.values)

let totalScore = scores.reduce(0, +)
let averageScore = Double(totalScore) / Double(scores.count)

let highestScore = scores.max() ?? 0
let lowestScore = scores.min() ?? 0

print("--- Test Results ---")
print(String(format: "Average Score: %.2f", averageScore))
print("Highest Score: \(highestScore)")
print("Lowest Score: \(lowestScore)")
print("--------------------")

print("\n--- Student Details ---")
for (name, score) in studentScores.sorted(by: { $0.key < $1.key }) {
    let comparison = Double(score) >= averageScore ? "Above Average" : "Below Average"
    print("\(name): \(score) (\(comparison))")
}

import Foundation

/// Проверяет, является ли строка палиндромом, игнорируя регистр,
/// пробелы и знаки препинания.
/// - Parameter text: Строка для проверки.
/// - Returns: `true`, если строка - палиндром, иначе `false`.
func isPalindrome(_ text: String) -> Bool {
    let nonAlphanumeric = CharacterSet.alphanumerics.inverted
    let cleanedText = text.lowercased().components(separatedBy: nonAlphanumeric).joined()
    
    let reversedText = String(cleanedText.reversed())
    
    return !cleanedText.isEmpty && cleanedText == reversedText
}

let testString1 = "A man, a plan, a canal: Panama"
print("\"\(testString1)\" is a palindrome: \(isPalindrome(testString1))")

let testString2 = "race a car"
print("\"\(testString2)\" is a palindrome: \(isPalindrome(testString2))")

let testString3 = "Was it a car or a cat I saw?"
print("\"\(testString3)\" is a palindrome: \(isPalindrome(testString3))")

let testString4 = "hello"
print("\"\(testString4)\" is a palindrome: \(isPalindrome(testString4))") 

import Foundation

/// Проверяет, состоит ли строка из уникальных символов.
/// Учитывает регистр ('A' и 'a' считаются разными символами).
/// - Parameter text: Строка для проверки.
/// - Returns: `true`, если все символы уникальны, иначе `false`.
func hasUniqueCharacters(_ text: String) -> Bool {
    let characterSet = Set(text)
    
    return text.count == characterSet.count
}

let uniqueString1 = "abcdefg"
print("\"\(uniqueString1)\" has unique characters: \(hasUniqueCharacters(uniqueString1))")

let uniqueString2 = "hello"
print("\"\(uniqueString2)\" has unique characters: \(hasUniqueCharacters(uniqueString2))")

let uniqueString3 = "AaBbCc"
print("\"\(uniqueString3)\" has unique characters: \(hasUniqueCharacters(uniqueString3))")

let uniqueString4 = ""
print("\"\(uniqueString4)\" has unique characters: \(hasUniqueCharacters(uniqueString4))") 

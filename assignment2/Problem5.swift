import Foundation

let sentence = "Hello world, this is a test. Hello World again!"

var wordFrequencies: [String: Int] = [:]

let lowercasedSentence = sentence.lowercased()

let punctuation = CharacterSet.punctuationCharacters
let sentenceWithoutPunctuation = lowercasedSentence.components(separatedBy: punctuation).joined()

let words = sentenceWithoutPunctuation.components(separatedBy: .whitespacesAndNewlines)

for word in words {
    if !word.isEmpty {
        wordFrequencies[word, default: 0] += 1
    }
}

print("Original sentence: \"\(sentence)\"")
print("\nWord Frequencies:")
for (word, count) in wordFrequencies {
    print("'\(word)': \(count)")
}

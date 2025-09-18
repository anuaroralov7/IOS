var firstName: String = "Anuar"
var lastName: String = "Oralov"
let birthYear: Int = 2005
let currentYear: Int = 2025
var age: Int = currentYear - birthYear
var isStudent: Bool = true
var height: Double = 1.70
var favoriteFood: String = "🍕 Pizza"
var country: String = "Kazakhstan"
var hobby: String = "Playing games"
var numberOfHobbies: Int = 3
var favoriteNumber: Int = 7
var isHobbyCreative: Bool = true
var otherHobby: String = "Basketball"
var favoriteEmoji: String = "😎"
var futureGoals: String = "In the future, I want to become a professional iOS developer 🚀(No)"

var lifeStory: String = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear).
I am currently a student: \(isStudent).
My height is \(height) meters. I live in \(country) and my favorite food is \(favoriteFood).
I enjoy \(hobby), which is a creative hobby: \(isHobbyCreative).
I also like \(otherHobby). I have \(numberOfHobbies) hobbies in total.
My favorite number is \(favoriteNumber), and my favorite emoji is \(favoriteEmoji).
\(futureGoals)
""

print(lifeStory)

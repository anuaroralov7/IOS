import Foundation

public struct Product {
    
    public let id: String
    public let name: String
    public var price: Double
    public let category: Category
    public let description: String
    
    public enum Category {
        case electronics
        case clothing
        case food
        case books
    }
    
    public var displayPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        
        return formatter.string(from: NSNumber(value: price)) ?? "$\(price)"
    }
    
    public init?(id: String, name: String, price: Double, category: Category, description: String) {
        guard price > 0 else {
            print("цена должна быть положительной")
            return nil
        }
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}

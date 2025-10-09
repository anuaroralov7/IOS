import Foundation

public struct CartItem {
    
    public let product: Product
    public private(set) var quantity: Int
    
    public var subtotal: Double {
        return product.price * Double(quantity)
    }
    
    public init(product: Product, quantity: Int) {
        self.product = product
        self.quantity = quantity
    }
    
    public mutating func updateQuantity(_ newQuantity: Int) {
        if newQuantity > 0 {
            self.quantity = newQuantity
        } else {
            print("количество должно быть больше нуля")
        }
    }
    
    public mutating func increaseQuantity(by amount: Int) {
        self.quantity += amount
    }
}

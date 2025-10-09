import Foundation

public class ShoppingCart {
    
    public private(set) var items: [CartItem] = []
    public var discountCode: String?
    
    public init() {}
    
    public func addItem(product: Product, quantity: Int = 1) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].increaseQuantity(by: quantity)
        } else {
            let newItem = CartItem(product: product, quantity: quantity)
            items.append(newItem)
        }
    }
    
    public func removeItem(productId: String) {
        items.removeAll { $0.product.id == productId }
    }
    
    public func updateItemQuantity(productId: String, quantity: Int) {
        if let index = items.firstIndex(where: { $0.product.id == productId }) {
            if quantity > 0 {
                items[index].updateQuantity(quantity)
            } else {
                removeItem(productId: productId)
            }
        }
    }
    
    public func clearCart() {
        items.removeAll()
    }
    
    public var subtotal: Double {
        return items.reduce(0) { $0 + $1.subtotal }
    }
    
    public var discountAmount: Double {
        guard let code = discountCode else { return 0 }
        
        switch code.uppercased() {
        case "SAVE10":
            return subtotal * 0.10
        case "SAVE20":
            return subtotal * 0.20
        default:
            return 0
        }
    }
    
    public var total: Double {
        return subtotal - discountAmount
    }
    
    public var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
    
    public var isEmpty: Bool {
        return items.isEmpty
    }
}

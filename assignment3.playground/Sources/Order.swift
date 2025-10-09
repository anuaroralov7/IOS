import Foundation

public struct Order {
    public let orderId: String
    public let items: [CartItem]
    public let subtotal: Double
    public let discountAmount: Double
    public let total: Double
    public let timestamp: Date
    public let shippingAddress: Address
    
    public init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
    
    public var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
}

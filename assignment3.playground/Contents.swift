import Foundation

let laptop = Product(id: "p1", name: "Ноутбук", price: 1000, category: .electronics, description: "...")!
let book = Product(id: "p2", name: "Книга", price: 25, category: .books, description: "...")!

let cart = ShoppingCart()
cart.addItem(product: laptop, quantity: 1)
cart.addItem(product: book, quantity: 2)
print("в корзине \(cart.itemCount) товаров. Итого: $\(cart.total)\n")

print("проверка Struct (CartItem)")
var itemA = CartItem(product: book, quantity: 1)
var itemB = itemA

itemB.updateQuantity(5)

print("количество в оригинале (itemA): \(itemA.quantity)")
print("количество в копии (itemB): \(itemB.quantity)")
print("вывод: Оригинал не изменился.\n")

print("Проверка Class (ShoppingCart)")
let originalCart = ShoppingCart()
originalCart.addItem(product: laptop)

let anotherCartReference = originalCart
anotherCartReference.addItem(product: book)

print("товаров в originalCart: \(originalCart.itemCount)")
print("товаров в anotherCartReference: \(anotherCartReference.itemCount)")
print("вывод: Изменение через ссылку повлияло на оригинал.\n")

print("проверка неизменяемости Заказа (Order)")
let address = Address(street: "Улица Пушкина", city: "Москва", zipCode: "123456", country: "Россия")
let order = Order(from: cart, shippingAddress: address)

print("товаров в заказе: \(order.itemCount)")

cart.clearCart()
print("корзина была очищена. Товаров в корзине: \(cart.itemCount)")
print("Товаров в заказе ПОСЛЕ очистки корзины: \(order.itemCount)")
print("Вывод: Заказ остался неизменным.\n")

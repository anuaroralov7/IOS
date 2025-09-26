import Foundation

var shoppingList: [String] = ["Apples", "Milk", "Bread"]

func displayList() {
    print("\n--- Current Shopping List ---")
    if shoppingList.isEmpty {
        print("The list is empty.")
    } else {
        for (index, item) in shoppingList.enumerated() {
            print("\(index + 1). \(item)")
        }
    }
    print("----------------------------")
}

func addItem(name: String) {
    shoppingList.append(name)
    print("'\(name)' has been added to the list.")
}

func removeItem(at index: Int) {
    // Проверяем, что индекс находится в допустимых границах массива.
    if index >= 0 && index < shoppingList.count {
        let removedItem = shoppingList.remove(at: index)
        print("'\(removedItem)' has been removed from the list.")
    } else {
        print("Invalid item number. Please try again.")
    }
}

displayList()

addItem(name: "Cheese")
displayList()


removeItem(at: 1)
displayList()

removeItem(at: 10)
displayList()

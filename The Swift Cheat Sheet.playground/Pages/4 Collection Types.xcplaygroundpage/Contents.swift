//: ## ![SwiftSimplified.com](swift-simplified-logo.png)
//:
//: ![Swift Simplified .com](ss-in-content-logo.png) [Swift Simplified .com](https://www.swiftsimplified.com)
//:
//: [Swift.org](https://www.swift.org) | [SwiftSimplified.com](https://www.swiftsimplified.com) | [Online Course](https://www.swiftsimplified.com/the-swift-handbook) | [Swift Language Guide](https://www.swiftsimplified.com/the-swift-language-guide)
//:
//: -------------------
//: ## The  Swift Cheat Sheet ⚡️
//: This is the [official Apple Swift Language Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics) converted into Xcode playground pages.
//:
//: The text has been condensed to focus on code examples.
//:
//: v1 | Swift v5.9+ | Xcode 14+ | [The Original Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)
//:
//: -------------------
//:
//: ## Topic 4: Collection Types
//:
//:
//: Swift provides three primary collection types; arrays, sets, and dictionaries.
//:
//: ![Diagram](CollectionTypes_intro_2x.png)
//:
//: -------------------
//:
//: ## Mutability of Collections
//:
//: Use `var` to create a mutable collection:
//:
//: Use `let` to create an immutable collection:
var mutableArray = [0,1,2,3]
mutableArray.append(4)

let immutableArray = [0,1,2,3,4]
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Arrays
//:
//: An array stores values of the same type in an ordered list.
//:
//: -------------------
//:
//: ### Array Type Shorthand Syntax
//:
//: Use longhand form and shorthand form to declare an array:
let longhandFormArray: Array<Int> = Array<Int>()
let shorthandFormArray: [Int] = [Int]() // preferred
//:
//: -------------------
//:
//: ### Creating an Empty Array
//:
//: Use initialiser syntax to create an empty array:
var someInts = [Int]() // initialiser syntax
someInts.append(3)
print("someInts is of type [Int] with \(someInts.count) items.")
// Prints "someInts is of type [Int] with 1 item."
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Creating an Array with a Default Value
//:
//: Use an initializer for creating an array with all values set to the same value.
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Creating an Array by Adding Two Arrays Together
//:
//: Add together two existing arrays:
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Creating an Array with an Array Literal
//:
//: You can initialize an array with an array literal:
let arrayLiteral = ["value1", "value2", "value3"] // array literal
let emptyArrayLiteral: [String] = [] // empty array literal
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use an array literal to set the type:
let shoppingList1: [String] = ["Eggs", "Milk"]
let shoppingList2 = ["Eggs", "Milk"] // declared as [String]
// shoppingList2 is declared using type inference
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Accessing and Modifying an Array
//:
//: Use methods and properties to access or modify values.
//:
//: Alternatively you can use subscript syntax.
//:
//: -------------------
//:
//: Use the `count` property to find out the number of elements:
var shoppingList = ["Eggs", "Milk"]
print("The shopping list contains \(shoppingList.count) items.")
// Prints "The shopping list contains 2 items."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use the Boolean `isEmpty` property to check if `count` is zero:
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}
// Prints "The shopping list isn't empty."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Add a new item to the end:
shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes
// << 🔵 Run Point
//:
//: -------------------
//:
//: Alternatively, append an entire array:
shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items
// << 🔵 Run Point
//:
//: -------------------
//:
//: Retrieve a value from the array using subscript syntax:
var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use subscript syntax to change an existing value:
shoppingList[0] = "Six eggs"
// the first item in the list is now equal to "Six eggs" rather than "Eggs"
// << 🔵 Run Point
//:
//: -------------------
//:
//: When using subscript syntax, the index needs to be valid:
// ⛔️ Run time error: uncomment to view
//shoppingList[shoppingList.count] = "Salt"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use subscript to change a range of values at once:
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)
// shoppingList now contains 6 items
// << 🔵 Run Point
//:
//: -------------------
//:
//: Insert an item into the array at a specified index:
shoppingList.insert("Maple Syrup", at: 0)
firstItem = shoppingList[0] // now is "Maple Syrup"
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list
// << 🔵 Run Point
//:
//: -------------------
//:
//: Remove an item from an array:
let mapleSyrup = shoppingList.remove(at: 0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string
// << 🔵 Run Point
//:
//: -------------------
//:
//: Any gaps in an array are closed when an item is removed:
firstItem = shoppingList[0] //  back to "Six eggs"
// firstItem is now equal to "Six eggs"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Remove the final element:
let apples = shoppingList.removeLast()
// the last item in the array has just been removed
// shoppingList now contains 5 items, and no apples
// the apples constant is now equal to the removed "Apples" string
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Iterating Over an Array
//:
//: Use a `for-in` loop to iterate over all values:
for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use the `enumerated()` function to use both index and value:
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas
// << 🔵 Run Point
//:
//: -------------------
//:
//: For more about the `for-in` loop, see For-In Loops.
//:
//: -------------------
//:
//: ## Sets
//:
//: A set stores unique values in a collection with no ordering.
//:
//: -------------------
//:
//: ### Hash Values for Set Types
//:
//: A type must be hashable in order to be stored in a set.
//:
//: All of Swift’s basic types (such as `String`, `Int`, `Double`, and `Bool`) are hashable by default.
//:
//: -------------------
//:
//: ### Set Type Syntax
//:
//: Sets don’t have a shorthand form:
let longhandFormSet: Set<Int> = Set<Int>()
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Creating and Initializing an Empty Set
//:
//: Use initializer syntax to create an empty set:
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// Prints "letters is of type Set<Character> with 0 items."
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Creating a Set with an Array Literal
//:
//: Use an array literal to initialize a set:
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres has been initialized with three initial items from an array literal
// << 🔵 Run Point
//:
//: -------------------
//:
//: The type for each element is inferred from an array literal:
let favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]
// a set of String values
// << 🔵 Run Point
//:
//: -------------------
//:
//: Specify the type when using an empty array literal:
let favoriteGenres3: Set<String> = []
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Accessing and Modifying a Set
//:
//: Use methods and properties to access and modify a set:
print("I have \(favoriteGenres.count) favorite music genres.")
// Prints "I have 3 favorite music genres."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use the Boolean `isEmpty` property to check if `count` is zero:
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// Prints "I have particular music preferences."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use `insert(_:)` to add a new element:
favoriteGenres.insert("Jazz")
// favoriteGenres now contains 4 items
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use `remove(_:)` to remove an element:
//:
//: returns the removed value, or `nil` if it doesn't exist.
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// Prints "Rock? I'm over it."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use `removeAll()` to remove all elements:
favoriteGenres.removeAll()
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use `contains(_:)` to check if a set contains an element:
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// Prints "It's too funky in here."
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Iterating Over a Set
//:
//: Use a `for-in` loop to iterate over all values:
for genre in favoriteGenres {
    print("\(genre)")
}
// Classical
// Jazz
// Hip hop
// << 🔵 Run Point
//:
//: -------------------
//:
//: For more about the `for-in` loop, see For-In Loops.
//:
//: -------------------
//:
//: Use the `sorted()` method to create an ordered array:
//:
//: ordered by the `<` operator.
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Performing Set Operations
//:
//: Performing fundamental operations is very efficient.
//:
//: -------------------
//:
//: ### Fundamental Set Operations
//:
//: ![Diagram](setVennDiagram_2x.png)
//:
//: -------------------
//:
//: Use `intersection(_:)` to find matching values in both sets:
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

let matchingElements = oddDigits.intersection(evenDigits)
// []
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use `symmetricDifference(_:)` to find values that don't exist in both sets:
let uniqueElements = oddDigits.symmetricDifference(singleDigitPrimeNumbers)
// [1, 2, 9]
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use `union(_:)` to combine all values in both sets:
let mergedSets = oddDigits.union(evenDigits)
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use `subtracting(_:)` to remove elements from another set:
let oddDigitsWithoutPrimeNumbers = oddDigits.subtracting(singleDigitPrimeNumbers)
// [1, 9]
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Set Membership and Equality
//:
//: ![Diagram](setEulerDiagram_2x.png)
//:
//: -------------------
//:
//: Use the “is equal” operator (`==`) to determine if two sets contain the same values:
let animals: Set = ["🐱", "🐶"]
let catsAndDogs: Set = ["🐱", "🐶"]
if animals == catsAndDogs {
    print("The animals are the same!")
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use `isSubset(of:)` to determine if all values are present in another set:
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

if houseAnimals.isSubset(of: farmAnimals) {
    print("House animals is a subset of farm animals")
}
// true
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use `isSuperset(of:)` to determine if the passed in set is a subset:
if farmAnimals.isSuperset(of: houseAnimals) {
   print("Farm animals is a superset of house animals")
}
// true
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use `isStrictSubset(of:)` or `isStrictSuperset(of:)` to determine if a set is a subset or superset, but not equal to the specified set:
// subset
if farmAnimals.isSubset(of: farmAnimals) {
    print("🐮 Farm animals is also subset of farm animals")
}
if !farmAnimals.isStrictSubset(of: farmAnimals) {
    print("🐮 Farm animals is not a strict subset of farm animals")
}

// superset
if farmAnimals.isSuperset(of: farmAnimals) {
   print("🐔 Farm animals is a superset of farm animals")
}
if !farmAnimals.isStrictSuperset(of: farmAnimals) {
   print("🐔 Farm animals is not a strict superset of farm animals")
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use `isDisjoint(with:)` to determine if two sets have no matching values:
if farmAnimals.isDisjoint(with: cityAnimals) {
   print("🐑 Farm animals are different than city animals")
}
// true
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Dictionaries
//:
//: A dictionary stores values identified by a key with no defined ordering.
//:
//: Each `Key` must conform to the `Hashable` protocol.
//:
//: -------------------
//:
//: ### Dictionary Type Shorthand Syntax
//:
//: Use longhand form and shorthand form to declare a dictionary:
let longhandFormDictionary: Dictionary<String, Int> = Dictionary<String, Int>()
let shorthandFormDictionary: [String: Int] = [String: Int]() // preferred
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Creating an Empty Dictionary
//:
//: Use initializer syntax to declare an empty dictionary:
var namesOfIntegers = [Int: String]()
// namesOfIntegers is an empty [Int: String] dictionary
// << 🔵 Run Point
//:
//: -------------------
//:
//: If the context already provides type information, you can create an empty dictionary with an empty dictionary literal:
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:] // empty dictionary literal
// namesOfIntegers is once again an empty dictionary
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Creating a Dictionary with a Dictionary Literal
//:
//: Use a dictionary literal to initialize a dictionary:
/*
 format of a dictionary litertal
 [key1: value1, key2: value2, key3: value3]
*/
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use the dictionary literal to infer to type annotation:
let moreAirports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Accessing and Modifying a Dictionary
//:
//: You access and modify a dictionary through its methods and properties, or by using subscript syntax.
//:
//: -------------------
//:
//: Use the `count` property to find out the number of elements:
print("The airports dictionary contains \(airports.count) items.")
// Prints "The airports dictionary contains 2 items."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use the Boolean `isEmpty` property to check if `count` is zero:
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary isn't empty.")
}
// Prints "The airports dictionary isn't empty."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use subscript syntax to add a new item to a dictionary:
airports["LHR"] = "London"
// the airports dictionary now contains 3 items
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use subscript syntax to change an existing value:
airports["LHR"] = "London Heathrow"
// the value for "LHR" has been changed to "London Heathrow"
// << 🔵 Run Point
//:
//: -------------------
//:
//: An alternative to using subscript is to use `updateValue(_:forKey:)`:
//:
//: The `updateValue(_:forKey:)` method returns the previous value as an optional.
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// Prints "The old value for DUB was Dublin."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use subscript syntax to retrieve a value:
//:
//: The subscript returns an optional.
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}
// Prints "The name of the airport is Dublin Airport."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use subscript syntax to remove a key-value pair by assigning `nil`:
airports["APL"] = "Apple International"
// "Apple International" isn't the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary
// << 🔵 Run Point
//:
//: -------------------
//:
//: Alternatively, use `removeValue(forKey:)` to remove a key-value pair:
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}
// Prints "The removed airport's name is Dublin Airport."
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Iterating Over a Dictionary
//:
//: Use a `for-in` loop to to iterate over the key-value pairs:
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// LHR: London Heathrow
// YYZ: Toronto Pearson
// << 🔵 Run Point
//:
//: -------------------
//:
//: For more about the for-in loop, see For-In Loops.
//:
//: -------------------
//:
//: Use the `keys` and `values` properties to retrieve an iterable collection:
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Toronto Pearson
// << 🔵 Run Point
//:
//: -------------------
//:
//: you can use the `keys` or `values` property to instantiate an array:
let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]

let airportNames = [String](airports.values)
// airportNames is ["London Heathrow", "Toronto Pearson"]
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use the `sorted()` method to create an ordered array from its `keys` or `values` property:
//:
//: ordered by the `<` operator.
for airportCode in airports.keys.sorted() {
    print("\(airportCode)")
}
// << 🔵 Run Point
//:
//: -------------------
//: ## Original Source Documentation
//: To view the original page [click here - Collection Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes)
//:
//: -------------------
//:
//: [Previous Page](@previous) | [Next Page](@next)
//:
//: -------------------
//:
//: ## ![SwiftSimplified.com](swift-simplified-logo.png)
//: [Website](https://www.swiftsimplified.com) | [The Swift Handbook](https://www.swiftsimplified.com/the-swift-handbook) | [The Swift Language Guide](https://www.swiftsimplified.com/the-swift-language-guide)
//:
//: 🛠 *..let's live a better life, by learning Swift*
//:
//: -------------------
//:
//: ### 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
//: Welcome to our community of [SwiftSimplified.com](https://www.swiftsimplified.com) students!

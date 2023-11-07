//: ## ![SwiftSimplified.com](swift-simplified-logo.png)
//:
//: ![Swift Simplified .com](ss-in-content-logo.png) [Swift Simplified .com](https://www.swiftsimplified.com)
//:
//: [Swift.org](https://www.swift.org) | [SwiftSimplified.com](https://www.swiftsimplified.com) | [Online Swift Course](https://www.swiftsimplified.com/the-swift-handbook) | [Swift Language Guide](https://www.swiftsimplified.com/the-swift-language-guide)
//:
//: -------------------
//: ## The  Swift Cheat Sheet ⚡️
//: This is the [official Apple Swift Language Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics) converted into Xcode playground pages.
//:
//: The text has been condensed to focus on code examples.
//:
//: v1 | Swift v5.7+ | Xcode 14+ | [The Original Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)
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
//: Use `var` to use a mutable collection:
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
let longHand: Array<Int> = Array<Int>()
let shortHand = [Int]()
let shortHand2 = [0,1,2,3,4] // preferred
//:
//: -------------------
//:
//: ### Creating an Empty Array
//:
//: Use `[]` to create an empty array:
var someInts: [Int] = []
someInts.append(3)
// someInts now contains 1 value of type Int
someInts = []
print("someInts is of type [Int] with \(someInts.count) items.")
// Prints "someInts is of type [Int] with 0 items."
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
//: A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items isn’t important, or when you need to ensure that an item only appears once.
//:
//: * callout(Note):
//:     → Swift’s Set type is bridged to Foundation’s `NSSet` class.
//:
//:     For more information about using `Set` with Foundation and Cocoa, see Bridging Between Set and NSSet.
//:
//: -------------------
//:
//: ### Hash Values for Set Types
//:
//: A type must be hashable in order to be stored in a set—that is, the type must provide a way to compute a hash value for itself. A hash value is an `Int` value that’s the same for all objects that compare equally, such that `if a == b`, the hash value of `a` is equal to the hash value of `b`.
//:
//: All of Swift’s basic types (such as `String`, `Int`, `Double`, and `Bool`) are hashable by default, and can be used as set value types or dictionary key types. Enumeration case values without associated values (as described in Enumerations) are also hashable by default.
//:
//: * callout(Note):
//:     → You can use your own custom types as set value types or dictionary key types by making them conform to the Hashable protocol from the Swift standard library. For information about implementing the required `hash(into:)` method, see Hashable. For information about conforming to protocols, see Protocols.
//:
//: -------------------
//:
//: ### Set Type Syntax
//:
//: The type of a Swift set is written as `Set<Element>`, where `Element` is the type that the set is allowed to store. Unlike arrays, sets don’t have an equivalent shorthand form.
//:
//: -------------------
//:
//: ### Creating and Initializing an Empty Set
//:
//: You can create an empty set of a certain type using initializer syntax:
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// Prints "letters is of type Set<Character> with 0 items."
// << 🔵 Run Point
//:
//: -------------------
//:
//: * callout(Note):
//:     → The type of the letters variable is inferred to be `Set<Character>`, from the type of the initializer.
//:
//: Alternatively, if the context already provides type information, such as a function argument or an already typed variable or constant, you can create an empty set with an empty array literal:
letters.insert("a")
// letters now contains 1 value of type Character
letters = []
// letters is now an empty set, but is still of type Set<Character>
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Creating a Set with an Array Literal
//:
//: You can also initialize a set with an array literal, as a shorthand way to write one or more values as a set collection.
//:
//: The example below creates a set called `favoriteGenres` to store `String` values:
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres has been initialized with three initial items
// << 🔵 Run Point
//:
//: -------------------
//:
//: The `favoriteGenres` variable is declared as “a set of `String` values”, written as `Set<String>`. Because this particular set has specified a value type of `String`, it’s only allowed to store `String` values. Here, the `favoriteGenres` set is initialized with three `String` values (`"Rock"`, `"Classical"`, and `"Hip hop"`), written within an array literal.
//:
//: * callout(Note):
//:     → The `favoriteGenres` set is declared as a variable (with the `var` introducer) and not a constant (with the `let` introducer) because items are added and removed in the examples below.
//:
//: A set type can’t be inferred from an array literal alone, so the type `Set` must be explicitly declared. However, because of Swift’s type inference, you don’t have to write the type of the set’s elements if you’re initializing it with an array literal that contains values of just one type. The initialization of `favoriteGenres` could have been written in a shorter form instead:
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]
// << 🔵 Run Point
//:
//: -------------------
//:
//: Because all values in the array literal are of the same type, Swift can infer that `Set<String>` is the correct type to use for the `favoriteGenres` variable.
//:
//: -------------------
//:
//: ### Accessing and Modifying a Set
//:
//: You access and modify a set through its methods and properties.
//:
//: To find out the number of items in a set, check its read-only `count` property:
print("I have \(favoriteGenres.count) favorite music genres.")
// Prints "I have 3 favorite music genres."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use the Boolean `isEmpty` property as a shortcut for checking whether the `count` property is equal to `0`:
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
//: You can add a new item into a set by calling the set’s `insert(_:)` method:
favoriteGenres.insert("Jazz")
// favoriteGenres now contains 4 items
// << 🔵 Run Point
//:
//: -------------------
//:
//: You can remove an item from a set by calling the set’s `remove(_:)` method, which removes the item if it’s a member of the set, and returns the removed value, or returns `nil` if the set didn’t contain it. Alternatively, all items in a set can be removed with its `removeAll()` method.
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
//: To check whether a set contains a particular item, use the `contains(_:)` method.
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
//: You can iterate over the values in a set with a `for-in` loop.
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
//: Swift’s Set type doesn’t have a defined ordering. To iterate over the values of a set in a specific order, use the `sorted()` method, which returns the set’s elements as an array sorted using the `<` operator.
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
//: You can efficiently perform fundamental set operations, such as combining two sets together, determining which values two sets have in common, or determining whether two sets contain all, some, or none of the same values.
//:
//: -------------------
//:
//: ### Fundamental Set Operations
//:
//: The illustration below depicts two sets—`a` and `b`—with the results of various set operations represented by the shaded regions.
//:
//: ![Diagram](setVennDiagram_2x.png)
//: * Use the `intersection(_:)` method to create a new set with only the values common to both sets.
//:
//: * Use the `symmetricDifference(_:)` method to create a new set with values in either set, but not both.
//:
//: * Use the `union(_:)` method to create a new set with all of the values in both sets.
//:
//: * Use the `subtracting(_:)` method to create a new set with values not in the specified set.
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Set Membership and Equality
//:
//: The illustration below depicts three sets—`a`, `b` and `c`—with overlapping regions representing elements shared among sets. Set `a` is a superset of set `b`, because a contains all elements in `b`. Conversely, set `b` is a subset of set `a`, because all elements in `b` are also contained by `a`. Set `b` and set `c` are disjoint with one another, because they share no elements in common.
//:
//: ![Diagram](setEulerDiagram_2x.png)
//: * Use the “is equal” operator (`==`) to determine whether two sets contain all of the same values.
//:
//: * Use the `isSubset(of:)` method to determine whether all of the values of a set are contained in the specified set.
//:
//: * Use the `isSuperset(of:)` method to determine whether a set contains all of the values in a specified set.
//:
//: * Use the `isStrictSubset(of:)` or `isStrictSuperset(of:)` methods to determine whether a set is a subset or superset, but not equal to, a specified set.
//:
//: * Use the `isDisjoint(with:)` method to determine whether two sets have no values in common.
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Dictionaries
//:
//: A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary. Unlike items in an array, items in a dictionary don’t have a specified order. You use a dictionary when you need to look up values based on their identifier, in much the same way that a real-world dictionary is used to look up the definition for a particular word.
//:
//: * callout(Note):
//:     → Swift’s `Dictionary` type is bridged to Foundation’s `NSDictionary` class.
//:
//:     For more information about using `Dictionary` with Foundation and Cocoa, see Bridging Between Dictionary and NSDictionary.
//:
//: -------------------
//:
//: ### Dictionary Type Shorthand Syntax
//:
//: The type of a Swift dictionary is written in full as `Dictionary<Key, Value>`, where `Key` is the type of value that can be used as a dictionary key, and `Value` is the type of value that the dictionary stores for those keys.
//:
//: * callout(Note):
//:     → A dictionary `Key` type must conform to the `Hashable` protocol, like a set’s value type.
//:
//: You can also write the type of a dictionary in shorthand form as `[Key: Value]`. Although the two forms are functionally identical, the shorthand form is preferred and is used throughout this guide when referring to the type of a dictionary.
//:
//: -------------------
//:
//: ### Creating an Empty Dictionary
//:
//: As with arrays, you can create an empty `Dictionary` of a certain type by using initializer syntax:
var namesOfIntegers: [Int: String] = [:]
// namesOfIntegers is an empty [Int: String] dictionary
// << 🔵 Run Point
//:
//: -------------------
//:
//: This example creates an empty dictionary of type `[Int: String]` to store human-readable names of integer values. Its keys are of type `Int`, and its values are of type `String`.
//:
//: If the context already provides type information, you can create an empty dictionary with an empty dictionary literal, which is written as `[:]` (a colon inside a pair of square brackets):

namesOfIntegers[16] = "sixteen"
// namesOfIntegers now contains 1 key-value pair
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Creating a Dictionary with a Dictionary Literal
//:
//: You can also initialize a dictionary with a dictionary literal, which has a similar syntax to the array literal seen earlier. A dictionary literal is a shorthand way to write one or more key-value pairs as a `Dictionary` collection.
//:
//: A key-value pair is a combination of a key and a value. In a dictionary literal, the key and value in each key-value pair are separated by a colon. The key-value pairs are written as a list, separated by commas, surrounded by a pair of square brackets:
//:
/*
[key1: value1, key2: value2, key3: value3]
*/
//: The example below creates a dictionary to store the names of international airports. In this dictionary, the keys are three-letter International Air Transport Association codes, and the values are airport names:
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// << 🔵 Run Point
//:
//: -------------------
//:
//: The airports dictionary is declared as having a type of `[String: String]`, which means “a `Dictionary` whose keys are of type `String`, and whose values are also of type `String`”.
//:
//: * callout(Note):
//:     → The airports dictionary is declared as a variable (with the `var` introducer), and not a constant (with the `let` introducer), because more airports are added to the dictionary in the examples below.
//:
//: The airports dictionary is initialized with a dictionary literal containing two key-value pairs. The first pair has a key of `"YYZ"` and a value of `"Toronto Pearson"`. The second pair has a key of `"DUB"` and a value of `"Dublin"`.
//:
//: This dictionary literal contains two `String: String` pairs. This key-value type matches the type of the airports variable declaration (a dictionary with only `String` keys, and only `String` values), and so the assignment of the dictionary literal is permitted as a way to initialize the airports dictionary with two initial items.
//:
//: As with arrays, you don’t have to write the type of the dictionary if you’re initializing it with a dictionary literal whose keys and values have consistent types. The initialization of airports could have been written in a shorter form instead:
airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// << 🔵 Run Point
//:
//: -------------------
//:
//: Because all keys in the literal are of the same type as each other, and likewise all values are of the same type as each other, Swift can infer that `[String: String]` is the correct type to use for the airports dictionary.
//:
//: -------------------
//:
//: ### Accessing and Modifying a Dictionary
//:
//: You access and modify a dictionary through its methods and properties, or by using subscript syntax.
//:
//: As with an array, you find out the number of items in a `Dictionary` by checking its read-only `count` property:
print("The airports dictionary contains \(airports.count) items.")
// Prints "The airports dictionary contains 2 items."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use the Boolean `isEmpty` property as a shortcut for checking whether the `count` property is equal to `0`:
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
//: You can add a new item to a dictionary with subscript syntax. Use a new key of the appropriate type as the subscript index, and assign a new value of the appropriate type:
airports["LHR"] = "London"
// the airports dictionary now contains 3 items
// << 🔵 Run Point
//:
//: -------------------
//:
//: You can also use subscript syntax to change the value associated with a particular key:

airports["LHR"] = "London Heathrow"
// the value for "LHR" has been changed to "London Heathrow"
// << 🔵 Run Point
//:
//: -------------------
//:
//: As an alternative to subscripting, use a dictionary’s `updateValue(_:forKey:)` method to set or update the value for a particular key. Like the subscript examples above, the `updateValue(_:forKey:)` method sets a value for a key if none exists, or updates the value if that key already exists. Unlike a subscript, however, the `updateValue(_:forKey:)` method returns the old value after performing an update. This enables you to check whether or not an update took place.
//:
//: The `updateValue(_:forKey:)` method returns an optional value of the dictionary’s value type. For a dictionary that stores `String` values, for example, the method returns a value of type `String?`, or “optional `String`”. This optional value contains the old value for that key if one existed before the update, or nil if no value existed:

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// Prints "The old value for DUB was Dublin."
// << 🔵 Run Point
//:
//: -------------------
//:
//: You can also use subscript syntax to retrieve a value from the dictionary for a particular key. Because it’s possible to request a key for which no value exists, a dictionary’s subscript returns an optional value of the dictionary’s value type. If the dictionary contains a value for the requested key, the subscript returns an optional value containing the existing value for that key. Otherwise, the subscript returns nil:
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
//: You can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of `nil` for that key:

airports["APL"] = "Apple International"
// "Apple International" isn't the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary
// << 🔵 Run Point
//:
//: -------------------
//:
//: Alternatively, remove a key-value pair from a dictionary with the `removeValue(forKey:)` method. This method removes the key-value pair if it exists and returns the removed value, or returns `nil` if no value existed:

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
//: You can iterate over the key-value pairs in a dictionary with a `for-in` loop. Each item in the dictionary is returned as a `(key, value)` tuple, and you can decompose the tuple’s members into temporary constants or variables as part of the iteration:
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
//: You can also retrieve an iterable collection of a dictionary’s keys or values by accessing its `keys` and `values` properties:
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
//: If you need to use a dictionary’s keys or values with an API that takes an `Array` instance, initialize a new array with the `keys` or `values` property:

let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]

let airportNames = [String](airports.values)
// airportNames is ["London Heathrow", "Toronto Pearson"]
// << 🔵 Run Point
//:
//: -------------------
//:
//: Swift’s `Dictionary` type doesn’t have a defined ordering. To iterate over the keys or values of a dictionary in a specific order, use the `sorted()` method on its `keys` or `values` property.
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

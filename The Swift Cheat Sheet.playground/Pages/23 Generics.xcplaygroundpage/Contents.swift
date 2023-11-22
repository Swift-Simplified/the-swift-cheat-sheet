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
//: v1 | Swift v5.7+ | Xcode 14+ | [The Original Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)
//:
//: -------------------
//:
//: ## Topic 23: Generics
//:
//:
//: Generics are one of the most powerful features of Swift.
//:
//: Much of the Swift standard library is built with generic code.
//:
//: Generic code enables you to write code that avoids duplication.
//:
//: -------------------
//:
//: ## The Problem That Generics Solve
//:
//: Here’s a standard, nongeneric function called swapTwoInts(_:_:), which swaps two Int values:
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"
// << 🔵 Run Point
//:
//: -------------------
//:
//: If you want to swap two String values, or two Double values, you have to write more functions:
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: You may notice that the bodies of the swapTwoInts(_:_:), swapTwoStrings(_:_:), and swapTwoDoubles(_:_:) functions are identical.
//:
//: The only difference is the type of the values that they accept (Int, String, and Double).
//:
//: -------------------
//:
//: ## Generic Functions
//:
//: Generic functions can work with any type:
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Here’s how the generic example compares to the non-generic example:
/*
 func swapTwoInts(_ a: inout Int, _ b: inout Int) {
 func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
 */
// << 🔵 Run Point
//:
//: -------------------
//:
//: The generic version of the function uses a placeholder type name (called T) instead of an actual type name (such as Int, String, or Double).
//:
//: The placeholder type name doesn’t say anything about what T must be, but it does say that both a and b must be of the same type T.
//:
//: -------------------
//:
//: The swapTwoValues(_:_:) function can now be called with any type:
//:
//: In the two examples below, T is inferred to be Int and String respectively:
someInt = 3
anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
// someString is now "world", and anotherString is now "hello"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Type Parameters
//:
//: Type parameters specify and name a placeholder type, and are written immediately after the function’s name, between a pair of matching angle brackets (such as <T>).
//:
//: You can provide more than one type parameter by writing multiple type parameter names within the angle brackets, separated by commas.
//:
//: -------------------
//:
//: ## Naming Type Parameters
//:
//: In most cases, type parameters have descriptive names, such as Key and Value in Dictionary<Key, Value> and Element in Array<Element>.
//:
//: When there isn’t a meaningful relationship between types, it’s traditional to name them T, U, and V.
//:
//: -------------------
//:
//: ## Generic Types
//:
//: In addition to generic functions, Swift enables you to define your own generic types.
//:
//: Below is a `struct` without using generic code:
struct IntStack {
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Here’s a generic version of the same code:
struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
// the stack now contains 4 strings
// << 🔵 Run Point
//:
//: -------------------
//:
//: Push four values on to the stack:
//:
//: ![Diagram](stackPushedFourStrings_2x.png)
//:
//: Popping a value from the stack removes and returns the top value, "cuatro":
let fromTheTop = stackOfStrings.pop()
// fromTheTop is equal to "cuatro", and the stack now contains 3 strings
// << 🔵 Run Point
//:
//: -------------------
//:
//: After popping its top value:
//:
//: ![Diagram](stackPoppedOneString_2x.png)
//:
//: -------------------
//:
//: ## Extending a Generic Type
//:
//: When you extend a generic type, you don’t provide a type parameter.
//:
//: Instead, the type parameter is available within the body of the extension:
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The topItem computed property can be used with any Stack instance to access and query its top item:
if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}
// Prints "The top item on the stack is tres."
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Type Constraints
//:
//: It’s useful to enforce certain type constraints on the types that can be used with generic functions and generic types.
//:
//: -------------------
//:
//: ### Type Constraint Syntax
//:
//: Place a single class or protocol constraint after a type parameter’s name, separated by a colon:
class SomeClass {}
protocol SomeProtocol {}
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Type Constraints in Action
//:
//: Here’s a nongeneric function called findIndex(ofString:in:):
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The findIndex(ofString:in:) function can be used to find a string value in an array of strings:
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}
// Prints "The index of llama is 2"
// << 🔵 Run Point
//:
//: -------------------
//:
//: You can write the same functionality as a generic function by replacing any mention of strings with values of some type T instead:
//:
//: This function doesn’t compile, for reasons explained after the example.
// ⛔️ Compilation error: uncomment to view
//func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}
// << 🔵 Run Point
//:
//: -------------------
//:
//: This function doesn’t compile.
//:
//: The problem lies with the equality check, “if value == valueToFind”.
//:
//: Not every type in Swift can be compared with the equal to operator (==).
//:
//: Any type that’s Equatable can be used safely with the findIndex(of:in:) function, because it’s guaranteed to support the equal to operator:
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The single type parameter for findIndex(of:in:) is written as T: Equatable, which means “any type T that conforms to the Equatable protocol.”
//:
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
// doubleIndex is an optional Int with no value, because 9.3 isn't in the array
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// stringIndex is an optional Int containing a value of 2
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Associated Types
//:
//: An associated type gives a placeholder name to a type that’s used as part of a protocol.
//:
//: -------------------
//:
//: ### Associated Types in Action
//:
//: Here’s an example of a protocol called Container, which declares an associated type called Item:
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Here’s a version of the nongeneric IntStack type from Generic Types above, adapted to conform to the Container protocol:
struct IntStack2: Container {
    // original IntStack implementation
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The IntStack type implements all three of the Container protocol’s requirements, and in each case wraps part of the IntStack type’s existing functionality to satisfy these requirements.
//:
//: Moreover, IntStack specifies that for this implementation of Container, the appropriate Item to use is a type of Int. The definition of typealias Item = Int turns the abstract type of Item into a concrete type of Int for this implementation of the Container protocol.
//:
//: Thanks to Swift’s type inference, you don’t actually need to declare a concrete Item of Int as part of the definition of IntStack. Because IntStack conforms to all of the requirements of the Container protocol, Swift can infer the appropriate Item to use, simply by looking at the type of the append(_:) method’s item parameter and the return type of the subscript. Indeed, if you delete the typealias Item = Int line from the code above, everything still works, because it’s clear what type should be used for Item.
//:
//: You can also make the generic Stack type conform to the Container protocol:
struct Stack2<Element>: Container {
    // original Stack<Element> implementation
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Element
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: This time, the type parameter Element is used as the type of the append(_:) method’s item parameter and the return type of the subscript. Swift can therefore infer that Element is the appropriate type to use as the Item for this particular container.
//:
//: -------------------
//:
//: ### Extending an Existing Type to Specify an Associated Type
//:
//: You can extend an existing type to add conformance to a protocol, as described in Adding Protocol Conformance with an Extension. This includes a protocol with an associated type.
//:
//: Swift’s Array type already provides an append(_:) method, a count property, and a subscript with an Int index to retrieve its elements. These three capabilities match the requirements of the Container protocol. This means that you can extend Array to conform to the Container protocol simply by declaring that Array adopts the protocol. You do this with an empty extension, as described in Declaring Protocol Adoption with an Extension:
extension Array: Container {}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Array’s existing append(_:) method and subscript enable Swift to infer the appropriate type to use for Item, just as for the generic Stack type above. After defining this extension, you can use any Array as a Container.
//:
//: -------------------
//:
//: ### Adding Constraints to an Associated Type
//:
//: You can add type constraints to an associated type in a protocol to require that conforming types satisfy those constraints. For example, the following code defines a version of Container that requires the items in the container to be equatable.
protocol Container2 {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: To conform to this version of Container, the container’s Item type has to conform to the Equatable protocol.
//:
//: -------------------
//:
//: ### Using a Protocol in Its Associated Type’s Constraints
//:
//: A protocol can appear as part of its own requirements. For example, here’s a protocol that refines the Container protocol, adding the requirement of a suffix(_:) method. The suffix(_:) method returns a given number of elements from the end of the container, storing them in an instance of the Suffix type.
protocol SuffixableContainer: Container2 {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: In this protocol, Suffix is an associated type, like the Item type in the Container example above. Suffix has two constraints: It must conform to the SuffixableContainer protocol (the protocol currently being defined), and its Item type must be the same as the container’s Item type. The constraint on Item is a generic where clause, which is discussed in Associated Types with a Generic Where Clause below.
//:
//: Here’s an extension of the Stack type from Generic Types above that adds conformance to the SuffixableContainer protocol:
struct Stack3<Element: Equatable>: Container2 {
    
    // original Stack<Element> implementation
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Element
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

extension Stack3: SuffixableContainer {
    
    func suffix(_ size: Int) -> Stack3 {
        var result = Stack3()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack3.
}
var stackOfInts = Stack3<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)
// suffix contains 20 and 30
// << 🔵 Run Point
//:
//: -------------------
//:
//: In the example above, the Suffix associated type for Stack is also Stack, so the suffix operation on Stack returns another Stack. Alternatively, a type that conforms to SuffixableContainer can have a Suffix type that’s different from itself—meaning the suffix operation can return a different type. For example, here’s an extension to the nongeneric IntStack type that adds SuffixableContainer conformance, using Stack<Int> as its suffix type instead of IntStack:
extension IntStack2: SuffixableContainer {
    func suffix(_ size: Int) -> Stack3<Int> {
        var result = Stack3<Int>()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack<Int>.
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Generic Where Clauses
//:
//: Type constraints, as described in Type Constraints, enable you to define requirements on the type parameters associated with a generic function, subscript, or type.
//:
//: It can also be useful to define requirements for associated types. You do this by defining a generic where clause. A generic where clause enables you to require that an associated type must conform to a certain protocol, or that certain type parameters and associated types must be the same. A generic where clause starts with the where keyword, followed by constraints for associated types or equality relationships between types and associated types. You write a generic where clause right before the opening curly brace of a type or function’s body.
//:
//: The example below defines a generic function called allItemsMatch, which checks to see if two Container instances contain the same items in the same order. The function returns a Boolean value of true if all items match and a value of false if they don’t.
//:
//: The two containers to be checked don’t have to be the same type of container (although they can be), but they do have to hold the same type of items. This requirement is expressed through a combination of type constraints and a generic where clause:
func allItemsMatch<C1: Container2, C2: Container2>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {

        // Check that both containers contain the same number of items.
        if someContainer.count != anotherContainer.count {
            return false
        }

        // Check each pair of items to see if they're equivalent.
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }

        // All items match, so return true.
        return true
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: This function takes two arguments called someContainer and anotherContainer. The someContainer argument is of type C1, and the anotherContainer argument is of type C2. Both C1 and C2 are type parameters for two container types to be determined when the function is called.
//:
//: The following requirements are placed on the function’s two type parameters:
//:
//: * C1 must conform to the Container protocol (written as C1: Container).
//:
//: * C2 must also conform to the Container protocol (written as C2: Container).
//:
//: * The Item for C1 must be the same as the Item for C2 (written as C1.Item == C2.Item).
//:
//: * The Item for C1 must conform to the Equatable protocol (written as C1.Item: Equatable).
//:
//: The first and second requirements are defined in the function’s type parameter list, and the third and fourth requirements are defined in the function’s generic where clause.
//:
//: These requirements mean:
//:
//: * someContainer is a container of type C1.
//:
//: * anotherContainer is a container of type C2.
//:
//: * someContainer and anotherContainer contain the same type of items.
//:
//: * The items in someContainer can be checked with the not equal operator (!=) to see if they’re different from each other.
//:
//: The third and fourth requirements combine to mean that the items in anotherContainer can also be checked with the != operator, because they’re exactly the same type as the items in someContainer.
//:
//: These requirements enable the allItemsMatch(_:_:) function to compare the two containers, even if they’re of a different container type.
//:
//: The allItemsMatch(_:_:) function starts by checking that both containers contain the same number of items. If they contain a different number of items, there’s no way that they can match, and the function returns false.
//:
//: After making this check, the function iterates over all of the items in someContainer with a for-in loop and the half-open range operator (..<). For each item, the function checks whether the item from someContainer isn’t equal to the corresponding item in anotherContainer. If the two items aren’t equal, then the two containers don’t match, and the function returns false.
//:
//: If the loop finishes without finding a mismatch, the two containers match, and the function returns true.
//:
//: Here’s how the allItemsMatch(_:_:) function looks in action:
var stackOfStrings2 = Stack3<String>()
stackOfStrings2.push("uno")
stackOfStrings2.push("dos")
stackOfStrings2.push("tres")

extension Array: Container2 where Element: Equatable {}
var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings2, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}
// Prints "All items match."
// << 🔵 Run Point
//:
//: -------------------
//:
//: The example above creates a Stack instance to store String values, and pushes three strings onto the stack. The example also creates an Array instance initialized with an array literal containing the same three strings as the stack. Even though the stack and the array are of a different type, they both conform to the Container protocol, and both contain the same type of values. You can therefore call the allItemsMatch(_:_:) function with these two containers as its arguments. In the example above, the allItemsMatch(_:_:) function correctly reports that all of the items in the two containers match.
//:
//: -------------------
//:
//: ## Extensions with a Generic Where Clause
//:
//: You can also use a generic where clause as part of an extension. The example below extends the generic Stack structure from the previous examples to add an isTop(_:) method.
extension Stack3 where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: This new isTop(_:) method first checks that the stack isn’t empty, and then compares the given item against the stack’s topmost item. If you tried to do this without a generic where clause, you would have a problem: The implementation of isTop(_:) uses the == operator, but the definition of Stack doesn’t require its items to be equatable, so using the == operator results in a compile-time error. Using a generic where clause lets you add a new requirement to the extension, so that the extension adds the isTop(_:) method only when the items in the stack are equatable.
//:
//: Here’s how the isTop(_:) method looks in action:
if stackOfStrings2.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}
// Prints "Top element is tres."
// << 🔵 Run Point
//:
//: -------------------
//:
//: If you try to call the isTop(_:) method on a stack whose elements aren’t equatable, you’ll get a compile-time error.
struct NotEquatable { }
var notEquatableStack = Stack2<NotEquatable>()
let notEquatableValue = NotEquatable()
notEquatableStack.push(notEquatableValue)
// ⛔️ Compilation error: uncomment to view
//notEquatableStack.isTop(notEquatableValue)  // Error
// << 🔵 Run Point
//:
//: -------------------
//:
//: You can use a generic where clause with extensions to a protocol. The example below extends the Container protocol from the previous examples to add a startsWith(_:) method.
extension Container2 where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The startsWith(_:) method first makes sure that the container has at least one item, and then it checks whether the first item in the container matches the given item. This new startsWith(_:) method can be used with any type that conforms to the Container protocol, including the stacks and arrays used above, as long as the container’s items are equatable.
if [9, 9, 9].startsWith(42) {
    print("Starts with 42.")
} else {
    print("Starts with something else.")
}
// Prints "Starts with something else."
// << 🔵 Run Point
//:
//: -------------------
//:
//: The generic where clause in the example above requires Item to conform to a protocol, but you can also write a generic where clauses that require Item to be a specific type. For example:
extension Container2 where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
print([1260.0, 1200.0, 98.6, 37.0].average())
// Prints "648.9"
// << 🔵 Run Point
//:
//: -------------------
//:
//: This example adds an average() method to containers whose Item type is Double. It iterates over the items in the container to add them up, and divides by the container’s count to compute the average. It explicitly converts the count from Int to Double to be able to do floating-point division.
//:
//: You can include multiple requirements in a generic where clause that’s part of an extension, just like you can for a generic where clause that you write elsewhere. Separate each requirement in the list with a comma.
//:
//: -------------------
//:
//: ## Contextual Where Clauses
//:
//: You can write a generic where clause as part of a declaration that doesn’t have its own generic type constraints, when you’re already working in the context of generic types. For example, you can write a generic where clause on a subscript of a generic type or on a method in an extension to a generic type. The Container structure is generic, and the where clauses in the example below specify what type constraints have to be satisfied to make these new methods available on a container.
extension Container2 {
    func average() -> Double where Item == Int {
        var sum = 0.0
        for index in 0..<count {
            sum += Double(self[index])
        }
        return sum / Double(count)
    }
    func endsWith(_ item: Item) -> Bool where Item: Equatable {
        return count >= 1 && self[count-1] == item
    }
}
let numbers = [1260, 1200, 98, 37]
print(numbers.average())
// Prints "648.75"
print(numbers.endsWith(37))
// Prints "true"
// << 🔵 Run Point
//:
//: -------------------
//:
//: This example adds an average() method to Container when the items are integers, and it adds an endsWith(_:) method when the items are equatable. Both functions include a generic where clause that adds type constraints to the generic Item type parameter from the original declaration of Container.
//:
//: If you want to write this code without using contextual where clauses, you write two extensions, one for each generic where clause. The example above and the example below have the same behavior.
extension Container2 where Item == Int {
    func average2() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += Double(self[index])
        }
        return sum / Double(count)
    }
}
extension Container2 where Item: Equatable {
    func endsWith2(_ item: Item) -> Bool {
        return count >= 1 && self[count-1] == item
    }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: In the version of this example that uses contextual where clauses, the implementation of average() and endsWith(_:) are both in the same extension because each method’s generic where clause states the requirements that need to be satisfied to make that method available. Moving those requirements to the extensions’ generic where clauses makes the methods available in the same situations, but requires one extension per requirement.
//:
//: -------------------
//:
//: ## Associated Types with a Generic Where Clause
//:
//: You can include a generic where clause on an associated type. For example, suppose you want to make a version of Container that includes an iterator, like what the Sequence protocol uses in the standard library. Here’s how you write that:
protocol Container3 {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }

    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The generic where clause on Iterator requires that the iterator must traverse over elements of the same item type as the container’s items, regardless of the iterator’s type. The makeIterator() function provides access to a container’s iterator.
//:
//: For a protocol that inherits from another protocol, you add a constraint to an inherited associated type by including the generic where clause in the protocol declaration. For example, the following code declares a ComparableContainer protocol that requires Item to conform to Comparable:
protocol ComparableContainer: Container3 where Item: Comparable { }
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Generic Subscripts
//:
//: Subscripts can be generic, and they can include generic where clauses. You write the placeholder type name inside angle brackets after subscript, and you write a generic where clause right before the opening curly brace of the subscript’s body. For example:
extension Container3 {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
            var result: [Item] = []
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: This extension to the Container protocol adds a subscript that takes a sequence of indices and returns an array containing the items at each given index. This generic subscript is constrained as follows:
//:
//: * The generic parameter Indices in angle brackets has to be a type that conforms to the Sequence protocol from the standard library.
//:
//: * The subscript takes a single parameter, indices, which is an instance of that Indices type.
//:
//: * The generic where clause requires that the iterator for the sequence must traverse over elements of type Int. This ensures that the indices in the sequence are the same type as the indices used for a container.
//:
//: Taken together, these constraints mean that the value passed for the indices parameter is a sequence of integers.
//:
//: -------------------
//: ## Original Source Documentation
//: To view the original page [click here - Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics)
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

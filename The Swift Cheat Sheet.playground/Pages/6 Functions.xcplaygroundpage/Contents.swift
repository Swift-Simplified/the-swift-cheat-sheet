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
//: ## Topic 6: Functions
//:
//:
//: Functions are self-contained chunks of code that perform a specific task.
//:
//: -------------------
//:
//: ## Defining and Calling Functions
//:
//: Every function has a function name.
//:
//: They can accept input and may also provide output:
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
// Prints "Hello, Anna!"
print(greet(person: "Brian"))
// Prints "Hello, Brian!"
// << 🔵 Run Point
//:
//: -------------------
//:
//: The `print(_:separator:terminator:)` function doesn’t have a label for its first argument and all other arguments have default values.
print("Hello")
// Prints "Hello"
print("Hello", terminator: "<text-terminated>") // terminator has a default value of ""
// Prints Hello<text-terminated>
// << 🔵 Run Point
//:
//: -------------------
//:
//: You can call the greet(person:) function multiple times with different input values.
print(greet(person: "Jack"))
print(greet(person: "Mary"))
print(greet(person: "Julian"))
print(greet(person: "Joeseph"))
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Function Parameters and Return Values
//:
//: Function parameters and return values are extremely flexible in Swift.
//:
//: -------------------
//:
//: ### Functions Without Parameters
//:
//: Functions aren’t required to define input parameters:
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// Prints "hello, world"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use a pair of parentheses to declare a function.
//:
//: Use an empty pair of parentheses to execute a function:
func doNothing() {}
doNothing()
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Functions With Multiple Parameters
//:
//: Use a comma to declare multiple input parameters:
func greetAgain(person: String) -> String {
    let greeting = "Hello again, " + person + "."
    return greeting
}

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: true))
// Prints "Hello again, Tim!"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Overloading a function means using the same function name but different types for input parameters or the return value:
func greet(number: Int, alreadyGreeted: Bool = false) -> String {
    if alreadyGreeted {
        return greetAgain(person: "\(number)")
    } else {
        return greet(person: "\(number)")
    }
}

print(greet(number: 2))
// Prints "Hello, 2!"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Functions Without Return Values
//:
//: Functions aren’t required to return a value:
func greetAndReturnVoid(person: String) { // Void means no returned value
    print("Hello, \(person)!")
}
greetAndReturnVoid(person: "Dave")
// Prints "Hello, Dave!"
// << 🔵 Run Point
//:
//: -------------------
//:
//: No need to type the return arrow (->) or return type:
func returnNothing() {}
returnNothing()
// << 🔵 Run Point
//:
//: -------------------
//:
//: Strictly speaking, each function always has a return a value.
//:
//: Functions without a defined return type return a special value of type Void.
//:
//: Void is an empty tuple, written as ():
func returnVoid() -> Void {}
returnVoid()
// << 🔵 Run Point


func returnEmptyTuple() -> () {}
returnEmptyTuple()
// << 🔵 Run Point
//:
//: The return value can be ignored:
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world")
// prints "hello, world" but doesn't return a value
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Functions with Multiple Return Values
//:
//: Use a tuple to return multiple values:
func minMax(array: [Int]) -> (min: Int, max: Int) { // (min: Int, max: Int) is a tuple
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use labels to access each value by name:
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Using labels is optional when creating a tuple:
func minMaxAgain(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax) // without labels
    //    return (min: currentMin, max: currentMax) // with labels
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Optional Tuple Return Types
//:
//: Tuples can be optional:
func saferMinMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use optional binding when return types are optional:
if let bounds = saferMinMax(array: [8, -6, 2, 109, 3, 71]) { // optional binding
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Functions With an Implicit Return
//:
//: Single expressions can implicitly return their value:
func greeting(for person: String) -> String {
    "Hello, " + person + "!" // an implicit return
}
print(greeting(for: "Dave"))
// Prints "Hello, Dave!"

func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))
// Prints "Hello, Dave!"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Property getters can also use an implicit return:
class SomeClass {
    var someProperty: String {
        "Some Value" // an implicit return
        return "Some Value" // an explicit return
    }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Function Argument Labels and Parameter Names
//:
//: Function parameters have both an argument label and a parameter name:
//:
func someFunction(firstParameterLabel firstParameterName: Int, secondParameterLabel secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(firstParameterLabel: 1, secondParameterLabel: 2)
// << 🔵 Run Point
//:
//: -------------------
//:
//: By default, parameters use their parameter name as their argument label.
func someFunction(firstParameterName: Int, secondParameterName: Int) { // labels are the parameter names
}
someFunction(firstParameterName: 1, secondParameterName: 2)
// << 🔵 Run Point
//:
//: -------------------
//:
//: All parameters must have unique names.
//:
//: Although it’s possible to use the same argument labels if the types are different:
func someFunction2(firstParameterName: Int, secondParameterName: Int) {
}
func someFunction2(firstParameterName: Int, secondParameterName: Double) { // labels are the same
}
someFunction2(firstParameterName: 1, secondParameterName: 2)
someFunction2(firstParameterName: 1, secondParameterName: 2.0)
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Specifying Argument Labels
//:
//: Write an argument label before the parameter name:
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use argument labels to create and call functions in an expressive, sentence-like manner:
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino")) // reads like a sentence
// Prints "Hello Bill!  Glad you could visit from Cupertino."
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Omitting Argument Labels
//:
//: Use an underscore (_) to hide argument labels:
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2) // no first argument label
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Default Parameter Values
//:
//: Use the assignment operator to set a default value:
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) { // default value of 12
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12
// << 🔵 Run Point
//:
//: -------------------
//:
//: Place parameters that don’t have default values at the beginning of a function’s parameter list:
func anotherFunction(primaryParameter: Int, secondaryParameter: Int = 12) {
    
}
anotherFunction(primaryParameter: 1, secondaryParameter: 6)
anotherFunction(primaryParameter: 1)
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Variadic Parameters
//:
//: A variadic parameter accepts a convenient list of zero or more values.
//:
//: Thes values are made available as an array within the function:
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers { // [Double]
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers
// << 🔵 Run Point
//:
//: -------------------
//:
//: A function can have multiple variadic parameters.
//:
//: The first parameter that comes after a variadic parameter must have an argument label:
func variadicParameters(_ numbers: Int..., booleans: Bool...) {}
variadicParameters(1,2,3,4,5, booleans: true, false, true)
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### In-Out Parameters
//:
//: Function parameters are constants by default.
//:
//: An in-out parameter is used on value types modifying the original value:
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
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use an ampersand (&) directly before a variable’s name when you pass it as an argument:
//:
//: The ampersand symbolises the address in memory (RAM).
var someInt2 = 3
var anotherInt2 = 107
swapTwoInts(&someInt2, &anotherInt2)
print("someInt is now \(someInt2), and anotherInt is now \(anotherInt2)")
// Prints "someInt is now 107, and anotherInt is now 3"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Function Types
//:
//: Every function has a specific function type, made up of the parameter types and the return type:
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The type of both of functions above is (Int, Int) -> Int.
//:
//: This can be read as:
//:
//: “A function that has two parameters, both of type Int, and that returns a value of type Int.”
//:
//: -------------------
//:
//: () -> Void is the function type for the function below.
//:
//: This can be read as:
//:
//: "A function that has no parameters, and returns Void."
func printHelloWorld() {
    print("hello, world")
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Using Function Types
//:
//: In Swift functions are "first class citizens", which means they can be treated like variables.
var mathFunction: (Int, Int) -> Int = addTwoInts // store a function with a matching type
mathFunction(2, 3) // execute the function
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use an empty pair of parentheses to execute a function stored in a variable:
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"
// << 🔵 Run Point
//:
//: -------------------
//:
//: A different function with a matching type can be assigned to the same variable:
mathFunction = multiplyTwoInts // a different function
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 6"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use type inference to infer the function type:
let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Function Types as Parameter Types
//:
//: Functions can accept other functions as input:
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5) // addTwoInts is a function
// Prints "Result: 8"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Function Types as Return Types
//:
//: Functions can return functions:
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function
// << 🔵 Run Point
//:
//: -------------------
//:
//: Let's use moveNearerToZero to count to zero:
print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// 3...
// 2...
// 1...
// zero!
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Nested Functions
//:
//: All of the functions you have encountered so far in this chapter have been examples of global functions, which are defined at a global scope. You can also define functions inside the bodies of other functions, known as nested functions.
//:
//: Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function. An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope.
//:
//: You can rewrite the chooseStepFunction(backward:) example above to use and return nested functions:
func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
currentValue = -4
let moveNearerToZero2 = chooseStepFunction2(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero2(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
// << 🔵 Run Point
//:
//: -------------------
//: ## Original Source Documentation
//: To view the original page [click here - Functions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions)
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

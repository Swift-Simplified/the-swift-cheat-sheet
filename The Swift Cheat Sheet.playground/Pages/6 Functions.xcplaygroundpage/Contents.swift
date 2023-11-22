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
//: The first function, printAndCount(string:), prints a string, and then returns its character count as an Int. The second function, printWithoutCounting(string:), calls the first function, but ignores its return value. When the second function is called, the message is still printed by the first function, but the returned value isn’t used.
//:
//: * callout(Note):
//:     → Return values can be ignored, but a function that says it will return a value must always do so. A function with a defined return type can’t allow control to fall out of the bottom of the function without returning a value, and attempting to do so will result in a compile-time error.
//:
//: -------------------
//:
//: ### Functions with Multiple Return Values
//:
//: You can use a tuple type as the return type for a function to return multiple values as part of one compound return value.
//:
//: The example below defines a function called minMax(array:), which finds the smallest and largest numbers in an array of Int values:
func minMax(array: [Int]) -> (min: Int, max: Int) {
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
//: The minMax(array:) function returns a tuple containing two Int values. These values are labeled min and max so that they can be accessed by name when querying the function’s return value.
//:
//: The body of the minMax(array:) function starts by setting two working variables called currentMin and currentMax to the value of the first integer in the array. The function then iterates over the remaining values in the array and checks each value to see if it’s smaller or larger than the values of currentMin and currentMax respectively. Finally, the overall minimum and maximum values are returned as a tuple of two Int values.
//:
//: Because the tuple’s member values are named as part of the function’s return type, they can be accessed with dot syntax to retrieve the minimum and maximum found values:
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Note that the tuple’s members don’t need to be named at the point that the tuple is returned from the function, because their names are already specified as part of the function’s return type.
//:
//: -------------------
//:
//: ### Optional Tuple Return Types
//:
//: If the tuple type to be returned from a function has the potential to have “no value” for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil. You write an optional tuple return type by placing a question mark after the tuple type’s closing parenthesis, such as (Int, Int)? or (String, Int, Bool)?.
//:
//: * callout(Note):
//:     → An optional tuple type such as (Int, Int)? is different from a tuple that contains optional types such as (Int?, Int?). With an optional tuple type, the entire tuple is optional, not just each individual value within the tuple.
//:
//: The minMax(array:) function above returns a tuple containing two Int values. However, the function doesn’t perform any safety checks on the array it’s passed. If the array argument contains an empty array, the minMax(array:) function, as defined above, will trigger a runtime error when attempting to access array[0].
//:
//: To handle an empty array safely, write the minMax(array:) function with an optional tuple return type and return a value of nil when the array is empty:
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
//: You can use optional binding to check whether this version of the minMax(array:) function returns an actual tuple value or nil:
if let bounds = saferMinMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Functions With an Implicit Return
//:
//: If the entire body of the function is a single expression, the function implicitly returns that expression. For example, both functions below have the same behavior:
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
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
//: The entire definition of the greeting(for:) function is the greeting message that it returns, which means it can use this shorter form. The anotherGreeting(for:) function returns the same greeting message, using the return keyword like a longer function. Any function that you write as just one return line can omit the return.
//:
//: As you’ll see in Shorthand Getter Declaration, property getters can also use an implicit return.
//:
//: * callout(Note):
//:     → The code you write as an implicit return value needs to return some value. For example, you can’t use print(13) as an implicit return value. However, you can use a function that never returns like fatalError("Oh no!") as an implicit return value, because Swift knows that the implicit return doesn’t happen.
//:
//: -------------------
//:
//: ## Function Argument Labels and Parameter Names
//:
//: Each function parameter has both an argument label and a parameter name. The argument label is used when calling the function; each argument is written in the function call with its argument label before it. The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)
// << 🔵 Run Point
//:
//: -------------------
//:
//: All parameters must have unique names. Although it’s possible for multiple parameters to have the same argument label, unique argument labels help make your code more readable.
//:
//: -------------------
//:
//: ### Specifying Argument Labels
//:
//: You write an argument label before the parameter name, separated by a space:
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Here’s a variation of the greet(person:) function that takes a person’s name and hometown and returns a greeting:
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill!  Glad you could visit from Cupertino."
// << 🔵 Run Point
//:
//: -------------------
//:
//: The use of argument labels can allow a function to be called in an expressive, sentence-like manner, while still providing a function body that’s readable and clear in intent.
//:
//: -------------------
//:
//: ### Omitting Argument Labels
//:
//: If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter.
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)
// << 🔵 Run Point
//:
//: -------------------
//:
//: If a parameter has an argument label, the argument must be labeled when you call the function.
//:
//: -------------------
//:
//: ### Default Parameter Values
//:
//: You can define a default value for any parameter in a function by assigning a value to the parameter after that parameter’s type. If a default value is defined, you can omit that parameter when calling the function.
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12
// << 🔵 Run Point
//:
//: -------------------
//:
//: Place parameters that don’t have default values at the beginning of a function’s parameter list, before the parameters that have default values. Parameters that don’t have default values are usually more important to the function’s meaning—writing them first makes it easier to recognize that the same function is being called, regardless of whether any default parameters are omitted.
//:
//: -------------------
//:
//: ### Variadic Parameters
//:
//: A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called. Write variadic parameters by inserting three period characters (...) after the parameter’s type name.
//:
//: The values passed to a variadic parameter are made available within the function’s body as an array of the appropriate type. For example, a variadic parameter with a name of numbers and a type of Double... is made available within the function’s body as a constant array called numbers of type [Double].
//:
//: The example below calculates the arithmetic mean (also known as the average) for a list of numbers of any length:
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
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
//: A function can have multiple variadic parameters. The first parameter that comes after a variadic parameter must have an argument label. The argument label makes it unambiguous which arguments are passed to the variadic parameter and which arguments are passed to the parameters that come after the variadic parameter.
//:
//: -------------------
//:
//: ### In-Out Parameters
//:
//: Function parameters are constants by default. Trying to change the value of a function parameter from within the body of that function results in a compile-time error. This means that you can’t change the value of a parameter by mistake. If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.
//:
//: You write an in-out parameter by placing the inout keyword right before a parameter’s type. An in-out parameter has a value that’s passed in to the function, is modified by the function, and is passed back out of the function to replace the original value. For a detailed discussion of the behavior of in-out parameters and associated compiler optimizations, see In-Out Parameters.
//:
//: You can only pass a variable as the argument for an in-out parameter. You can’t pass a constant or a literal value as the argument, because constants and literals can’t be modified. You place an ampersand (&) directly before a variable’s name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function.
//:
//: * callout(Note):
//:     → In-out parameters can’t have default values, and variadic parameters can’t be marked as inout.
//:
//: Here’s an example of a function called swapTwoInts(_:_:), which has two in-out integer parameters called a and b:
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The swapTwoInts(_:_:) function simply swaps the value of b into a, and the value of a into b. The function performs this swap by storing the value of a in a temporary constant called temporaryA, assigning the value of b to a, and then assigning temporaryA to b.
//:
//: You can call the swapTwoInts(_:_:) function with two variables of type Int to swap their values. Note that the names of someInt and anotherInt are prefixed with an ampersand when they’re passed to the swapTwoInts(_:_:) function:
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"
// << 🔵 Run Point
//:
//: -------------------
//:
//: The example above shows that the original values of someInt and anotherInt are modified by the swapTwoInts(_:_:) function, even though they were originally defined outside of the function.
//:
//: * callout(Note):
//:     → In-out parameters aren’t the same as returning a value from a function. The swapTwoInts example above doesn’t define a return type or return a value, but it still modifies the values of someInt and anotherInt. In-out parameters are an alternative way for a function to have an effect outside of the scope of its function body.
//:
//: -------------------
//:
//: ## Function Types
//:
//: Every function has a specific function type, made up of the parameter types and the return type of the function.
//:
//: For example:
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
//: This example defines two simple mathematical functions called addTwoInts and multiplyTwoInts. These functions each take two Int values, and return an Int value, which is the result of performing an appropriate mathematical operation.
//:
//: The type of both of these functions is (Int, Int) -> Int. This can be read as:
//:
//: “A function that has two parameters, both of type Int, and that returns a value of type Int.”
//:
//: Here’s another example, for a function with no parameters or return value:
func printHelloWorld() {
    print("hello, world")
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The type of this function is () -> Void, or “a function that has no parameters, and returns Void.”
//:
//: -------------------
//:
//: ### Using Function Types
//:
//: You use function types just like any other types in Swift. For example, you can define a constant or variable to be of a function type and assign an appropriate function to that variable:
var mathFunction: (Int, Int) -> Int = addTwoInts
// << 🔵 Run Point
//:
//: -------------------
//:
//: This can be read as:
//:
//: “Define a variable called mathFunction, which has a type of ‘a function that takes two Int values, and returns an Int value.’ Set this new variable to refer to the function called addTwoInts.”
//:
//: The addTwoInts(_:_:) function has the same type as the mathFunction variable, and so this assignment is allowed by Swift’s type-checker.
//:
//: You can now call the assigned function with the name mathFunction:
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"
// << 🔵 Run Point
//:
//: -------------------
//:
//: A different function with the same matching type can be assigned to the same variable, in the same way as for nonfunction types:
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 6"
// << 🔵 Run Point
//:
//: -------------------
//:
//: As with any other type, you can leave it to Swift to infer the function type when you assign a function to a constant or variable:
let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Function Types as Parameter Types
//:
//: You can use a function type such as (Int, Int) -> Int as a parameter type for another function. This enables you to leave some aspects of a function’s implementation for the function’s caller to provide when the function is called.
//:
//: Here’s an example to print the results of the math functions from above:
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// Prints "Result: 8"
// << 🔵 Run Point
//:
//: -------------------
//:
//: This example defines a function called printMathResult(_:_:_:), which has three parameters. The first parameter is called mathFunction, and is of type (Int, Int) -> Int. You can pass any function of that type as the argument for this first parameter. The second and third parameters are called a and b, and are both of type Int. These are used as the two input values for the provided math function.
//:
//: When printMathResult(_:_:_:) is called, it’s passed the addTwoInts(_:_:) function, and the integer values 3 and 5. It calls the provided function with the values 3 and 5, and prints the result of 8.
//:
//: The role of printMathResult(_:_:_:) is to print the result of a call to a math function of an appropriate type. It doesn’t matter what that function’s implementation actually does—it matters only that the function is of the correct type. This enables printMathResult(_:_:_:) to hand off some of its functionality to the caller of the function in a type-safe way.
//:
//: -------------------
//:
//: ### Function Types as Return Types
//:
//: You can use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returning function.
//:
//: The next example defines two simple functions called stepForward(_:) and stepBackward(_:). The stepForward(_:) function returns a value one more than its input value, and the stepBackward(_:) function returns a value one less than its input value. Both functions have a type of (Int) -> Int:
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Here’s a function called chooseStepFunction(backward:), whose return type is (Int) -> Int. The chooseStepFunction(backward:) function returns the stepForward(_:) function or the stepBackward(_:) function based on a Boolean parameter called backward:
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: You can now use chooseStepFunction(backward:) to obtain a function that will step in one direction or the other:
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function
// << 🔵 Run Point
//:
//: -------------------
//:
//: The example above determines whether a positive or negative step is needed to move a variable called currentValue progressively closer to zero. currentValue has an initial value of 3, which means that currentValue > 0 returns true, causing chooseStepFunction(backward:) to return the stepBackward(_:) function. A reference to the returned function is stored in a constant called moveNearerToZero.
//:
//: Now that moveNearerToZero refers to the correct function, it can be used to count to zero:
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

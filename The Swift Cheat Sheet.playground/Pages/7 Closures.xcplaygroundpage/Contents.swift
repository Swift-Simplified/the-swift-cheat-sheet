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
//: All text has been condensed and simplified providing more concise information focussing on code examples for faster learning. 🚀
//:
//: v1 | Swift v5.9+ | Xcode 14+ | [The Original Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)
//:
//: -------------------
//:
//: ## Topic 7: Closures
//:
//:
//: Closures are self-contained blocks of code.
//:
//: -------------------
//:
//: ## Three Forms
//:
//: Closures take one of three forms:
//:
//: * **Global functions** are closures that have a name and don’t capture any values.
//:
//: * **Nested functions** are closures that have a name and can capture values from their enclosing function.
//:
//: * **Closure expressions** are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
//:
//: -------------------
//:
//: ## Closure Expressions
//:
//: It’s sometimes useful to write shorter versions of function-like constructs without the full declaration and name.
//:
//: This is called a closure expression.
//:
//: -------------------
//:
//: ### The Sorted Method
//:
//: Here’s an array to be sorted:
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
// << 🔵 Run Point
//:
//: -------------------
//:
//: We can create a function to sort this array in reverse order:
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2 // reverse order
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
// << 🔵 Run Point
//:
//: -------------------
//:
//: It's preferable to write single-expression functions in a smaller closure:
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2 // reverse order
})
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Closure Expression Syntax
//:
//: Use the following format to create a closure:
/*
    { (parameters) -> returnType in
        statements
    }
*/
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
// << 🔵 Run Point
//:
//: -------------------
//:
//: The body of the closure is so short, it can be written on a one line:
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
// << 🔵 Run Point
//:
//: -------------------
//:
//: ✅ In-out parameters are supported.
//:
//: ✅ Paramters can’t have default values.
//:
//: ✅ Variadic parameters are supported with named variables.
//:
//: ✅ Tuples are supported.
//:
//: -------------------
//:
//: ### Inferring Type From Context
//:
//: Because all types can be inferred, you can omit:
//: * the return arrow (->).
//: * the parentheses around the names of the parameters.
//: * the type annotation.
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
// << 🔵 Run Point
//:
//: -------------------
//:
//: Inferring types is always possible when passing a closure into a function as the expected function type is already declared.
//:
//: -------------------
//:
//: ### Implicit Returns from Single-Expression Closures
//:
//: Single-expression Closures can implicitly return the result:
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } ) // no return keyword
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Shorthand Argument Names
//:
//: Shorthand argument names begin with a dollar sign ($) followed by the parameter index:
//:
//: When used the argument list must be removed.
// ⛔️ Compilation error: uncomment to view
//reversedNames = names.sorted(by: { s1, s2 in $0 > $1 } )
reversedNames = names.sorted(by: { $0 > $1 } )
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Operator Methods
//:
//: Operators are actually functions.
//:
//: Use operators as parameter values to refer to their functions:
let alphabeticalOrder = names.sorted(by: <)
let reverseAlphabeticalOrder = names.sorted(by: >)
// << 🔵 Run Point
//:
//: -------------------
//:
//: For more about operator methods, see Operator Methods.
//:
//: -------------------
//:
//: ## Trailing Closures
//:
//: When a function’s final argument accepts a function it can be called with a trailing closure.
//:
//: You omit the parameter label and append a closure to the call:
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // do something
}

// without using a trailing closure
someFunctionThatTakesAClosure(closure: {
    // closure code
})

// with a trailing closure instead
someFunctionThatTakesAClosure() {
    // closure code
}

// trailing closure - no parenthesis
someFunctionThatTakesAClosure {
    // closure code
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The sorted(by:) method can use a trailing closure:
reversedNames = names.sorted() { $0 > $1 }
// << 🔵 Run Point
//:
//: -------------------
//:
//: When a function has one argument the parentheses () are optional:
reversedNames = names.sorted { $0 > $1 } // this is the preferred Swift style
reversedNames = names.sorted() { $0 > $1 }
// << 🔵 Run Point
//:
//: -------------------
//:
//: The map(_:) method is used to convert an array of values to a different type.
//:
//: This method is often used with a trailing closure:
//:
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]
print(strings)
// << 🔵 Run Point
//:
//: -------------------
//:
//: Multiple trailing closures are supported.
//:
//: You omit the first argument label and you label the remaining trailing closures:
class Server {}
class Picture {}

func download(_ imageName: String, from: Server) -> Picture? {
    // TODO: Download picture from server
    return Picture()
}

// accept two functions as parameters
func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}

class SomeView {
    var currentPicture: Picture?
}

let someView = SomeView()
let someServer = Server()
loadPicture(from: someServer) { picture in  // trailing closure 1
    someView.currentPicture = picture
} onFailure: {                              // trailing closure 2
    print("Couldn't download the next picture.")
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Capturing Values
//:
//: A closure can capture constants and variables from the surrounding context in which it’s defined. 
//:
//: The closure can then refer to and modify the values of those constants and variables, even if the original scope that defined the constants and variables no longer exists.
//:
//: -------------------
//:
//: The simplest form of a closure that can capture values is a nested function.
//:
//: Here’s an example of a nested function, which captures two values, runningTotal and amount:
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount // both are captured here
        return runningTotal
    }
    return incrementer
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The return type of makeIncrementer is () -> Int. This means that it returns a function.
let anIncrementFunction = makeIncrementer(forIncrement: 1)
// << 🔵 Run Point
//:
//: -------------------
//:
//: The function returns an Int value each time it’s called:
let value1 = anIncrementFunction() // returns 1
let value2 = anIncrementFunction() // returns 2
let value3 = anIncrementFunction() // returns 3
// << 🔵 Run Point
//:
//: -------------------
//:
//: The runningTotal variable was captured by the nested function.
//:
//: An area of memory for this value will exist until all references are disconnected.
//:
//: -------------------
//:
//: This variable starts at 0 and increments with each function call:
//:
let incrementByTen = makeIncrementer(forIncrement: 10) // increment by 10

var num = incrementByTen()  // returns a value of 10
num = incrementByTen()      // returns a value of 20
num = incrementByTen()      // returns a value of 30
print(num)
// << 🔵 Run Point
//:
//: -------------------
//:
//: When you create a second incrementer, it will create a new, separate runningTotal variable:
let incrementBySeven = makeIncrementer(forIncrement: 7)
num = incrementBySeven() // returns a value of 7
num = incrementBySeven() // returns a value of 14
// << 🔵 Run Point
//:
//: -------------------
//:
//: Each function increments its own runningTotal variable and no others:
num = incrementByTen() // returns a value of 40
num = incrementByTen() // returns a value of 50

num = incrementBySeven() // returns a value of 21
num = incrementBySeven() // returns a value of 28
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Closures Are Reference Types
//:
//: Functions and closures are reference types.
//:
//: All references point to the same closure:
let incrementByFive = makeIncrementer(forIncrement: 5) // create one incrementer
let sameClosure = incrementByFive
let alsoSameClosure = sameClosure

incrementByFive()   // 5
sameClosure()       // 10
alsoSameClosure()   // 15
// all variables point to the same closure!
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Escaping Closures
//:
//: A closure can "escape a function" when the closure is stored and called at a later date.
//:
//: Use @escaping before the function type to indicate that a closure can escape:
var variableToStoreClosure: () -> Void = {}
func someFunction(escapingClosure: @escaping () -> Void) {
    variableToStoreClosure = escapingClosure // store outside of the function
}
someFunction() {
    print("My closure escaped!")
}
variableToStoreClosure()
// << 🔵 Run Point
//:
//: -------------------
//:
//: When using asynchronous code, functions often accept completion handlers to call once the task is completed.
//:
//: In the following example our closure isn’t called until the operation is completed. This is why the closure needs to escape - to be called later:
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func taskCompleted() {
    for completionHandler in completionHandlers {
        completionHandler()
    }
}
someFunctionWithEscapingClosure() { // store this closure to completionHandlers
    print("My closure escaped!")
}
taskCompleted() // execute stored closure
completionHandlers.removeAll() // free the closure from memory
// << 🔵 Run Point
//:
//: -------------------
//:
//: An escaping closure that refers to self needs special consideration.
//:
//: -------------------
//:
//: For classes, escaping closures must explicitly reference self:
//:
//: Non-escaping closures may implicitly reference self:
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } // need to write self for escaping closures
        someFunctionWithNonescapingClosure { x = 200 } // don't for non-escaping closures
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Classes require an explicit reference to self when captured in an escaping closure.
//:
//: Add self to a capture list to implicitly refer to self:
class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }        // self.x
        someFunctionWithEscapingClosure { [self] in x = 100 }   // x
    }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: For structures or enumerations (value types), you can always refer to self implicitly. This is because the value is copied creating a new address in memory.
//:
//: -------------------
//:
//: Escaping closures can’t capture mutable references to self for structures or enumerations (value types):
struct SomeStruct {
    var x = 10
    mutating func doSomething() {
        someFunctionWithNonescapingClosure { x = 200 }  // Ok
    }
}
// ⛔️ Compilation error: uncomment to view
//struct SomeStruct2 {
//    var x = 10
//    mutating func doSomething() {
//        someFunctionWithEscapingClosure { x = 100 }     // Error
//    }
//}
// << 🔵 Run Point
//:
//: -------------------
//:
//: A strong reference cycle is when an object points to another object which also points to the first object. 🔄
//:
//: For classes (reference types), capturing self in escaping closures creates an easy opportunity to accidentally create a strong reference cycle:
class ClassWithReferenceCycle {
    var runningTotal = 0
    var incrementor: () -> Int = { 0 }
    func setIncrement(by valueToIncrement: Int) {
        func incrementor() -> Int {
            self.runningTotal += valueToIncrement // capture self
            return runningTotal
        }
        self.incrementor = incrementor // strong reference cycle created!
    }
    
    func increment() {
        incrementor()
    }
}
let classWithReferenceCycle = ClassWithReferenceCycle()
classWithReferenceCycle.setIncrement(by: 5) // strong reference cycle created
classWithReferenceCycle.increment() // 5
classWithReferenceCycle.increment() // 10
classWithReferenceCycle.increment() // 15
print("runningTotal: \(classWithReferenceCycle.runningTotal)")

// classWithReferenceCycle will now never be freed from memory (RAM) 😬
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Autoclosures
//:
//: An autoclosure wraps an expression into a closure automatically.
//:
//: All you need to do is supply the expression:
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// with an autoclosure
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0)) // closure automatically created
// << 🔵 Run Point
//:
//: -------------------
//:
//: * callout(Note):
//:     → Overusing autoclosures can make your code hard to understand. The function name should make it clear evaluation may be deferred and not executed immediately.
//:
//: -------------------
//:
//: Use both the @autoclosure and @escaping attributes to create an escaping closure:
// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Prints "Now serving Alex!"
// Prints "Now serving Ewa!"
// << 🔵 Run Point
//:
//: -------------------
//: ## Original Source Documentation
//: To view the original page [click here - Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures)
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

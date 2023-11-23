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
//: A closure can capture constants and variables from the surrounding context in which it’s defined. The closure can then refer to and modify the values of those constants and variables from within its body, even if the original scope that defined the constants and variables no longer exists.
//:
//: In Swift, the simplest form of a closure that can capture values is a nested function, written within the body of another function. A nested function can capture any of its outer function’s arguments and can also capture any constants and variables defined within the outer function.
//:
//: Here’s an example of a function called makeIncrementer, which contains a nested function called incrementer. The nested incrementer() function captures two values, runningTotal and amount, from its surrounding context. After capturing these values, incrementer is returned by makeIncrementer as a closure that increments runningTotal by amount each time it’s called.
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The return type of makeIncrementer is () -> Int. This means that it returns a function, rather than a simple value. The function it returns has no parameters, and returns an Int value each time it’s called. To learn how functions can return other functions, see Function Types as Return Types.
//:
//: The makeIncrementer(forIncrement:) function defines an integer variable called runningTotal, to store the current running total of the incrementer that will be returned. This variable is initialized with a value of 0.
//:
//: The makeIncrementer(forIncrement:) function has a single Int parameter with an argument label of forIncrement, and a parameter name of amount. The argument value passed to this parameter specifies how much runningTotal should be incremented by each time the returned incrementer function is called. The makeIncrementer function defines a nested function called incrementer, which performs the actual incrementing. This function simply adds amount to runningTotal, and returns the result.
//:
//: When considered in isolation, the nested incrementer() function might seem unusual:
// ⛔️ Compilation error: uncomment to view
//func incrementer() -> Int {
//    runningTotal += amount
//    return runningTotal
//}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The incrementer() function doesn’t have any parameters, and yet it refers to runningTotal and amount from within its function body. It does this by capturing a reference to runningTotal and amount from the surrounding function and using them within its own function body. Capturing by reference ensures that runningTotal and amount don’t disappear when the call to makeIncrementer ends, and also ensures that runningTotal is available the next time the incrementer function is called.
//:
//: * callout(Note):
//:     → As an optimization, Swift may instead capture and store a copy of a value if that value isn’t mutated by a closure, and if the value isn’t mutated after the closure is created.
//:
//:     Swift also handles all memory management involved in disposing of variables when they’re no longer needed.
//:
//: Here’s an example of makeIncrementer in action:
let incrementByTen = makeIncrementer(forIncrement: 10)
// << 🔵 Run Point
//:
//: -------------------
//:
//: This example sets a constant called incrementByTen to refer to an incrementer function that adds 10 to its runningTotal variable each time it’s called. Calling the function multiple times shows this behavior in action:
incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30
// << 🔵 Run Point
//:
//: -------------------
//:
//: If you create a second incrementer, it will have its own stored reference to a new, separate runningTotal variable:
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// returns a value of 7
// << 🔵 Run Point
//:
//: -------------------
//:
//: Calling the original incrementer (incrementByTen) again continues to increment its own runningTotal variable, and doesn’t affect the variable captured by incrementBySeven:
incrementByTen()
// returns a value of 40
// << 🔵 Run Point
//:
//: -------------------
//:
//: * callout(Note):
//:     → If you assign a closure to a property of a class instance, and the closure captures that instance by referring to the instance or its members, you will create a strong reference cycle between the closure and the instance. Swift uses capture lists to break these strong reference cycles. For more information, see Strong Reference Cycles for Closures.
//:
//: -------------------
//:
//: ## Closures Are Reference Types
//:
//: In the example above, incrementBySeven and incrementByTen are constants, but the closures these constants refer to are still able to increment the runningTotal variables that they have captured. This is because functions and closures are reference types.
//:
//: Whenever you assign a function or a closure to a constant or a variable, you are actually setting that constant or variable to be a reference to the function or closure. In the example above, it’s the choice of closure that incrementByTen refers to that’s constant, and not the contents of the closure itself.
//:
//: This also means that if you assign a closure to two different constants or variables, both of those constants or variables refer to the same closure.
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// returns a value of 50

incrementByTen()
// returns a value of 60
// << 🔵 Run Point
//:
//: -------------------
//:
//: The example above shows that calling alsoIncrementByTen is the same as calling incrementByTen. Because both of them refer to the same closure, they both increment and return the same running total.
//:
//: -------------------
//:
//: ## Escaping Closures
//:
//: A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns. When you declare a function that takes a closure as one of its parameters, you can write @escaping before the parameter’s type to indicate that the closure is allowed to escape.
//:
//: One way that a closure can escape is by being stored in a variable that’s defined outside the function. As an example, many functions that start an asynchronous operation take a closure argument as a completion handler. The function returns after it starts the operation, but the closure isn’t called until the operation is completed—the closure needs to escape, to be called later. For example:
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: The someFunctionWithEscapingClosure(_:) function takes a closure as its argument and adds it to an array that’s declared outside the function. If you didn’t mark the parameter of this function with @escaping, you would get a compile-time error.
//:
//: An escaping closure that refers to self needs special consideration if self refers to an instance of a class. Capturing self in an escaping closure makes it easy to accidentally create a strong reference cycle. For information about reference cycles, see Automatic Reference Counting.
//:
//: Normally, a closure captures variables implicitly by using them in the body of the closure, but in this case you need to be explicit. If you want to capture self, write self explicitly when you use it, or include self in the closure’s capture list. Writing self explicitly lets you express your intent, and reminds you to confirm that there isn’t a reference cycle. For example, in the code below, the closure passed to someFunctionWithEscapingClosure(_:) refers to self explicitly. In contrast, the closure passed to someFunctionWithNonescapingClosure(_:) is a nonescaping closure, which means it can refer to self implicitly.
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
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
//: Here’s a version of doSomething() that captures self by including it in the closure’s capture list, and then refers to self implicitly:

class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: If self is an instance of a structure or an enumeration, you can always refer to self implicitly. However, an escaping closure can’t capture a mutable reference to self when self is an instance of a structure or an enumeration. Structures and enumerations don’t allow shared mutability, as discussed in Structures and Enumerations Are Value Types.

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
//: The call to the someFunctionWithEscapingClosure function in the example above is an error because it’s inside a mutating method, so self is mutable. That violates the rule that escaping closures can’t capture a mutable reference to self for structures.
//:
//: -------------------
//:
//: ## Autoclosures
//:
//: An autoclosure is a closure that’s automatically created to wrap an expression that’s being passed as an argument to a function. It doesn’t take any arguments, and when it’s called, it returns the value of the expression that’s wrapped inside of it. This syntactic convenience lets you omit braces around a function’s parameter by writing a normal expression instead of an explicit closure.
//:
//: It’s common to call functions that take autoclosures, but it’s not common to implement that kind of function. For example, the assert(condition:message:file:line:) function takes an autoclosure for its condition and message parameters; its condition parameter is evaluated only in debug builds and its message parameter is evaluated only if condition is false.
//:
//: An autoclosure lets you delay evaluation, because the code inside isn’t run until you call the closure. Delaying evaluation is useful for code that has side effects or is computationally expensive, because it lets you control when that code is evaluated. The code below shows how a closure delays evaluation.
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Even though the first element of the customersInLine array is removed by the code inside the closure, the array element isn’t removed until the closure is actually called. If the closure is never called, the expression inside the closure is never evaluated, which means the array element is never removed. Note that the type of customerProvider isn’t String but () -> String—a function with no parameters that returns a string.
//:
//: You get the same behavior of delayed evaluation when you pass a closure as an argument to a function.
// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"
// << 🔵 Run Point
//:
//: -------------------
//:
//: The serve(customer:) function in the listing above takes an explicit closure that returns a customer’s name. The version of serve(customer:) below performs the same operation but, instead of taking an explicit closure, it takes an autoclosure by marking its parameter’s type with the @autoclosure attribute. Now you can call the function as if it took a String argument instead of a closure. The argument is automatically converted to a closure, because the customerProvider parameter’s type is marked with the @autoclosure attribute.

// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"
// << 🔵 Run Point
//:
//: -------------------
//:
//: * callout(Note):
//:     → Overusing autoclosures can make your code hard to understand. The context and function name should make it clear that evaluation is being deferred.
//:
//: If you want an autoclosure that’s allowed to escape, use both the @autoclosure and @escaping attributes. The @escaping attribute is described above in Escaping Closures.
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
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"
// << 🔵 Run Point
//:
//: -------------------
//:
//: In the code above, instead of calling the closure passed to it as its customerProvider argument, the collectCustomerProviders(_:) function appends the closure to the customerProviders array. The array is declared outside the scope of the function, which means the closures in the array can be executed after the function returns. As a result, the value of the customerProvider argument must be allowed to escape the function’s scope.
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

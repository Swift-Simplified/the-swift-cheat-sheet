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
//: ## → Start Here 👋🏿👋🏻👋🏽
//:
//: Welcome to [Swift Simplified .com](https://www.swiftfimplified.com).
//:
//: We converted the official Apple Swift Language Guide into Xcode playgrounds transforming each published topic into editable and executable code examples.
/*
 How to execute each code example:
 
 To execute each code example,
 hover over the line number
 next to the << 🔵 Run Point
 and press the run button.
 */
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
func login() {
    guard currentLoginAttempt < maximumNumberOfLoginAttempts else {
        return
    }
    currentLoginAttempt += 1
    print("logging in..")
}
login()
// << 🔵 Run Point
//:
//: -------------------
//: - hover over the line number and press the run button
//:
//: -------------------
//: ## 28 Topics
//:
//: There are 28 topics to read and they guide you through each main language feature *(including advanced topics)* that you may need when working in industry.
//:
//: Don't worry if it feels a little too complicated, because we simplified it in our online course, [The Swift Handbook](https://www.swiftsimplified.com/the-swift-handbook).
//:
//: -------------------
//: ## Language Guide Contents
//:
//: * *Topic 1:*   [The Basics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)
//: * *Topic 2:*   [Basic Operators](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators)
//: * *Topic 3:*   [Strings and Characters](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters)
//: * *Topic 4:*   [Collection Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes)
//: * *Topic 5:*   [Control Flow](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow)
//: * *Topic 6:*   [Functions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions)
//: * *Topic 7:*   [Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures)
//: * *Topic 8:*   [Enumerations](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations)
//: * *Topic 9:*   [Structures and Classes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures)
//: * *Topic 10:*  [Properties](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties)
//: * *Topic 11:*  [Methods](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/methods)
//: * *Topic 12:*  [Subscripts](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/subscripts)
//: * *Topic 13:*  [Inheritance](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance)
//: * *Topic 14:*  [Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization)
//: * *Topic 15:*  [Deinitialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/deinitialization)
//: * *Topic 16:*  [Optional Chaining](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/optionalchaining)
//: * *Topic 17:*  [Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling)
//: * *Topic 18:*  [Concurrency](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency)
//: * *Topic 19:*  [Type Casting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting)
//: * *Topic 20:*  [Nested Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes)
//: * *Topic 21:*  [Extensions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions)
//: * *Topic 22:*  [Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols)
//: * *Topic 23:*  [Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics)
//: * *Topic 24:*  [Opaque Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/opaquetypes)
//: * *Topic 25:*  [Automatic Reference Counting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting)
//: * *Topic 26:*  [Memory Safety](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/memorysafety)
//: * *Topic 27:*  [Access Control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol)
//: * *Topic 28:*  [Advanced Operators](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/advancedoperators)
//:
//: -------------------
//: ## Want An Online Course Teaching Swift?
//:
//: [The  Swift Handbook](https://www.swiftsimplified.com/the-swift-handbook) teaches the official topics required to become a Swift engineer taken from official Apple documentation and taught by one of the worlds first iOS developers.
//:
//: Find out more by clicking [here](https://www.swiftsimplified.com/the-swift-handbook)
//:
//: [SwiftSimplified.com/the-swift-handbook](https://www.swiftsimplified.com/the-swift-handbook).
//:
//: -------------------
//:
//: [Next Page](@next)
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

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
//: ## Topic 5: Control Flow
//:
//:
//: Swift provides a variety of control flow statements.
//:
//: -------------------
//:
//: ## For-In Loops
//:
//: Repeating code in a loop.
//:
//: -------------------
//:
//: An array:
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!
// << 🔵 Run Point
//:
//: -------------------
//:
//: A dictionary:
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// cats have 4 legs
// ants have 6 legs
// spiders have 8 legs
// << 🔵 Run Point
//:
//: -------------------
//:
//: `for-in` loops with numeric ranges:
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use underscore to ignore the variable name.
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use the half-open range operator (`..<`) to include the lower bound but not the upper bound:
let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Use the `stride(from:to:by:)` function to skip unwanted values:
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: Using `stride(from:through:by:)` includes the last value:
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## While Loops
//:
//: A `while` loop performs a set of statements until a condition becomes false.
//:
//: -------------------
//:
//: ### While
//:
//: A `while` loop evaluates its condition at the start of each pass through the loop.
/*
 while condition {
    statements
 }
*/
//: -------------------
//:
//: "Snakes and Ladders" game using a `while` loop:
//:
//: ![Diagram](snakesAndLadders_2x.png)
//: Rules of the game:
//:
//: * Objective is to land on square 25 or beyound.
//:
//: * Start at square zero.
//:
//: * Roll a dice and move by that number.
//:
//: * If you land on bottom of a ladder move up that ladder.
//:
//: * If you land on the head of a snake, you move down that snake.
//:
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1) // 0 places added or deducated each square

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Repeat-While
//:
//: * `repeat-while` evaluates its condition at the end of each pass through the loop.
//:
/*
repeat {
    statements
} while condition
*/
//:
//: "Snakes and Ladders" game written using a `repeat-while` loop:
let finalSquare2 = 25
board = [Int](repeating: 0, count: finalSquare2 + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
square = 0
diceRoll = 0

repeat {
    // move up or down for a snake or ladder
    square += board[square]
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare
print("Game over!")
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Conditional Statements
//:
//: Executing code based on a condition.
//:
//: -------------------
//:
//: ### If
//: 
//: Executes if the condition is `true`:
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
// Prints "It's very cold. Consider wearing a scarf."
// << 🔵 Run Point
//:
//: -------------------
//:
//: An `else` clause executes when the `if` condition is `false`:
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// Prints "It's not that cold. Wear a t-shirt."
// << 🔵 Run Point
//:
//: -------------------
//:
//: Multiple `if` statements:
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// Prints "It's really warm. Don't forget to wear sunscreen."
// << 🔵 Run Point
//:
//: -------------------
//:
//: The `else` clause is optional.
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Switch
//:
//: A `switch` statement compares a value against another value.
/*
 switch some value to consider {
 case value 1:
     respond to value 1
 case value 2,
     value 3:
     respond to value 2 or 3
 default:
     otherwise, do something else
 }
 */
//:
//: A character:
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// Prints "The last letter of the alphabet"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### No Implicit Fallthrough
//:
//: The body of each case must contain at least one executable statement:
let anotherCharacter: Character = "a"
// ⛔️ Compilation error: uncomment to view
//switch anotherCharacter {
//case "a": // Invalid, the case has an empty body
//case "A":
//    print("The letter A")
//default:
//    print("Not the letter A")
//}
// This will report a compile-time error.
// << 🔵 Run Point
//:
//: -------------------
//:
//: Combine two values into a compound case:
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// Prints "The letter A"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Interval Matching
//:
//: An interval:
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Tuples
//: Tuples contain more than one value.
//:
//: ![Diagram](coordinateGraphSimple_2x.png)
//:
//: An integer tuple:

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// Prints "(1, 1) is inside the box"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Value Bindings
//: Value bindings provide variables to use.
//:
//: ![Diagram](coordinateGraphMedium_2x.png)
//:
//: No default case:
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// Prints "on the x-axis with an x value of 2"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Where
//:
//: ![Diagram](coordinateGraphComplex_2x.png)
//:
//: A `where` clause:
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// Prints "(1, -1) is on the line x == -y"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Compound Cases
//:
//: Multiple `switch` cases on one line:
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) isn't a vowel or a consonant")
}
// Prints "e is a vowel"
// << 🔵 Run Point
//:
//: -------------------
//:
//: Compound cases with value bindings:
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// Prints "On an axis, 9 from the origin"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Control Transfer Statements
//:
//: Transfering control to alternative lines of code.
//:
//: -------------------
//:
//: ### Continue
//:
//: Stops execution and starts again at the beginning:
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)
// Prints "grtmndsthnklk"
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Break
//:
//: Ends execution immediately.
//:
//: -------------------
//:
//: #### Break in a Loop Statement
//:
//: Use `break` to immediately end the loop:
var newPuzzleOutput = ""
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        break
    }
    newPuzzleOutput.append(character)
}
print(newPuzzleOutput)
// Prints "gr"
// << 🔵 Run Point
//:
//: -------------------
//:
//: #### Break in a Switch Statement
//:
//: Use `break` to immediately exit the switch:
let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    break
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value couldn't be found for \(numberSymbol).")
}
// Prints "The integer value of 三 is 3."
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Fallthrough
//:
//: Use `fallthrough` to fall into the next case:
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."
// << 🔵 Run Point
//:
//: -------------------
//:
//: ### Labeled Statements
//:
//: In Swift, you can nest loops and conditional statements inside each other.
//:
//: It’s sometimes useful to be explicit about which loop your conditional should use.
//:
//: ![Diagram](snakesAndLadders_2x.png)
//:
//: Use labels to name a loop:
square = 0
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Early Exit
//:
//: Use a `guard` statement to ensure a condition is `true` for the code that follows it:
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }

    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Checking API Availability
//:
//: Use an availability condition in an `if` or `guard` statement:

if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: In addition to specifying major version numbers like iOS 8 or macOS 10.10, you can specify minor versions numbers like iOS 11.2.6 and macOS 10.13.3.
/*
if #available(platformName version, ..., *) {
    // statements to execute if the APIs are available
} else {
    // fallback statements to execute if the APIs are unavailable
}
*/
//:
//: -------------------
//:
//: A `guard` statement:
@available(macOS 10.12, *)
struct ColorPreference {
    var bestColor = "blue"
}

func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
        return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: An unavailability condition:
if #available(iOS 10, *) {
} else {
    // Fallback code
}

if #unavailable(iOS 10) {
    // Fallback code
}
// << 🔵 Run Point
//:
//: -------------------
//:
//: ## Original Source Documentation
//: To view the original page [click here - Control Flow](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow)
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

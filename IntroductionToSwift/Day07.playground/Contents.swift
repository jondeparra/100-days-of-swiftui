import Foundation

// MARK: How to reuse code with functions

func showWelcome() {
    print("Welcome to my app!")
    print("By default, this prints out a conversation")
    print("chart from centimeters to inchers, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

func printTimesTables(from: Int, through: Int = 12) {
    for i in 1...through {
        print("\(i) * \(from) is \(i * from)")
    }
}

printTimesTables(from: 5, through: 12)

// MARK: How to return values from functions

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

let string1 = "racecar"
let string2 = "carrace"

func hasSameLetters(_ i: String, _ j: String) -> Bool {
    return i.sorted() == j.sorted()
}

print(hasSameLetters(string1, string2))

func pythagoras(a: Double, b: Double) -> Double {
    return sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

func sayNothing() {
    return
}

// MARK: How to return multiple values from functions

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

func getUser1() -> [String] {
    ["Taylor", "Swift"]
}

let user1 = getUser1()
print("Name: \(user1[0]) \(user1[1])")

func getUser2() -> [String: String] {
    ["firstName": "Taylor", "lastName": "Swift"]
}

let user2 = getUser2()
print("Name: \(user2["firstName", default: "?"]) \(user2["lastName", default: "?"])")

func getUser3() -> (firstName: String, lastName: String) {
//    (firstName: "Taylor", lastName: "Swift")
    ("Taylor", "Swift")
}

let user3 = getUser3()
//print("Name: \(user3.firstName) \(user3.lastName)")
print("Name: \(user3.0) \(user3.1)")
//let firstName = user3.firstName
//let lastName = user3.lastName
let (firstName, lastName) = getUser3()
let fullName = "\(firstName) \(lastName)"
print(fullName)

// MARK: How to customize parameter labels

func rollDice(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()

    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

let lyric = "I see a red door and I want to paint it black."
print(lyric.hasPrefix("I see"))

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercase(string)

func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5)

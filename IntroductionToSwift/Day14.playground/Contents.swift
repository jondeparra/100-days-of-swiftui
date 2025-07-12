import Foundation

// MARK: How to handle missing data with optionals

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]

if let marrioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marrioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3: String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil

func squared(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let number = number {
    print(squared(number: number))
} else {
    print("There's no number.")
}

// MARK: How to unwrap optionals with guard

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input…")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}

var myVar: Int? = 3

if let unwrapped = myVar {
    // run if myVar has a value inside
}

//guard let unwrapped = myVar else {
    // run if myVar does NOT have a value inside (can only be used inside functions)
//}

// MARK: How to unwrap optionals with nil coalescing

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A" //, or
let new2 = captains["Serenity", default: "N/A"]

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number2 = Int(input) ?? 0
print(number2)

// MARK: How to handle multiple optionals using optional chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

var book2: Book? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"
print(author)

// MARK: How to handle function failure with optionals

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// MARK: Summary: Optionals

/*
 - Optionals let us represent the absence of data.
 - Everything that isn’t optional definitely has a value inside.
 - Unwrapping looks inside the optional: if there’s a value it’s sent back.
 - if let runs code if the optional has a value; guard let runs code if the optional doesn’t have a value.
 - ?? unwraps and returns an optional’s value, or a default value instead.
 - Optional chaining reads an optional inside another optional.
 - try? can convert throwing functions so they return an optional.
*/

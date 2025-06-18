import Foundation

// MARK: How to use type annotations

let surname: String = "Lasso"
var score: Double = 0 // explicitly states it's a Double instead of inferring as an Int

let playerName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true

var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set([
  "The Bluest Eye",
  "Foundation",
  "Girl, Woman, Other"
])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []

var clues = [String]() // preferred way to annotate is through type inference

enum UIStyle {
  case light, dark, system
}

var style = UIStyle.light
style = .dark

let username: String
// lots of complex logic
username = "@twostraws"
//username = "@taylorswift13" // not allowed
// lots more complex logic
print(username)

//let scores: Int = "Zero" // not allowed

// MARK: Summary: Complex data

/*
 - Arrays store many values, and read them using indices.
 - Dictionaries store many values, and ream them using keys we specify.
 - Sets stores many values, but we don't choose their order.
 - Enums create our own types to specify a range of acceptable values.
 - Swift uses type inference to figure what data we're storing.
 - It's also possible to use type annotation to force a particular type.
*/

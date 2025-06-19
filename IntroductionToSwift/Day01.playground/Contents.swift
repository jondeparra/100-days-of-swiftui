import Foundation

// MARK: How to create variables and constants

var greeting = "Hello, playground"

var name = "Ted"
name = "Rebecca"
name = "Keeley"

let character = "Daphne"
//character = "Eloise" // errors out
//character = "Francesca" // errors out

var playerName = "Roy"
print(playerName)
playerName = "Dani"
print(playerName)
playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

// MARK: How to create strings

let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

let quote = "The he tapped a sign saying \"Believe\" and walked away."

let movie = """
    A day in
    the life of an
    Apple engineer
    """

let nameLength = actor.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))

// MARK: How to store whole numbers

let score = 10
let reallyBig = 100_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter += 5
print(counter)
counter *= 2
counter -= 10
counter /= 2

let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

// MARK: How to store decimal numbers

let number2 = 0.1 + 0.2
print(number2)

let a = 1
let b = 2.0
//let c = a + b // throws error, can't mix Int or Double types
let c = Double(a) + b  //  works

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0

let int1 = 3

var name2 = "Nicolas Cage"
name2 = "John Travolta"
//name2 = 57 // throws error, can't convert types

var rating = 5.0
rating *= 2

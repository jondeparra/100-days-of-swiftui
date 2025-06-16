import Foundation

// MARK: How to store truth with Booleans

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// MARK: How to join strings together

let firstPart = "Hello, "
let secondPark = "world!"
let greeting = firstPart + secondPark
print(greeting)

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action

let luggageCode = "1" + "2" + "3" + "4"

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let number2 = 11
let missionMessage = "Apollo " + String(number2) + " landed on the moon."

print("5 x 5 is \(5 * 5)")

// MARK: Summary: Simple data

/*
 - Swift lets us create constants using let, and varaibles using var
 - Swift's strings contain text, from short strigns up to whole novels
 - You create strings by using double quotes at the start and end
 - Swift calls its whole numbers "integers", or Int
 - In Swift, decimal numbers are called Double
 - You can store a simple true or false using a Boolean, or Bool
 - String interpolation lets us place data into strings efficiently
*/

import Foundation

// MARK: Checkpoint 9

/*
 - Write a function that accepts an optional array of integers, and returns one randomly.
 - If the array is missing or empty, return a random number in the range 1 through 100.
 - Write your function in a single line of code.
*/

func getRandomInt(in arr: [Int]?) -> Int {
    return arr?.randomElement() ?? Int.random(in: 1...100)
}

func getRandomInt(in arr: [Int?]?) -> Int {
    lazy var random = Int.random(in: 1...100)
    return (arr?.randomElement() ?? random) ?? random
}

getRandomInt(in: nil)
getRandomInt(in: [1, 2, 3])
getRandomInt(in: [Int]())
getRandomInt(in: [nil])

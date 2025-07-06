import Foundation

// MARK: Checkpoint 4

/*
 Write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

 1. You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 2. If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 3. You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 4. If you can’t find the square root, throw a “no root” error.
 */

enum CustomError: Error {
    case tooLow, tooHigh, noRoot
}

func getIntSqrt(of number: Int) throws -> Int {
    if number < 1 { throw CustomError.tooLow }
    if number > 10_000 { throw CustomError.tooHigh }

    var low = 1
    var high = number

    while low <= high {
        let mid = (low + high) / 2
        let square = mid * mid

        if square == number {
            return mid
        } else if square < number {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }

    throw CustomError.noRoot
}

do {
    try getIntSqrt(of: 144)
    try getIntSqrt(of: 125)
    try getIntSqrt(of: 0)
} catch CustomError.noRoot {
    print("Number does not have an Int root")
} catch CustomError.tooLow {
    print("Number must be greater than 1")
} catch CustomError.tooHigh {
    print("Number must be less than 10,000")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

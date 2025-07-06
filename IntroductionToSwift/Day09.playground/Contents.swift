import Foundation

// MARK: How to create and use closures

func greetUser() {
    print("Hi there!")
}

greetUser()
//var greetCopy: () -> Void = greetUser // long-form way to create a copy
var greetCopy = greetUser
greetCopy()

let sayHello = { (name: String) -> String in
    return "Hi \(name)!"
}

sayHello("Jonathan")

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

let captainFirstTeam = team.sorted { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

print(captainFirstTeam)

// MARK: How to use trailing closures and shorthand syntax

let captainFirstTeam2 = team.sorted { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }

    return a < b
}

let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

// MARK: How to accept functions as parameters

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

let rolls = makeArray(size: 5) { Int.random(in: 1...20)}
print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 10, using: generateNumber)
print(newRolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work…")
} second: {
    print("This is the second work…")
} third: {
    print("This is the third work…")
}


// MARK: Summary: Closures

/*
 - You can copy functions in Swift.
 - You can create closures directly by assigning to a constant or variable.
 - Closure parameters and return value are declared inside their braces.
 - Functions are able to accept other functions as parameters.
 - Anywhere you can pass a function, you can also pass a closure.
 - When passing a closure as a function parameter, you don’t need to write out the types inside your closure if Swift can figure it out.
 - If a function’s final parameters are functions, use trailing closure syntax.
 - You can also use shorthand parameter names such as $0 and $1.
 - You can make your own functions that accept functions as parameters.
 */

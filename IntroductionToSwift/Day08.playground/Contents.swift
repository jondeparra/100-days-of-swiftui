import Foundation

// MARK: How to provide default values for parameters

func printTimesTable(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5, end: 20)
printTimesTable(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

// MARK: How to handle errors in functions

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "P@ssword1234!"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("Please use a less obvious password.")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

// MARK: Summary: Functions

/*
 - Functions reuse code by carving off chunks and giving it a name.
 - Functions start with the word func, followed by the function’s name.
 - Functions can accept parameters to control their behavior.
 - You can add custom external parameter names, or use _ to skip one.
 - Function parameters can have default values for common scenarios.
 - Functions can optionally return a value, but you can return multiple pieces of data from a function using a tuple.
 - Functions can throw errors using do, try, and catch.
 */

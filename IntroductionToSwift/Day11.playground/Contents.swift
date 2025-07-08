import Foundation

// MARK: How to limit access to internal data using access control

struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

//account.funds -= 1000 // not allowed because of the private(set) keyword in line 6

/*
 - private: don't let anything outside the struct use this.
 - fileprivate: don't let anything outside the current file use this.
 - public: let anyone, anywhere use this.
 - private(set): let anyone read this property, but only let my internal methods write to it.
 */

// MARK: Static properties and methods

struct School {
    @MainActor static var studentCount = 0

    @MainActor static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

/*
 - self: The current value of a struct.
 - Self: The current type of a struct.
 */

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://hackingwithswift.com"
}

print(AppData.version)

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "h4irf0rce0ne")
}

print(Employee.example)

// MARK: Summary: Structs

/*
 - You can create your own structs using the struct keyword.
 - Structs can have their own properties and methods.
 - If a method modifies properties of its struct, it must be mutating.
 - Structs can have stored properties and computed properties.
 - We can attach didSet and willSet property observers to properties.
 - Swift generates an initializer for all structs using their property names.
 - You can create custom initializers to override Swift’s default.
 - Access control limits what code can use properties and methods.
 - Static properties and methods are attached directly to a struct.
 */

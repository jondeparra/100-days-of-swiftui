import Foundation

// MARK: How to create your own classes

/*
 Difference between structs and classes:

 - Classes do not come with synthesized memberwise initializers.
 - One class can be built upon (“inherit from”) another class, gaining its properties and methods.
 - Copies of structs are always unique, whereas copies of classes actually point to the same shared data.
 - Classes have deinitializers, which are methods that are called when an instance of the class is destroyed, but structs do not.
 - Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot.
*/

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// MARK: How to make one class inherit from another

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }

    func printSummary() {
        print("I work \(hours) hours per day.")
    }
}

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }

    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours per day, but other times will spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

// MARK: How to add initializers for classes

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool // if this has a default value it doesn't need a custom initializer

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// MARK: How to copy classes

class User {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

var user3 = User()
var user4 = user1.copy()
user4.username = "Jonathan"

print(user3.username)
print(user4.username)

// MARK: How to create a deinitializer for a class

class User2 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [User2]()

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control…")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

// MARK: How to work with variables inside classes

class User3 {
    var name = "Paul"
}

let user = User3()
user.name = "Taylor"
print(user.name)

var user5 = User3()
user5.name = "John"
user5 = User3()
print(user5.name)

/*
 - Constant instance, constant property – a signpost that always points to the same user, who always has the same name.
 - Constant instance, variable property – a signpost that always points to the same user, but their name can change.
 - Variable instance, constant property – a signpost that can point to different users, but their names never change.
 - Variable instance, variable property – a signpost that can point to different users, and those users can also change their names.
*/

// MARK: Summary: Classes

/*
 - Classes have lots of things in common with structs.
 - Classes can inherit from other classes, so they get access to the properties and methods of their parent.
 - Swift doesn’t generate a memberwise initializer for classes.
 - Copies of a class instance point to the same instance.
 - Classes run deinitializers when the last copy of an instance is destroyed.
 - You can change variable properties inside constant class instances.
*/

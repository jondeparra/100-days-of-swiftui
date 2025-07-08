import Foundation

// MARK: Checkpoint 6

/*
 - Create a struct to store information about a car. Include:
    - Its model
    - Number of seats
    - Current gear
 - Add a method to change gears up or down
 - Consider variable mutability and access control
 - Don't allow invalid gears, 1...6 seems like a godo range
 */

struct Car {
    let make: String
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int {
        willSet {
            print("Shifting from gear \(currentGear) to \(newValue)")
        }
    }

    mutating func shiftGear(to gear: Int) {
        guard (1...6).contains(gear) else {
            print("You can only shift from gears 1 through 6")
            return
        }

        if gear == currentGear {
            print("You're already in gear \(gear)")
        } else {
            currentGear = gear
        }
    }
}

var myCar = Car(make: "Tesla", model: "Model 3", numberOfSeats: 5, currentGear: 3)
myCar.shiftGear(to: 3)
myCar.shiftGear(to: 5)
myCar.shiftGear(to: 0)
myCar.shiftGear(to: 8)

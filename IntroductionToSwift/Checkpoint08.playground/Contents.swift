import Foundation

// MARK: Checkpoint 8

/*
 Make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

 - A property storing how many rooms it has.
 - A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
 - A property storing the name of the estate agent responsible for selling the building.
 - A method for printing the sales summary of the building, describing what it is along with its other properties.
*/

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var agentName: String { get set }

    func salesSummary()
}

extension Building {
    func salesSummary() {
        print(
            "This \(String(describing: type(of: self)).lowercased()) has \(rooms) rooms and costs \(cost.formatted(.currency(code: "USD").presentation(.narrow))). Contact \(agentName) for more information."
        )
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
}

let house = House(rooms: 3, cost: 400_000, agentName: "Swift Development LLC")
let office = Office(rooms: 10, cost: 2_250_000, agentName: "Swift Inc")
house.salesSummary()
office.salesSummary()

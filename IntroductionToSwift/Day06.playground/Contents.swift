import Foundation

// MARK: How to use a for loop to repeat work

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os)")
}

for i in 1...12 {
    print("The \(i) times table")

    for j in 1...12 {
        print("   \(j) x \(i) is \(j * i)")
    }

    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

// MARK: How to use a while loop to repeat work

var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("Critical hit!")

// MARK: How to skip loop items with break and continue

let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in filenames {
    if filename.hasPrefix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14

var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// MARK: Summary: Conditions and loops

/*
 - We use if, else, and else if statements to check conditions.
 - You can combine conditions using || and &&.
 - switch statements can be easier than using if and else if a lot, and Swift will check that they are exhaustive.
 - The ternary conditional operator lets us check WTF: What?, True, False.
 - for loops let us loop over arrays, sets, dictionaries, and ranges.
 - while loops create loops that continue running until a condition is false.
 - We can skip loop items using continue or break respectively.
 */

import Foundation

// MARK: Checkpoint 2

/*
 - Create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.
 */

let familyBirthDays = [26, 8, 12, 15, 8]
print(familyBirthDays.count)
let uniqueBirthdDays = Set(familyBirthDays)
print(uniqueBirthdDays.count)

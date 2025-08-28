//
//  ContentView.swift
//  Project05-WordScramble
//
//  Created by Jonathan Parra on 8/27/25.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leie", "Luke", "Rey"]
    var body: some View {
        List {
            Section("People") {
                ForEach(people, id: \.self) {
                    Text($0)
                }
            }

            Section("Static section") {
                Text("Static row 1")
                Text("Static row 2")
            }

            Section("Dynamic section") {
                ForEach(1..<5) {
                    Text("Dynamic Row \($0)")
                }
            }

            Section("Static section") {
                Text("Static row 3")
                Text("Static row 4")
            }
        }
        .listStyle(.grouped)
    }

    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
            }
        }
    }

    func testStrings() {
        let input = "a b c"
        let letters = input.components(separatedBy: .whitespacesAndNewlines)
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func testStrings2() {
        let word = "swift"
        let checker = UITextChecker()

        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        let allGodo = misspelledRange.location == NSNotFound
    }
}

#Preview {
    ContentView()
}

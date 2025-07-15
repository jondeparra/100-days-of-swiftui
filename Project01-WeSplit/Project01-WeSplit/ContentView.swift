//
//  ContentView.swift
//  Project01-WeSplit
//
//  Created by Jonathan Parra on 7/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Text("Hello, world!")
            }
            .navigationTitle("WeSplit")
            .toolbarTitleDisplayMode(.inlineLarge)
        }
    }
}

#Preview {
    ContentView()
}

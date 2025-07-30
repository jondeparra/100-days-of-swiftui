//
//  ContentView.swift
//  Project02-GuessTheFlag
//
//  Created by Jonathan Parra on 7/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("This is a VStack")
            }
            .padding()

            HStack(alignment: .center) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("This is an HStack")
            }
            .padding()

            ZStack {
                Color(red: 0.5, green: 0.8, blue: 0.6)
                    .frame(width: 200, height: 200)
                Text("This is a ZStack")
            }
            .padding()

            ZStack {
                LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 200, height: 200)

                Text("This is a gradient")
                    .foregroundStyle(.white)
            }
            .padding()

            VStack {
                Button("Add element") {
                    showingAlert = true
                }
                    .buttonStyle(.borderedProminent)

                Button("Delete selection", role: .destructive) { }
                    .buttonStyle(.bordered)

                Button("Edit element") { }
                    .buttonStyle(.bordered)
            }
            .padding()
        }
        .alert("This is an alert", isPresented: $showingAlert) {
            Button("Okay") { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("You can add a title and body message to an alert.")
        }
    }
}

#Preview {
    ContentView()
}

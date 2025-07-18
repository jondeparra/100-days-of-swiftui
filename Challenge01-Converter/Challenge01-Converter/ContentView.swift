//
//  ContentView.swift
//  Challenge01-Converter
//
//  Created by Jonathan Parra on 7/17/25.
//

import SwiftUI

struct ContentView: View {
    @State private var converterType = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NavigationHeader()
                ScrollView {
                    // conversion input & output
                }
                .background(.red)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct NavigationHeader: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Text("Converter")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Spacer()

                Button {
                    // change conversion type
                } label: {
                    Text("Select")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)
            .background(.green)
        }
        .navigationBarHidden(true)
    }
}

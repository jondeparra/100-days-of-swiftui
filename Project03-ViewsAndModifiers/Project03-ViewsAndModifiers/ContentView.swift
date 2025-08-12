//
//  ContentView.swift
//  Project03-ViewsAndModifiers
//
//  Created by Jonathan Parra on 8/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false

    var motto1: some View {
        Text("Fraco dormiens")
    }

    let motto2 = Text("nunquam titillandus")

    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }

    var body: some View {
        ScrollView {
            // What is behind the main SwiftUI view?
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)

            // Why modifier order matters
            Button("Hello, world") {
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(.red)

            // Conditional modifiers
            Button("Hello, world!") {
                useRedText.toggle()
            }
            .foregroundStyle(useRedText ? .red : .blue)
            .buttonStyle(.plain)

            // Views as properties
            VStack {
                motto1
                    .foregroundStyle(.red)

                motto2
                    .foregroundStyle(.blue)
            }
            .padding()

            // View composition
            CapsuleText(text: "First")
            CapsuleText(text: "Second")

            // Custom modifiers
            Text("Hello, world")
                .modifier(Title())

            Text("Hello, world")
                .titleStyle()

            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")

            // Custom containers
            GridStack(rows: 4, columns: 4) { row, col in
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }

            // Day 24
            VStack {
                Text("My custom title")
                    .title()
            }
            .padding(.top, 24)
        }
    }
}

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content

            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundStyle(.primary)
            .fontDesign(.rounded)
    }
}

extension View {
    func title() -> some View {
        modifier(TitleModifier())
    }
}

#Preview {
    ContentView()
}

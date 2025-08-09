//
//  ContentView.swift
//  Project02-GuessTheFlag
//
//  Created by Jonathan Parra on 7/30/25.
//

import SwiftUI

// MARK: - Game State Model
class GameState: ObservableObject {
    static let allCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]

    @Published var countries = allCountries.shuffled()
    @Published var correctAnswer = Int.random(in: 0...2)
    @Published var currentScore = 0
    @Published var questionsAnswered = 0

    let totalRounds = 8

    var isGameOver: Bool {
        questionsAnswered >= totalRounds
    }

    func nextQuestion() {
        countries.remove(at: correctAnswer)
        questionsAnswered += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func resetGame() {
        currentScore = 0
        questionsAnswered = 0
        countries = Self.allCountries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }

    func checkAnswer(selectedAnswer: Int) -> Bool {
        let isCorrect = selectedAnswer == correctAnswer
        if isCorrect {
            currentScore += 1
        }
        return isCorrect
    }
}

// MARK: - Background Component
struct GameBackground: View {
    var body: some View {
        RadialGradient(
            stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ],
            center: .top,
            startRadius: 200,
            endRadius: 700
        )
        .ignoresSafeArea()
    }
}

// MARK: - Flag Button Component
struct FlagButton: View {
    let country: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(country)
                .clipShape(Capsule())
                .shadow(radius: 5)
        }
    }
}

// MARK: - Game Header Component
struct GameHeader: View {
    let targetCountry: String

    var body: some View {
        VStack {
            Text("Tap the flag of")
                .font(.subheadline)
                .fontWeight(.medium)

            Text(targetCountry)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .foregroundStyle(.white)
    }
}

// MARK: - Score Display Component
struct ScoreDisplay: View {
    let currentScore: Int
    let questionsAnswered: Int
    let totalRounds: Int

    var body: some View {
        VStack {
            Text("Score: \(currentScore)")

            Text("Question \(questionsAnswered + 1)/\(totalRounds)")
        }
        .font(.title2.bold())
        .foregroundStyle(.white)
    }
}

// MARK: - Main Content View
struct ContentView: View {
    @StateObject private var gameState = GameState()
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var isGameOver = false

    var body: some View {
        ZStack {
            GameBackground()

            VStack {
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                Spacer()

                VStack(spacing: 15) {
                    GameHeader(targetCountry: gameState.countries[gameState.correctAnswer])

                    ForEach(0..<3, id: \.self) { number in
                        FlagButton(country: gameState.countries[number]) {
                            flagTapped(number)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(30)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))

                Spacer()

                ScoreDisplay(
                    currentScore: gameState.currentScore,
                    questionsAnswered: gameState.questionsAnswered,
                    totalRounds: gameState.totalRounds
                )

                Spacer()
                Spacer()
            }
            .padding(.horizontal, 30)
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if isGameOver {
                Button("New Game") { newGame() }
            } else {
                Button("Continue") { nextQuestion() }
            }
        } message: {
            Text(scoreMessage)
        }
    }

    // MARK: - Game Logic
    private func flagTapped(_ selectedAnswer: Int) {
        let isCorrect = gameState.checkAnswer(selectedAnswer: selectedAnswer)

        // Check if this was the last question
        let isLastQuestion = gameState.questionsAnswered + 1 >= gameState.totalRounds

        if isCorrect {
            scoreTitle = "Correct!"
            scoreMessage = "Well done!"
        } else {
            let needsThe = ["UK", "US"]
            let correctCountry = gameState.countries[gameState.correctAnswer]
            let selectedCountry = gameState.countries[selectedAnswer]
            scoreTitle = "Wrong!"
            if needsThe.contains(selectedCountry) {
                scoreMessage = "The flagged you tapped was the \(selectedCountry)."
            } else {
                scoreMessage = "The flagged you tapped was \(selectedCountry)."
            }
        }

        if isLastQuestion {
            isGameOver = true
            scoreTitle = "Game Over!"
            scoreMessage = "Final Score: \(gameState.currentScore)/\(gameState.totalRounds)"
        }

        showingScore = true
    }

    private func nextQuestion() {
        gameState.nextQuestion()
    }

    private func newGame() {
        isGameOver = false
        gameState.resetGame()
    }
}

#Preview {
    ContentView()
}

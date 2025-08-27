//
//  ContentView.swift
//  Project04-BetterRest
//
//  Created by Jonathan Parra on 8/18/25.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Self.defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false

    private var sleepTime: Date? {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            return wakeUp - prediction.actualSleep
        } catch {
            print("There was a calculation error.")
            return nil
        }
    }

    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please select a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                }

                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }

                Section("Daily coffee intake") {
                    Picker("Coffee amount", selection: $coffeeAmount) {
                        ForEach(1..<21) { amount in
                            Text("^[\(amount) cup](inflect: true)")
                                .tag(amount)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("BetterRest")
            .toolbarTitleDisplayMode(.inlineLarge)
            .safeAreaInset(edge: .bottom) {
                if let sleepTime {
                    VStack {
                        Text("Your ideal bedtime is…")
                        Text(sleepTime.formatted(date: .omitted, time: .shortened))
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                } else {
                    Text("There was a calculation error…")
                }
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Project01-WeSplit
//
//  Created by Jonathan Parra on 7/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool

    let tipPercentages = [10, 15, 20, 25, 0]
    let localCurrency = Locale.current.currency?.identifier ?? "USD"

    var totalPerPerson: Double {
        return grandTotal / Double(numberOfPeople + 2)
    }

    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return checkAmount + tipValue
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: localCurrency))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<9) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }

                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: localCurrency))
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 8) {
                    Text("Grand Total")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text(grandTotal, format: .currency(code: localCurrency))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(tipPercentage == 0 ? .red : .primary)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
            }
            .navigationTitle("WeSplit")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

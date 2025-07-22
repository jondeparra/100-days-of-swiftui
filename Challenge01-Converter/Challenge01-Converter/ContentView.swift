//
//  ContentView.swift
//  Challenge01-Converter
//
//  Created by Jonathan Parra on 7/17/25.
//

import SwiftUI
import Foundation

enum ConversionType: String, CaseIterable {
    case temperature = "Temperature"
    case length = "Length"
    case time = "Time"
    case mass = "Mass"

    var units: [Dimension] {
        switch self {
        case .temperature:
            return [UnitTemperature.fahrenheit, UnitTemperature.celsius, UnitTemperature.kelvin]
        case .length:
            return [UnitLength.feet, UnitLength.kilometers, UnitLength.meters, UnitLength.miles, UnitLength.yards]
        case .time:
            return [UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours, UnitDuration(symbol: "days", converter: UnitConverterLinear(coefficient: 86400))]
        case .mass:
            return [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds]
        }
    }
    
    var unitNames: [String] {
        switch self {
        case .temperature:
            return ["Fahrenheit", "Celsius", "Kelvin"]
        case .length:
            return ["Feet", "Kilometers", "Meters", "Miles", "Yards"]
        case .time:
            return ["Seconds", "Minutes", "Hours", "Days"]
        case .mass:
            return ["Grams", "Kilograms", "Ounces", "Pounds"]
        }
    }
    
    func unitName(for index: Int, value: Double) -> String {
        let names = unitNames
        guard index < names.count else { return "" }
        
        let pluralName = names[index]
        
        if abs(value) == 1.0 {
            switch self {
            case .temperature:
                return pluralName // Temperature units don't change (Fahrenheit, Celsius, Kelvin)
            case .length:
                let singular = ["Foot", "Kilometer", "Meter", "Mile", "Yard"]
                return singular[index]
            case .time:
                let singular = ["Second", "Minute", "Hour", "Day"]
                return singular[index]
            case .mass:
                let singular = ["Gram", "Kilogram", "Ounce", "Pound"]
                return singular[index]
            }
        }
        
        return pluralName
    }
}

struct FieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minHeight: 32)
            .keyboardType(.decimalPad)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(.background)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray.opacity(0.3), lineWidth: 1)
            )
            .contentTransition(.numericText())
    }
}

extension View {
    func fieldStyle() -> some View {
        modifier(FieldStyle())
    }
}

struct ContentView: View {
    @FocusState private var inputFocused: Bool
    @FocusState private var outputFocused: Bool
    @State private var input = ""
    @State private var outputText = ""
    @State private var selectedConversionType: ConversionType = .temperature
    @State private var selectedInputUnit = 0
    @State private var selectedOutputUnit = 1
    @State private var showingConversionPicker = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NavigationHeader(selectedConversionType: $selectedConversionType, showingConversionPicker: $showingConversionPicker)
                VStack(alignment: .leading) {
                    Text(selectedConversionType.rawValue)
                        .contentTransition(.numericText())
                        .animation(.easeInOut(duration: 0.1), value: selectedConversionType)
                        .font(.title3)
                        .fontWeight(.semibold)

                    Spacer()
                        .frame(height: 24)

                    Section("Input") {
                        VStack(alignment: .leading) {
                            TextField("Enter value", text: $input)
                                .fieldStyle()
                                .focused($inputFocused)
                                .animation(.easeInOut(duration: 0.3), value: input)
                                .onChange(of: input) {
                                    if !outputFocused {
                                        calculateConversion()
                                    }
                                }
                            
                            Picker("Input Unit", selection: $selectedInputUnit) {
                                ForEach(0..<selectedConversionType.unitNames.count, id: \.self) { index in
                                    Text(selectedConversionType.unitNames[index]).tag(index)
                                }
                            }
                            .onChange(of: selectedInputUnit) {
                                if !outputFocused {
                                    calculateConversion()
                                } else {
                                    calculateReverseConversion()
                                }
                            }
                        }
                    }

                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                swapInputOutput()
                            }
                        }) {
                            Image(systemName: "arrow.up.arrow.down")
                                .font(.title3)
                                .foregroundStyle(.blue)
                        }
                        .buttonStyle(.plain)
                        Spacer()
                    }
                    .padding(.vertical, 8)

                    Section("Output") {
                        VStack(alignment: .leading) {
                            TextField("Result", text: $outputText)
                                .fieldStyle()
                                .focused($outputFocused)
                                .animation(.easeInOut(duration: 0.3), value: outputText)
                                .onChange(of: outputText) {
                                    if outputFocused {
                                        calculateReverseConversion()
                                    }
                                }
                            
                            Picker("Output Unit", selection: $selectedOutputUnit) {
                                ForEach(0..<selectedConversionType.unitNames.count, id: \.self) { index in
                                    Text(selectedConversionType.unitNames[index]).tag(index)
                                }
                            }
                            .onChange(of: selectedOutputUnit) {
                                if !outputFocused {
                                    calculateConversion()
                                } else {
                                    calculateReverseConversion()
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.horizontal)
                .padding(.top, 16)
            }
            .containerRelativeFrame([.horizontal, .vertical], alignment: .topLeading)
        }
        .onChange(of: selectedConversionType) {
            selectedInputUnit = 0
            selectedOutputUnit = 1
            input = ""
            outputText = ""
        }
    }
    
    func calculateConversion() {
        guard let inputValue = Double(input) else {
            outputText = ""
            return
        }
        
        let inputUnit = selectedConversionType.units[selectedInputUnit]
        let outputUnit = selectedConversionType.units[selectedOutputUnit]
        
        let measurement = Measurement(value: inputValue, unit: inputUnit)
        let result = measurement.converted(to: outputUnit).value
        outputText = String(format: "%.1f", result)
    }
    
    func calculateReverseConversion() {
        guard let outputValue = Double(outputText) else {
            input = ""
            return
        }
        
        let inputUnit = selectedConversionType.units[selectedInputUnit]
        let outputUnit = selectedConversionType.units[selectedOutputUnit]
        
        let measurement = Measurement(value: outputValue, unit: outputUnit)
        let result = measurement.converted(to: inputUnit).value
        input = String(format: "%.1f", result)
    }
    
    func swapInputOutput() {
        let tempInput = input
        let tempUnit = selectedInputUnit
        
        input = outputText
        selectedInputUnit = selectedOutputUnit
        
        outputText = tempInput
        selectedOutputUnit = tempUnit
    }
}

#Preview {
    ContentView()
}

struct NavigationHeader: View {
    @Binding var selectedConversionType: ConversionType
    @Binding var showingConversionPicker: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Text("Converter")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Spacer()

                Menu {
                    Picker("Conversion Type", selection: $selectedConversionType) {
                        ForEach(ConversionType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                } label: {
                    Image(systemName: "gear")
                        .foregroundStyle(.secondary)
                        .font(.title)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
        }
        .background(.background)
        .shadow(color: .init(.systemGray5), radius: 0, x: 0, y: 1)
        .navigationBarHidden(true)
    }
}

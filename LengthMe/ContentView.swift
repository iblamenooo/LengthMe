//
//  ContentView.swift
//  LengthMe
//
//  Created by Nurtore on 26.09.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var inputUnit: String = "Celsius"
    @FocusState private var amountIsFocused : Bool
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]

    var celsius: Double {
        switch inputUnit {
        case "Celsius":
            return inputValue
        case "Fahrenheit":
            return (inputValue - 32) * 5/9
        case "Kelvin":
            return inputValue - 273.15
        default:
            return 0
        }
    }
    
    var fahrenheit: Double {
        (celsius * 9/5) + 32
    }
    
    var kelvin: Double {
        celsius + 273.15
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose input unit") {
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Enter value") {
                    TextField("Temperature", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section("Converted values") {
                    Text("Celsius: \(celsius, specifier: "%.2f") °C")
                    Text("Fahrenheit: \(fahrenheit, specifier: "%.2f") °F")
                    Text("Kelvin: \(kelvin, specifier: "%.2f") K")
                }
            }
            .navigationTitle("Temperature Converter")
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

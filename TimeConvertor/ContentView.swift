//
//  ContentView.swift
//  TimeConvertor
//
//  Created by Amay Raj Srivastav on 08/09/26.
//

import SwiftUI

struct ContentView: View {
    let units = ["seconds", "minutes", "hours", "days"]
    @State private var inputUnit = "minutes"
    @State private var outputUnit = "seconds"
    @State private var input: Int = 0
    @FocusState private var isInputFocused: Bool
    
    var result: Int{
        return convertToBaseUnit(input, inUnit: inputUnit, outUnit: outputUnit)
        
    }
    
    var body: some View {
        
        NavigationStack{
            Form{
                Section("Input Unit"){
                    Picker("Input Unit", selection: $inputUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output Unit"){
                    Picker("Input Unit", selection: $outputUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Input Value"){
                    TextField("Enter here...", value: $input, format: .number)
                        .keyboardType(.numberPad)
                        .focused($isInputFocused)
                }
                
                Section("Output Value"){
                    Text(result, format: .number)
                }
            }
            .navigationTitle("Time Convertor")
            .toolbar {
                if isInputFocused{
                    Button("Done"){
                        isInputFocused = false
                    }
                }
            }
        }
    }
    
    func convertToBaseUnit(_ value: Int, inUnit: String, outUnit: String) -> Int{
        
        var baseValue = 0
        
        switch inUnit{
        case "seconds":
            baseValue = value
        case "minutes":
            baseValue = value * 60
        case "hours":
            baseValue = value * 60 * 60
        case "days":
            baseValue = value * 24 * 60 * 60
        default:
            baseValue = 0
        }
        
        return convertToDesiredUnit(baseValue, unit: outUnit)
    }
    
    func convertToDesiredUnit(_ value: Int, unit: String) -> Int{
        
        var outValue = 0
        
        switch unit{
            case "seconds":
                outValue = value
            case "minutes":
                outValue = value / 60
            case "hours":
                outValue = value / (60 * 60)
            case "days":
                outValue = value / (60 * 60 * 24)
            default:
                outValue = 0
        }
        return outValue
    }
}

#Preview {
    ContentView()
}

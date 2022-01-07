//
//  TemperatureConversionView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/5/22.
//

import SwiftUI

struct TemperatureConversionView: View {
    @State var inputTemperature: Double = 0
    @FocusState var inputTemperatureIsFocused: Bool
    let typesOfTemperatures: [String] = ["˚C", "˚F"]
    @State var selectedTemperatureType: Int = 0
    
    var outputTempAndUnitTuple: (String, String) {
        if selectedTemperatureType == 0 {
            return (String((inputTemperature * 1.8) + 32), "˚F")
        } else if selectedTemperatureType == 1 {
            return (String((inputTemperature - 32) / (1.8)), "˚C")
        } else {
            return ("Error", "")
        }
    }
    
    var body: some View {
        Form {
            //InputView(conversionType: "Temperature", possibleConversionTypes: typesOfTemperatures, userInput: $inputTemperature, userSelectedConversion: $selectedTemperatureType)
            Section {
                Picker("Type of Temperature", selection: $selectedTemperatureType) {
                    ForEach(0..<typesOfTemperatures.count) { index in
                        Text(String(typesOfTemperatures[index]))
                    }
                }.pickerStyle(.segmented)
                TextField("Enter a Temperature", value: $inputTemperature, format: .number).keyboardType(.decimalPad).focused($inputTemperatureIsFocused)
            } header: {
                Text("Enter a temperature")
            }
            
            SimpleOutputView(output: outputTempAndUnitTuple.0, withUnit: outputTempAndUnitTuple.1)
            
        }.navigationBarTitle("Temperature Converter").navigationBarTitleDisplayMode(.inline).toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputTemperatureIsFocused = false
                    }
                }
            }
    }
}

struct TemperatureConversionView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureConversionView()
    }
}

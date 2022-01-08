//
//  TemperatureConversionView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/5/22.
//

import SwiftUI

struct TemperatureConversionView: View {
    let temperatureTypes: [String] = ["˚C", "˚F"]
    @State var temperatureInput: Double = 0
    @FocusState var temperatureInputIsFocused: Bool
    @State var inputSelection: Int = 0
    
    var outputTemp: String {
        if inputSelection == 0 {
            return "\(String((temperatureInput * 1.8) + 32)) ˚F"
        } else if inputSelection == 1 {
            return "\(String((temperatureInput - 32) / (1.8))) ˚C"
        } else {
            return "Error"
        }
    }
    
    var body: some View {
        Form {
            InputView(conversionType: "Temperature", possibleConversionTypes: temperatureTypes, userInput: $temperatureInput, userInputFocus: _temperatureInputIsFocused, userSelectedConversion: $inputSelection)
            
            OutputView(output: outputTemp, types: temperatureTypes, outputSelection: .constant(0), hasOutputPicker: false)
            
        }.navigationBarTitle("Temperature Converter").navigationBarTitleDisplayMode(.inline).toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        temperatureInputIsFocused = false
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

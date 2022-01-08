//
//  TimeConversionView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/5/22.
//

import SwiftUI

struct TimeConversionView: View {
    let timeTypes: [String] = ["seconds", "minutes", "hours", "days"]
    @State var timeInput: Double = 60
    @FocusState var timeInputFocused: Bool
    @State var inputSelection: Int = 0
    @State var outputSelection: Int = 1
    
    var outputTime: String {
        var output: Double
        let outputUnit = timeTypes[outputSelection]
        
        if inputSelection == outputSelection {
            output = timeInput
        } else {
            var timeInSeconds: Double = 0
            
            switch inputSelection {
            case 0:
                timeInSeconds = timeInput
            case 1: // minutes
                timeInSeconds = timeInput * 60
            case 2: // hours
                timeInSeconds = timeInput * 3600
            case 3: // days
                timeInSeconds = timeInput * 86400
            default:
                print("Something went wrong")
            }
            
            switch outputSelection {
            case 0: // seconds
                output = timeInSeconds
            case 1: // minutes
                output = timeInSeconds / 60
            case 2: // hours
                output = timeInSeconds / 3600
            case 3: // days
                output = timeInSeconds / 86400
            default:
                return "Error"
            }
        }
        return "\(output) \(outputUnit)"
    }
    
    var body: some View {
        Form {
            InputView(conversionType: "Time", possibleConversionTypes: timeTypes, userInput: $timeInput, userInputFocus: _timeInputFocused, userSelectedConversion: $inputSelection)
            
            OutputView(output: outputTime, types: timeTypes, outputSelection: $outputSelection, hasOutputPicker: true)
        }.navigationTitle("Time Converter").navigationBarTitleDisplayMode(.inline).toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    timeInputFocused = false
                }
            }
        }
    }
}

struct TimeConversionView_Previews: PreviewProvider {
    static var previews: some View {
        TimeConversionView()
    }
}

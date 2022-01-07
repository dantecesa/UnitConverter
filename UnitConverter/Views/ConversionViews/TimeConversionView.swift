//
//  TimeConversionView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/5/22.
//

import SwiftUI

struct TimeConversionView: View {
    @State var inputTime: Double = 60
    @FocusState var inputTimeFocused: Bool
    let timeTypes: [String] = ["seconds", "minutes", "hours", "days"]
    @State var inputTimeType: Int = 0
    @State var outputTimeType: Int = 1
    
    var outputTime: String {
        var output: Double
        let outputUnit = timeTypes[outputTimeType]
        
        if inputTimeType == outputTimeType {
            output = inputTime
        } else {
            var timeInSeconds: Double = 0
            
            switch inputTimeType {
            case 0:
                timeInSeconds = inputTime
            case 1: // minutes
                timeInSeconds = inputTime * 60
            case 2: // hours
                timeInSeconds = inputTime * 3600
            case 3: // days
                timeInSeconds = inputTime * 86400
            default:
                print("Something went wrong")
            }
            
            switch outputTimeType {
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
            InputView(conversionType: "Time", possibleConversionTypes: timeTypes, userInput: $inputTime, userInputFocus: _inputTimeFocused, userSelectedConversion: $inputTimeType)
            
            ComplexOutputView(output: outputTime, types: timeTypes, outputSelection: $outputTimeType)
            
        }.navigationTitle("Time Converter").navigationBarTitleDisplayMode(.inline).toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    inputTimeFocused = false
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

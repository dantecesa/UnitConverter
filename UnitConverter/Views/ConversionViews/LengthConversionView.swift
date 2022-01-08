//
//  LengthConversionView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/5/22.
//

import SwiftUI

struct LengthConversionView: View {
    var conversionTypes: [String] = ["meters", "km", "feet", "yards", "miles"]
    @State var lengthInput: Double = 10
    @FocusState var lengthInputFocused: Bool
    @State var inputSelection: Int = 1
    @State var outputSelection: Int = 0
    
    var outputLength: String {
        var output: Double
        let outputUnit: String = conversionTypes[outputSelection]
               
        if inputSelection == outputSelection {
            output = lengthInput
        } else {
            var lengthInMeters: Double = 0
            
            switch inputSelection {
            case 0:
                lengthInMeters = lengthInput
            case 1:
                lengthInMeters = lengthInput * 1000
            case 2:
                lengthInMeters = lengthInput / 3.2808398950131
            case 3:
                lengthInMeters = lengthInput / 1.0936132983377
            case 4:
                lengthInMeters = lengthInput / 0.00062137119223733
            default:
                return "Error"
            }
            
            switch outputSelection {
            case 0:
                output = lengthInMeters
            case 1:
                output = lengthInMeters / 1000
            case 2:
                output = lengthInMeters * 3.2808398950131
            case 3:
                output = lengthInMeters * 1.0936132983377
            case 4:
                output = lengthInMeters * 0.00062137119223733
            default:
                return "Error"
            }
        }
        return "\(output.formatted(.number)) \(outputUnit)"
    }
    
    var body: some View {
        Form {
            InputView(conversionType: "Length", possibleConversionTypes: conversionTypes, userInput: $lengthInput, userInputFocus: _lengthInputFocused, userSelectedConversion: $inputSelection)
            
            OutputView(output: outputLength, types: conversionTypes, outputSelection: $outputSelection, hasOutputPicker: true)
        }.navigationTitle("Length Converter").navigationBarTitleDisplayMode(.inline).toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    lengthInputFocused = false
                }
            }
        }
    }
}

struct LengthConversionView_Previews: PreviewProvider {
    static var previews: some View {
        LengthConversionView()
    }
}

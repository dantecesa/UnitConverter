//
//  VolumeConversionView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/6/22.
//

import SwiftUI

/*
 milliliters, liters, cups, pints, or gallons
 */

struct VolumeConversionView: View {
    @State var volumeInput: Double = 1
    @FocusState var volumeInputFocused: Bool
    var volumeTypes: [String] = ["milliliters", "liters", "cups", "pints", "gallons"]
    @State var volumeInputSelection: Int = 1
    @State var volumeOutputSelection: Int = 2
    var volumeOutput: String {
        var output: Double
        let outputUnit = volumeTypes[volumeOutputSelection]
        
        if volumeInputSelection == volumeOutputSelection {
            output = volumeInput
        } else {
            var volumeinMl: Double = 0
            
            switch volumeInputSelection {
            case 0:
                volumeinMl = volumeInput
            case 1: // liters
                volumeinMl = volumeInput * 1000
            case 2: // cups
                volumeinMl = volumeInput / 0.0042267528377304
            case 3: // pints
                volumeinMl = volumeInput / 0.0021133764188652
            case 4: // gallons
                volumeinMl = volumeInput / 0.00026417205235815
            default:
                print("Something went wrong")
            }
            
            switch volumeOutputSelection {
            case 0: // milileters
                output = volumeinMl
            case 1: // liters
                output = volumeinMl / 1000
            case 2: // cups
                output = volumeinMl * 0.0042267528377304
            case 3: // pints
                output = volumeinMl * 0.0021133764188652
            case 4: // gallons
                output = volumeinMl * 0.00026417205235815
            default:
                return "Error"
            }
        }
        return "\(output) \(outputUnit)"

    }
    
    var body: some View {
        Form {
            InputView(conversionType: "Volume", possibleConversionTypes: volumeTypes, userInput: $volumeInput, userInputFocus: _volumeInputFocused, userSelectedConversion: $volumeInputSelection)
            
            ComplexOutputView(output: volumeOutput, types: volumeTypes, outputSelection: $volumeOutputSelection)
            
        }.navigationTitle("Volume Converter").navigationBarTitleDisplayMode(.inline).toolbar {
            ToolbarItemGroup (placement: .keyboard) {
                Spacer()
                Button("Done") {
                    volumeInputFocused = false
                }
            }
        }
    }
}

struct VolumeConversionView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeConversionView()
    }
}

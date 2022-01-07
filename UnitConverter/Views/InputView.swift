//
//  InputView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/5/22.
//

import SwiftUI

struct InputView: View {
    let conversionType: String
    let possibleConversionTypes: [String]
    @Binding var userInput: Double
    @FocusState var userInputFocus: Bool
    @Binding var userSelectedConversion: Int
    
    var body: some View {
        Section {
            TextField("Enter a \(conversionType)", value: $userInput, format: .number).keyboardType(.decimalPad).focused($userInputFocus)
            Picker("Type of \(conversionType)", selection: $userSelectedConversion) {
                ForEach(0..<possibleConversionTypes.count) { index in
                    Text(String(possibleConversionTypes[index]))
                }
            }.pickerStyle(.segmented)
        } header: {
            Text("Enter a \(conversionType)")
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(conversionType: "Temperature", possibleConversionTypes: ["C", "F"], userInput: .constant(5.0), userSelectedConversion: .constant(0))
    }
}

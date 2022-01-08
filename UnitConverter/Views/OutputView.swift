//
//  ComplexOutputView.swift
//  UnitConverter
//
//  Created by Dante Cesa on 1/6/22.
//

import SwiftUI

struct OutputView: View {
    let output: String
    var types: [String]
    @Binding var outputSelection: Int
    var hasOutputPicker: Bool
    
    var body: some View {
        Section {
            if hasOutputPicker {
                Picker("", selection: $outputSelection) {
                    ForEach(0..<types.count) { index in
                        Text(types[index])
                    }
                }.pickerStyle(.segmented)
            }
            Text(output)
        } header: {
            Text("Output")
        }
    }
}

struct ComplexOutputView_Previews: PreviewProvider {
    static var previews: some View {
        OutputView(output: "35", types: ["C", "F"], outputSelection: .constant(0), hasOutputPicker: true)
    }
}
